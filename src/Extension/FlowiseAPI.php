<?php
namespace Joomla\Plugin\Ajax\FlowiseAPI\Extension;

defined('_JEXEC') or die;

use Joomla\CMS\Plugin\CMSPlugin;
use Joomla\Event\Event;
use Joomla\Event\SubscriberInterface;
use Joomla\CMS\Event\Result\ResultAwareInterface;
use Joomla\CMS\Factory;
use Joomla\CMS\Log\Log;

/**
 * FlowiseAPI Plugin Class
 *
 * Handles AJAX calls, webhook verification, logging, proxying of payloads,
 * and updates template status on message_template_status_update.
 */
class FlowiseAPI extends CMSPlugin implements SubscriberInterface
{
    /**
     * Returns the events this plugin is subscribed to.
     *
     * @return array<string, mixed> Associative array of events with 'onAjaxFlowiseapi' => 'handleAjax'
     */
    public static function getSubscribedEvents(): array
    {
        return ['onAjaxFlowiseapi' => 'handleAjax'];
    }

    /**
     * Dynamically handle the AJAX request based on the provided method and parameters.
     *
     * This method acts as a router that:
     * 1. Extracts the requested method name from the input
     * 2. Finds the corresponding method in the class (case-insensitive)
     * 3. Validates method existence and accessibility
     * 4. Maps provided parameters to method parameters
     * 5. Invokes the method and returns the result
     *
     * @param Event $event The event triggering the AJAX call.
     *
     * @return void This method sets the result in the event object instead of returning directly
     *
     * @throws \Exception If the specified method does not exist, is not public, or required parameters are missing
     * 
     * @example Called via URL: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getProducts
     */
    public function handleAjax(Event $event)
    {
        $app = $this->getApplication();
        $input = $app->input;
        $method = $input->get('method', '', 'cmd');

        $params = $input->getArray();
        unset($params['option'], $params['plugin'], $params['method'], $params['format']);

        // Get all methods in this class
        $classMethods = get_class_methods($this);

        // Find the correct method name regardless of case
        $actualMethod = null;
        foreach ($classMethods as $classMethod) {
            if (strtolower($classMethod) === strtolower($method)) {
                $actualMethod = $classMethod;
                break;
            }
        }

        // If we found a matching method, use it, otherwise use the original (which will fail)
        if ($actualMethod) {
            $method = $actualMethod;
        }

        if (!method_exists($this, $method)) {
            throw new \Exception('Invalid method specified');
        }

        $reflection = new \ReflectionMethod($this, $method);
        if (!$reflection->isPublic()) {
            throw new \Exception('Invalid method specified');
        }

        $orderedParams = [];
        foreach ($reflection->getParameters() as $param) {
            $name = $param->getName();
            if (isset($params[$name])) {
                $orderedParams[] = $params[$name];
            } elseif ($param->isDefaultValueAvailable()) {
                $orderedParams[] = $param->getDefaultValue();
            } else {
                throw new \Exception("Missing required parameter: $name");
            }
        }

        $result = $reflection->invokeArgs($this, $orderedParams);

        if ($event instanceof ResultAwareInterface) {
            $event->addResult($result);
        } else {
            $results = $event->getArgument('result') ?? [];
            $results[] = $result;
            $event->setArgument('result', $results);
        }
    }

    /**
     * Get all products or filtered products from HikaShop.
     * 
     * Retrieves a list of published main products, optionally filtered by keyword or category.
     * Results are ordered by product ID in descending order (newest first).
     * 
     * @param string $keyword Optional search keyword to filter products by name, description, or code
     * @param int $limit Optional maximum number of products to return (default: 50, 0 = no limit)
     * @param int $category_id Optional category ID to filter products by specific category
     * 
     * @return array List of products with the following structure:
     *               - product_id (int): The unique product identifier
     *               - product_name (string): The name of the product
     *               - product_description (string): The product description
     *               - product_code (string): The product SKU/code
     *               - product_published (int): Publication status (1 = published)
     *               - product_sort_price (float): The base product price
     *               - discounted_price (float): Price after applying discounts (if any)
     *               - discount_amount (float): Amount of discount applied (if any)
     *               - discount_percent (float): Percentage of discount applied (if any)
     *               - images (array): List of product image file paths
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getProducts&keyword=shirt&limit=10&category_id=5
     */
    public function getProducts($keyword = '', $limit = 50, $category_id = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true)
            ->select('p.product_id, p.product_name, p.product_description, p.product_code, p.product_published, p.product_sort_price')
            ->from($db->quoteName('#__hikashop_product', 'p'))
            ->where('p.product_type = ' . $db->quote('main'))
            ->where('p.product_published = 1');

