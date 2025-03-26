# FlowiseAPI Plugin for Joomla

This plugin provides an AJAX API interface for Flowise AI integration with Joomla sites. It enables seamless communication between Flowise AI chatbots/workflows and your Joomla website data, particularly focused on HikaShop e-commerce data.

## Overview

The FlowiseAPI plugin creates standardized endpoints that can be used by Flowise AI to:
- Retrieve product information
- Search products with various filters
- Get product categories
- Access order information
- Retrieve customer details

This creates a foundation for building AI-powered shopping assistants, customer service bots, and other AI applications that need to access your site's e-commerce data.

## Installation

1. Download the plugin package
2. Login to your Joomla administrator dashboard
3. Navigate to Extensions → Manage → Install
4. Upload and install the plugin package
5. Go to Extensions → Plugins
6. Find "Ajax - DT Flowise API" and enable it

## Usage

The plugin exposes various methods that can be accessed via AJAX calls to the following endpoint:

```
https://your-joomla-site.com/index.php?option=com_ajax&plugin=flowiseapi&format=json&method=METHOD_NAME
```

Replace `METHOD_NAME` with one of the available methods listed below, and add any required parameters.

## Available Methods

### Product Information

#### `getProducts`
Retrieves a list of products, optionally filtered.

Parameters:
- `keyword` (optional): Search term to filter products
- `limit` (optional): Maximum number of products to return (default: 50)
- `category_id` (optional): Filter by category ID

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getProducts&keyword=shirt&limit=10&category_id=5
```

#### `getProductsAsText`
Same as `getProducts` but returns data in a formatted text format suitable for AI processing.

#### `getProductById`
Get detailed information about a specific product.

Parameters:
- `product_id` (required): The product ID to retrieve

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getProductById&product_id=42
```

#### `searchProducts`
Advanced product search with price filtering.

Parameters:
- `keyword` (required): Search term
- `min_price` (optional): Minimum price filter
- `max_price` (optional): Maximum price filter

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=searchProducts&keyword=jacket&min_price=50&max_price=200
```

### Categories

#### `getCategories`
Get product categories.

Parameters:
- `parent_id` (optional): Get subcategories of this category ID

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCategories&parent_id=12
```

### Orders

#### `getOrders`
Get order history.

Parameters:
- `user_id` (optional): Filter orders by user ID
- `limit` (optional): Maximum number of orders to return (default: 20)
- `status` (optional): Filter by order status

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getOrders&user_id=123&limit=10&status=confirmed
```

#### `getOrderById`
Get detailed information about a specific order.

Parameters:
- `order_id` (required): The order ID to retrieve

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getOrderById&order_id=5678
```

### Customer Information

#### `getCustomerInfo`
Get comprehensive customer information.

Parameters:
- `user_id` (required): The user ID to retrieve

Example:
```
index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCustomerInfo&user_id=123
```

## Integration with Flowise AI

To integrate with Flowise AI:

1. Create an API tool node in Flowise that points to your Joomla site
2. Set the appropriate endpoint URLs using the formats provided above
3. Parse the JSON response in Flowise workflows
4. Connect to chatbot or other AI workflows

For text-based LLM processing, the `getProductsAsText` method provides data in a format that's easier for large language models to process.

## Security Considerations

This plugin exposes e-commerce data through API endpoints. Consider:

1. Implementing authentication for sensitive methods
2. Adding rate limiting to prevent abuse
3. Restricting access to specific IP addresses if using in a controlled environment

## Troubleshooting

If you encounter issues:

1. Check that the plugin is enabled
2. Verify that HikaShop is installed and configured
3. Ensure your database tables match the expected schema
4. Check Joomla logs for any SQL errors or warnings

## License

This plugin is released under the GNU General Public License v2 or later.

## Support

For support, please contact the plugin author or visit our support forums.