        if (!empty($keyword)) {
            $keyword = '%' . $db->escape($keyword, true) . '%';
            $query->where('(p.product_name LIKE ' . $db->quote($keyword) .
                ' OR p.product_description LIKE ' . $db->quote($keyword) .
                ' OR p.product_code LIKE ' . $db->quote($keyword) . ')');
        }

        if (!empty($category_id)) {
            $query->join('INNER', $db->quoteName('#__hikashop_product_category', 'pc') .
                ' ON p.product_id = pc.product_id')
                ->where('pc.category_id = ' . (int) $category_id);
        }

        // Add left join for discounts - adjust table and field names as needed for HikaShop schema
        $query->select('COALESCE(d.discount_flat_amount, 0) as discount_amount')
            ->select('COALESCE(d.discount_percent_amount, 0) as discount_percent')
            ->select('CASE 
                WHEN d.discount_flat_amount > 0 THEN p.product_sort_price - d.discount_flat_amount
                WHEN d.discount_percent_amount > 0 THEN p.product_sort_price * (1 - d.discount_percent_amount/100)
                ELSE p.product_sort_price
            END as discounted_price')
            ->join('LEFT', $db->quoteName('#__hikashop_discount', 'd') .
                ' ON (d.discount_product_id = p.product_id OR d.discount_product_id = 0)
                   AND d.discount_type = ' . $db->quote('discount') . '
                   AND d.discount_published = 1
                   AND (d.discount_start = ' . $db->quote('0000-00-00 00:00:00') . ' OR d.discount_start <= NOW())
                   AND (d.discount_end = ' . $db->quote('0000-00-00 00:00:00') . ' OR d.discount_end >= NOW())')
            ->group('p.product_id');  // Group by to avoid duplicate products due to join

        $query->order('p.product_id DESC');
        
        // Only set limit if limit parameter is greater than 0
        if ($limit > 0) {
            $query->setLimit($limit);
        }

        $db->setQuery($query);
        $products = $db->loadAssocList();
        
        // If we have products, get their images
        if (!empty($products)) {
            // Extract all product IDs
            $productIds = array_column($products, 'product_id');
            
            // Get all images for these products
            $query = $db->getQuery(true)
                ->select('f.file_ref_id, f.file_path')
                ->from($db->quoteName('#__hikashop_file', 'f'))
                ->where('f.file_ref_id IN (' . implode(',', $productIds) . ')')
                ->where('f.file_type = ' . $db->quote('product'))
                ->order('f.file_ordering ASC');
                
            $db->setQuery($query);
            $allImages = $db->loadAssocList();
            
            // Get Joomla site root URL to create full image URLs
            $siteRoot = rtrim(\Joomla\CMS\Uri\Uri::root(), '/');
            
            // Initialize images array for each product
            foreach ($products as &$product) {
                $product['images'] = [];
            }
            
            // Assign images to their respective products
            foreach ($allImages as $image) {
                $productId = $image['file_ref_id'];
                $imagePath = $image['file_path'];
                
                // Make it a full URL with the HikaShop upload directory
                if ($imagePath && !preg_match('/^(https?:\/\/|www\.)/', $imagePath)) {
                    // Add the HikaShop upload directory path
                    $imagePath = $siteRoot . '/images/com_hikashop/upload/' . ltrim($imagePath, '/');
                }
                
                // Find the product and add the image path
                foreach ($products as &$product) {
                    if ($product['product_id'] == $productId) {
                        $product['images'][] = $imagePath;
                        break;
                    }
                }
            }
        }
        
        return $products;
    }

    /**
     * Get all products or filtered products from HikaShop as a formatted text document.
     * 
     * Like getProducts(), but returns a text document with products in a list format,
     * each product separated by "--/!DT!!/--" delimiter.
     * 
     * @param string $keyword Optional search keyword to filter products by name, description, or code
     * @param int $limit Optional maximum number of products to return (default: 50)
     * @param int $category_id Optional category ID to filter products by specific category
     * 
     * @return string Text document containing product information in a formatted list
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getProductsAsText&keyword=shirt&limit=10&category_id=5
     */
    public function getProductsAsText($keyword = '', $limit = 50, $category_id = 0)
    {
        // Reuse the existing getProducts method to fetch the data
        $products = $this->getProducts($keyword, $limit, $category_id);

        if (empty($products)) {
            return "No products found.";
        }

        $textBlocks = [];

        foreach ($products as $product) {
            $textBlock = "Product ID: " . $product['product_id'] . "\n";
            $textBlock .= "Name: " . $product['product_name'] . "\n";
            $textBlock .= "Description: " . trim(strip_tags($product['product_description'])) . "\n";
            $textBlock .= "Code: " . $product['product_code'] . "\n";
            $textBlock .= "Regular Price: " . number_format($product['product_sort_price'], 2) . "\n";

            if ($product['discount_amount'] > 0 || $product['discount_percent'] > 0) {
                $textBlock .= "Discounted Price: " . number_format($product['discounted_price'], 2) . "\n";

                if ($product['discount_amount'] > 0) {
                    $textBlock .= "Discount Amount: " . number_format($product['discount_amount'], 2) . "\n";
                }

                if ($product['discount_percent'] > 0) {
                    $textBlock .= "Discount Percent: " . $product['discount_percent'] . "%\n";
                }
            }

            $textBlocks[] = $textBlock;
        }

        // Join all product text blocks with the specified delimiter
        return implode("--/!DT!!/--\n", $textBlocks);
    }

    /**
     * Get detailed information about a specific product.
     * 
     * Retrieves comprehensive product data including basic details, categories,
     * associated images, and discount information.
     * 
     * @param int $product_id The unique identifier of the product to retrieve
     * 
     * @return array Detailed product information with the following structure:
     *               - All product table columns (product_id, product_name, product_description, etc.)
     *               - discounted_price (float): Price after applying discounts (if any)
     *               - discount_amount (float): Amount of discount applied (if any)
     *               - discount_percent (float): Percentage of discount applied (if any)
     *               - categories (array): List of associated categories with:
     *                 - category_id (int): The category ID
     *                 - category_name (string): The category name
     *               - images (array): List of file paths to product images
     *               OR
     *               - error (string): Error message if product not found
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getProductById&product_id=42
     */
    public function getProductById($product_id)
    {
        $db = Factory::getDbo();

        // Get basic product info with discount
        $query = $db->getQuery(true)
            ->select('p.*')
            ->select('COALESCE(d.discount_flat_amount, 0) as discount_amount')
            ->select('COALESCE(d.discount_percent_amount, 0) as discount_percent')
            ->select('CASE 
                WHEN d.discount_flat_amount > 0 THEN p.product_sort_price - d.discount_flat_amount
                WHEN d.discount_percent_amount > 0 THEN p.product_sort_price * (1 - d.discount_percent_amount/100)
                ELSE p.product_sort_price
            END as discounted_price')
            ->from($db->quoteName('#__hikashop_product', 'p'))
            ->join('LEFT', $db->quoteName('#__hikashop_discount', 'd') .
                ' ON (d.discount_product_id = p.product_id OR d.discount_product_id = 0)
                   AND d.discount_type = ' . $db->quote('discount') . '
                   AND d.discount_published = 1
                   AND (d.discount_start = ' . $db->quote('0000-00-00 00:00:00') . ' OR d.discount_start <= NOW())
                   AND (d.discount_end = ' . $db->quote('0000-00-00 00:00:00') . ' OR d.discount_end >= NOW())')
            ->where('p.product_id = ' . (int) $product_id)
            ->group('p.product_id');  // To handle multiple discount records

        $db->setQuery($query);
        $product = $db->loadAssoc();

        if (!$product) {
            return ['error' => 'Product not found'];
        }

        // Get product categories
        $query = $db->getQuery(true)
            ->select('c.category_id, c.category_name')
            ->from($db->quoteName('#__hikashop_category', 'c'))
            ->join('INNER', $db->quoteName('#__hikashop_product_category', 'pc') .
                ' ON c.category_id = pc.category_id')
            ->where('pc.product_id = ' . (int) $product_id);

        $db->setQuery($query);
        $product['categories'] = $db->loadAssocList();

        // Get product images
        $query = $db->getQuery(true)
            ->select('f.file_path')
            ->from($db->quoteName('#__hikashop_file', 'f'))
            ->where('f.file_ref_id = ' . (int) $product_id)
            ->where('f.file_type = ' . $db->quote('product'));

        $db->setQuery($query);
        $product['images'] = $db->loadColumn();

        return $product;
    }

    /**
     * Get all product categories or subcategories.
     * 
     * Retrieves a list of published product categories, optionally filtered by parent category.
     * Results are ordered by category ordering.
     * 
     * @param int $parent_id Optional parent category ID to get only subcategories of a specific category
     *                       Use 0 (default) to get all categories
     * 
     * @return array List of categories with the following structure:
     *               - category_id (int): The unique category identifier
     *               - category_name (string): The name of the category
     *               - category_description (string): The category description
     *               - category_parent_id (int): The parent category ID
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCategories&parent_id=12
     */
    public function getCategories($parent_id = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true)
            ->select('c.category_id, c.category_name, c.category_description, c.category_parent_id')
            ->from($db->quoteName('#__hikashop_category', 'c'))
            ->where('c.category_type = ' . $db->quote('product'))
            ->where('c.category_published = 1');

        if ($parent_id > 0) {
            $query->where('c.category_parent_id = ' . (int) $parent_id);
        }

        $query->order('c.category_ordering ASC');

        $db->setQuery($query);
        return $db->loadAssocList();
    }

    /**
     * Get order history, optionally filtered by user.
     * 
     * Retrieves a list of orders with basic information, with optional filtering
     * by user ID and/or order status. Results are ordered by creation date (newest first).
     * 
     * @param int $user_id Optional user ID to get orders for a specific customer only
     *                     Use 0 (default) to get orders for all users
     * @param int $limit Optional maximum number of orders to return (default: 20)
     * @param string $status Optional order status filter (e.g., 'confirmed', 'shipped', 'cancelled')
     *                      Leave empty (default) to get orders with any status
     * 
     * @return array List of orders with the following structure:
     *               - order_id (int): The unique order identifier
     *               - order_number (string): The order reference number
     *               - order_full_price (float): The total order amount
     *               - order_status (string): Current status of the order
     *               - order_created (datetime): Order creation timestamp
     *               - order_ip (string): IP address used to place the order
     *               - username (string): Customer username
     *               - email (string): Customer email address
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getOrders&user_id=123&limit=10&status=confirmed
     */
    public function getOrders($user_id = 0, $limit = 20, $status = '')
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true)
            ->select('o.order_id, o.order_number, o.order_full_price, o.order_status, o.order_created, o.order_ip, u.username, u.email')
            ->from($db->quoteName('#__hikashop_order', 'o'))
            ->join('LEFT', $db->quoteName('#__users', 'u') . ' ON o.order_user_id = u.id');

        if (!empty($user_id)) {
            $query->where('o.order_user_id = ' . (int) $user_id);
        }

        if (!empty($status)) {
            $query->where('o.order_status = ' . $db->quote($status));
        }

        $query->order('o.order_created DESC')
            ->setLimit($limit);

        $db->setQuery($query);
        return $db->loadAssocList();
    }

    /**
     * Get detailed information about a specific order.
     * 
     * Retrieves comprehensive order data including basic order details, shipping address,
     * and all products included in the order.
     * 
     * @param int $order_id The unique identifier of the order to retrieve
     * 
     * @return array Detailed order information with the following structure:
     *               - All order table columns (order_id, order_number, order_full_price, etc.)
     *               - Shipping address details (address_firstname, address_lastname, etc.)
     *               - products (array): List of products in the order with:
     *                 - order_product_id, product_id, order_id, etc.
     *                 - product_name (string): The name of the product
     *                 - product_code (string): The product SKU/code
     *               OR
     *               - error (string): Error message if order not found
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getOrderById&order_id=5678
     */
    public function getOrderById($order_id)
    {
        $db = Factory::getDbo();

        // Get order info
        $query = $db->getQuery(true)
            ->select('o.*, a.address_firstname, a.address_lastname, a.address_street, a.address_city, a.address_post_code, a.address_country')
            ->from($db->quoteName('#__hikashop_order', 'o'))
            ->join('LEFT', $db->quoteName('#__hikashop_address', 'a') . ' ON o.order_shipping_address_id = a.address_id')
            ->where('o.order_id = ' . (int) $order_id);

        $db->setQuery($query);
        $order = $db->loadAssoc();

        if (!$order) {
            return ['error' => 'Order not found'];
        }

        // Get order products
        $query = $db->getQuery(true)
            ->select('op.*, p.product_name, p.product_code')
            ->from($db->quoteName('#__hikashop_order_product', 'op'))
            ->join('LEFT', $db->quoteName('#__hikashop_product', 'p') . ' ON op.product_id = p.product_id')
            ->where('op.order_id = ' . (int) $order_id);

        $db->setQuery($query);
        $order['products'] = $db->loadAssocList();

        return $order;
    }

    /**
     * Search for specific products based on various criteria.
     * 
     * Performs a detailed search for products matching a keyword and optional price range.
     * Results are ordered alphabetically by product name.
     * 
     * @param string $keyword Required search keyword to find in name, description, or code
     * @param float $min_price Optional minimum price for filtering results (default: 0)
     *                        Set to greater than 0 to filter out products below this price
     * @param float $max_price Optional maximum price for filtering results (default: 0)
     *                        Set to greater than 0 to filter out products above this price
     * 
     * @return array List of matching products with the following structure:
     *               - product_id (int): The unique product identifier
     *               - product_name (string): The name of the product
     *               - product_description (string): The product description
     *               - product_code (string): The product SKU/code
     *               - product_sort_price (float): The base product price
     *               - discounted_price (float): Price after applying discounts (if any)
     *               - discount_amount (float): Amount of discount applied (if any)
     *               - discount_percent (float): Percentage of discount applied (if any)
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=searchProducts&keyword=jacket&min_price=50&max_price=200
     */
    public function searchProducts($keyword, $min_price = 0, $max_price = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true)
            ->select('p.product_id, p.product_name, p.product_description, p.product_code, p.product_sort_price')
            ->select('COALESCE(d.discount_flat_amount, 0) as discount_amount')
            ->select('COALESCE(d.discount_percent_amount, 0) as discount_percent')
            ->select('CASE 
                WHEN d.discount_flat_amount > 0 THEN p.product_sort_price - d.discount_flat_amount
                WHEN d.discount_percent_amount > 0 THEN p.product_sort_price * (1 - d.discount_percent_amount/100)
                ELSE p.product_sort_price
            END as discounted_price')
            ->from($db->quoteName('#__hikashop_product', 'p'))
            ->join('LEFT', $db->quoteName('#__hikashop_discount', 'd') .
                ' ON (d.discount_product_id = p.product_id OR d.discount_product_id = 0)
                   AND d.discount_type = ' . $db->quote('discount') . '
                   AND d.discount_published = 1
                   AND (d.discount_start = ' . $db->quote('0000-00-00 00:00:00') . ' OR d.discount_start <= NOW())
                   AND (d.discount_end = ' . $db->quote('0000-00-00 00:00:00') . ' OR d.discount_end >= NOW())')
            ->where('p.product_type = ' . $db->quote('main'))
            ->where('p.product_published = 1')
            ->group('p.product_id');  // Group by to avoid duplicate products due to join

        $keyword = '%' . $db->escape($keyword, true) . '%';
        $query->where('(p.product_name LIKE ' . $db->quote($keyword) .
            ' OR p.product_description LIKE ' . $db->quote($keyword) .
            ' OR p.product_code LIKE ' . $db->quote($keyword) . ')');

        // Apply price filters to the calculated discounted price
        if ($min_price > 0) {
            $query->having('discounted_price >= ' . (float) $min_price);
        }

        if ($max_price > 0) {
            $query->having('discounted_price <= ' . (float) $max_price);
        }

        $query->order('p.product_name ASC');

        $db->setQuery($query);
        return $db->loadAssocList();
    }

    /**
     * Get detailed customer information by user ID.
     * 
     * Retrieves comprehensive customer data including basic user details, addresses,
     * order count, and total spent amount.
     * 
     * @param int $user_id The unique identifier of the user/customer to retrieve
     * 
     * @return array Detailed customer information with the following structure:
     *               - id (int): User ID
     *               - name (string): Full name
     *               - username (string): Username
     *               - email (string): Email address
     *               - registerDate (datetime): Registration date
     *               - addresses (array): List of customer addresses with all address fields
     *               - order_count (int): Total number of confirmed orders
     *               - total_spent (float): Total amount spent on confirmed orders
     *               OR
     *               - error (string): Error message if user not found
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCustomerInfo&user_id=123
     */
    public function getCustomerInfo($user_id)
    {
        $db = Factory::getDbo();

        // Get user data
        $query = $db->getQuery(true)
            ->select('u.id, u.name, u.username, u.email, u.registerDate')
            ->from($db->quoteName('#__users', 'u'))
            ->where('u.id = ' . (int) $user_id);

        $db->setQuery($query);
        $user = $db->loadAssoc();

        if (!$user) {
            return ['error' => 'User not found'];
        }

        // Get addresses
        $query = $db->getQuery(true)
            ->select('a.*')
            ->from($db->quoteName('#__hikashop_address', 'a'))
            ->where('a.address_user_id = ' . (int) $user_id);

        $db->setQuery($query);
        $user['addresses'] = $db->loadAssocList();

        // Get order count and total spent
        $query = $db->getQuery(true)
            ->select('COUNT(o.order_id) as order_count, SUM(o.order_full_price) as total_spent')
            ->from($db->quoteName('#__hikashop_order', 'o'))
            ->where('o.order_user_id = ' . (int) $user_id)
            ->where('o.order_status = ' . $db->quote('confirmed'));

        $db->setQuery($query);
        $orderStats = $db->loadAssoc();
        $user['order_count'] = $orderStats['order_count'];
        $user['total_spent'] = $orderStats['total_spent'];

        return $user;
    }
}
