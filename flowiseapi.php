<?php
/**
 * @package     Joomla.Plugin
 * @subpackage  Ajax.FlowiseAPI
 *
 * @copyright   Copyright (C) 2023 Your Name. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Import Joomla core classes
jimport('joomla.application.component.model');
jimport('joomla.event.plugin');
jimport('joomla.log.log');
// Import JsonResponse
use Joomla\CMS\Response\JsonResponse;

/**
 * FlowiseAPI Ajax Plugin
 *
 * @since  1.0.0
 */
class PlgAjaxFlowiseapi extends JPlugin
{
    /**
     * Load the language file on instantiation
     *
     * @var    boolean
     * @since  1.0.0
     */
    protected $autoloadLanguage = true;

    /**
     * Constructor
     *
     * @param   object  &$subject  The object to observe
     * @param   array   $config    An optional associative array of configuration settings.
     *
     * @since   1.0.0
     */
    public function __construct(&$subject, $config = array())
    {
        parent::__construct($subject, $config);

        // Set up logging
        JLog::addLogger(
            array(
                'text_file' => 'flowiseapi.log.php',
                'text_entry_format' => '{DATETIME} {PRIORITY} {MESSAGE}'
            ),
            JLog::ALL,
            array('flowiseapi')
        );

        JLog::add('FlowiseAPI plugin initialized', JLog::INFO, 'flowiseapi');

        // Create a file to verify the plugin is being loaded
        $logPath = JPATH_ROOT . '/tmp/flowiseapi_loaded.txt';
        @file_put_contents($logPath, date('Y-m-d H:i:s') . " - Plugin loaded\n", FILE_APPEND);
    }

    /**
     * The ajax entry point for the plugin.
     * This method is executed when the URL contains ?option=com_ajax&plugin=flowiseapi
     *
     * @return  Joomla\CMS\Response\JsonResponse|array  The JSON response object or an error array
     *
     * @since   1.0.0
     */
    public function onAjaxFlowiseapi()
    {
        try {
            JLog::add('onAjaxFlowiseapi called', JLog::INFO, 'flowiseapi');

            $app = JFactory::getApplication();
            $input = $app->input;
            $method = $input->get('method', 'getTest', 'cmd');

            JLog::add('Method requested: ' . $method, JLog::INFO, 'flowiseapi');

            if (empty($method)) {
                throw new Exception('No method specified');
            }

            $params = $input->getArray();
            unset($params['option'], $params['plugin'], $params['format']);

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
                JLog::add('Method does not exist: ' . $method, JLog::ERROR, 'flowiseapi');
                throw new Exception('Invalid method specified: ' . $method);
            }

            $reflection = new ReflectionMethod($this, $method);
            if (!$reflection->isPublic()) {
                JLog::add('Method is not public: ' . $method, JLog::ERROR, 'flowiseapi');
                throw new Exception('Method is not accessible: ' . $method);
            }

            $orderedParams = [];
            foreach ($reflection->getParameters() as $param) {
                $name = $param->getName();
                if (isset($params[$name])) {
                    $orderedParams[] = $params[$name];
                } elseif ($param->isDefaultValueAvailable()) {
                    $orderedParams[] = $param->getDefaultValue();
                } else {
                    JLog::add('Missing required parameter: ' . $name, JLog::ERROR, 'flowiseapi');
                    throw new Exception("Missing required parameter: $name");
                }
            }

            JLog::add('Invoking method: ' . $method . ' with params: ' . json_encode($orderedParams), JLog::INFO, 'flowiseapi');

            // Call the method with the right parameters
            $result = call_user_func_array(array($this, $method), $orderedParams);

            JLog::add('Method execution successful', JLog::INFO, 'flowiseapi');

            // Explicitly create a JsonResponse object for success
            // This ensures the $result array is correctly placed in the 'data' field
            return $result;

        } catch (Exception $e) {
            JLog::add('Error in AJAX handling: ' . $e->getMessage(), JLog::ERROR, 'flowiseapi');
            // Return JsonResponse for errors too, for consistency
            return new JsonResponse($e, $e->getMessage(), true); // Mark as error
        }
    }

    /**
     * Simple test method for debugging
     * 
     * @param string $param1 First test parameter (optional)
     * @param string $param2 Second test parameter (optional)
     * @return array Test response with parameters
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getTest&param1=value1&param2=value2
     */
    public function getTest($param1 = 'default1', $param2 = 'default2')
    {
        JLog::add('getTest called with: ' . $param1 . ', ' . $param2, JLog::INFO, 'flowiseapi');
        return array(
            'param1' => $param1,
            'param2' => $param2,
            'time' => date('Y-m-d H:i:s')
        );
    }

    /**
     * Get company details (including transactions, shareholders, certificates, and share price info) for companies related to a user's phone number.
     *
     * Retrieves a list of companies where the given phone number (from the 'hphone' field in table_member) is associated with a member as a shareholder or director.
     *
     * @param string $phone_number The user's phone number to filter companies by (required).
     * @param int    $limit      Optional maximum number of companies to return (default: 10).
     * @param string $orderBy    Optional field to sort companies by (default: 'name', allowed: 'name', 'clientcode').
     * @param string $orderDir   Optional sort direction ('asc' or 'desc', default: 'asc').
     *
     * @return array List of companies with detailed information. Each element in the array is an associative array representing a company,
     *               containing the following keys:
     *               - 'company_info': (object) Basic details of the company (id, name, code, etc.).
     *               - 'transactions': (array) List of transactions associated with the company. Each transaction is an object.
     *               - 'shareholders': (array) List of shareholders for the company. Each shareholder is an object with details like name, shares, etc.
     *               - 'certificates': (array) List of share certificates issued by the company. Each certificate is an associative array.
     *               - 'upcoming_share_price': (string) The latest upcoming share price from history logs, or a default message if none found.
     *               - 'company_members': (array) List of company members.
     *               - 'company_directors': (array) List of company directors.
     *
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCompanyDetails&phone_number=0123456789
     */
    public function getCompanyDetails($phone_number = '', $limit = 10, $orderBy = 'name', $orderDir = 'asc')
    {

        JLog::add('getCompanyDetails called', JLog::INFO, 'flowiseapi');
        $db = JFactory::getDbo();
        $results = array();

        try {
            // --- 2. Find all member codes with this phone number ---
            $memberQuery = $db->getQuery(true);
            $memberQuery->select($db->quoteName('code'))
                ->from($db->quoteName('#__unicornr_table_member'))
                ->where($db->quoteName('hphone') . ' = ' . $db->quote($phone_number));
            $db->setQuery($memberQuery);
            $memberCodes = $db->loadColumn();
            if ($db->getErrorNum()) {
                throw new Exception('Database error while fetching member codes by phone: ' . $db->stderr());
            }
            if (empty($memberCodes)) {
                return array('success' => true, 'data' => array(), 'message' => 'No companies found for this phone number.');
            }

            // --- 3. Find all company codes where this member is a shareholder (regmem) or director (regdir) ---
            $companyCodes = array();
            // From regmem (shareholder)
            $regmemQuery = $db->getQuery(true);
            $regmemQuery->select($db->quoteName('clientcode'))
                ->from($db->quoteName('#__unicornr_table_regmem'))
                ->where($db->quoteName('memcode') . ' IN (' . implode(',', array_map(array($db, 'quote'), $memberCodes)) . ')')
                ->where($db->quoteName('state') . ' = ' . $db->quote(1))
                ->where($db->quoteName('docease') . ' = ' . $db->quote('0000-00-00 00:00:00'));
            $db->setQuery($regmemQuery);
            $regmemCompanyCodes = $db->loadColumn();
            if ($db->getErrorNum()) {
                throw new Exception('Database error while fetching company codes from regmem: ' . $db->stderr());
            }
            // From regdir (director)
            $regdirQuery = $db->getQuery(true);
            $regdirQuery->select($db->quoteName('clientcode'))
                ->from($db->quoteName('#__unicornr_table_regdir'))
                ->where($db->quoteName('dircode') . ' IN (' . implode(',', array_map(array($db, 'quote'), $memberCodes)) . ')')
                ->where($db->quoteName('state') . ' = ' . $db->quote(1))
                ->where($db->quoteName('docease') . ' = ' . $db->quote('0000-00-00 00:00:00'));
            $db->setQuery($regdirQuery);
            $regdirCompanyCodes = $db->loadColumn();
            if ($db->getErrorNum()) {
                throw new Exception('Database error while fetching company codes from regdir: ' . $db->stderr());
            }
            $allCompanyCodes = array_unique(array_merge($regmemCompanyCodes, $regdirCompanyCodes));
            if (empty($allCompanyCodes)) {
                return array('success' => true, 'data' => array(), 'message' => 'No companies found for this phone number.');
            }

            // --- 4. Fetch Companies for these codes ---
            $companyCodesQuoted = array();
            foreach ($allCompanyCodes as $code) {
                $companyCodesQuoted[] = $db->quote($code);
            }
            $companyCodesIn = implode(',', $companyCodesQuoted);

            $companyQuery = $db->getQuery(true);
            $companyQuery->select(array(
                $db->quoteName('id'),
                $db->quoteName('clientcode'),
                $db->quoteName('name'),
                $db->quoteName('refno') . ' AS reference_number',
                $db->quoteName('curr') . ' AS currency',
                $db->quoteName('roccode') . ' AS ssm_office_code',
                $db->quoteName('lodger'),
                $db->quoteName('compattrib') . ' AS company_attribute',
                $db->quoteName('gstno') . ' AS gst_number',
                $db->quoteName('doi') . ' AS date_of_incorporation',
                $db->quoteName('countryi') . ' AS incorporation_place',
                $db->quoteName('paidcap') . ' AS paid_up_capital',
                $db->quoteName('status') . ' AS company_status',
                $db->quoteName('yearend') . ' AS financial_year_end',
                $db->quoteName('lastagm') . ' AS last_agm_date',
                $db->quoteName('lastar') . ' AS last_ar_date',
                $db->quoteName('comno') . ' AS company_number'
            ))
                ->from($db->quoteName('#__unicornr_table_clientdata', 'cd'))
                ->where($db->quoteName('cd.clientcode') . ' IN (' . $companyCodesIn . ')');

            // --- 4b. Fetch Company Members and Directors for these Companies ---
            // Only run these queries after $companyCodesIn is defined

            // Validate and apply ordering
            $allowedOrderColumns = array('name', 'clientcode');
            $orderColumn = 'cd.name'; // Default
            if (in_array(strtolower($orderBy), $allowedOrderColumns)) {
                $orderColumn = 'cd.' . strtolower($orderBy);
            }
            $direction = strtoupper($orderDir) === 'DESC' ? 'DESC' : 'ASC';
            $companyQuery->order($db->escape($orderColumn) . ' ' . $db->escape($direction));

            // Apply limit
            // if (is_numeric($limit) && $limit > 0) {
            //     $companyQuery->setLimit((int)$limit);
            // }

            $db->setQuery($companyQuery);
            $companies = $db->loadObjectList('clientcode'); // Index by clientcode for easier lookup

            if ($db->getErrorNum()) {
                throw new Exception('Database error while fetching companies: ' . $db->stderr());
            }

            if (empty($companies)) {
                JLog::add('No companies found matching search term: ' . $phone_number, JLog::INFO, 'flowiseapi');
                return array('success' => true, 'data' => array(), 'message' => 'No companies found.');
            }

            $companyCodes = array_keys($companies);
            $companyCodesQuoted = array();
            foreach ($companyCodes as $code) {
                $companyCodesQuoted[] = $db->quote($code);
            }
            $companyCodesIn = implode(',', $companyCodesQuoted);

            // --- Fetch Company Members ---
            $companyMembers = array();
            if (!empty($companyCodesIn)) {
                $memQuery = $db->getQuery(true);
                $memQuery->select(array(
                    $db->quoteName('a.clientcode'),
                    $db->quoteName('b.code'),
                    $db->quoteName('b.name'),
                ))
                    ->from($db->quoteName('#__unicornr_table_regmem', 'a'))
                    ->join('LEFT', $db->quoteName('#__unicornr_table_member', 'b') . ' ON ' . $db->quoteName('a.memcode') . ' = ' . $db->quoteName('b.code'))
                    ->join('LEFT', $db->quoteName('#__unicornr_table_shares', 'c') . ' ON ' . $db->quoteName('a.memcode') . ' = ' . $db->quoteName('c.memcode'))
                    ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
                    ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
                    ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'))
                    ->where($db->quoteName('c.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'))
                    ->group($db->quoteName('b.code'))
                    ->order($db->quoteName('b.name') . ' ASC');

                $db->setQuery($memQuery);
                $membersList = $db->loadObjectList();
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching company members: ' . $db->stderr());
                }
                foreach ($membersList as $mem) {
                    if (!isset($companyMembers[$mem->clientcode])) {
                        $companyMembers[$mem->clientcode] = array();
                    }
                    $companyMembers[$mem->clientcode][] = $mem;
                }
            }

            // --- Fetch Company Directors ---
            $companyDirectors = array();
            if (!empty($companyCodesIn)) {
                $dirQuery = $db->getQuery(true);
                $dirQuery->select(array(
                    $db->quoteName('a.clientcode'),
                    $db->quoteName('b.code'),
                    $db->quoteName('b.name')
                ))
                    ->from($db->quoteName('#__unicornr_table_regdir', 'a'))
                    ->join('LEFT', $db->quoteName('#__unicornr_table_member', 'b') . ' ON ' . $db->quoteName('a.dircode') . ' = ' . $db->quoteName('b.code'))
                    ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
                    ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
                    ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'))
                    ->order($db->quoteName('b.name') . ' ASC');

                $db->setQuery($dirQuery);
                $directorsList = $db->loadObjectList();
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching company directors: ' . $db->stderr());
                }
                foreach ($directorsList as $dir) {
                    if (!isset($companyDirectors[$dir->clientcode])) {
                        $companyDirectors[$dir->clientcode] = array();
                    }
                    $companyDirectors[$dir->clientcode][] = $dir;
                }
            }

            // --- 2. Fetch Transactions for these Companies ---
            $transactions = array();
            $allMemberCodes = array(); // Collect all member codes from all transactions
            if (!empty($companyCodesIn)) {
                $transQuery = $db->getQuery(true);
                $transQuery->select(array(
                    $db->quoteName('t.id'),
                    $db->quoteName('t.topic'),
                    $db->quoteName('t.createddate', 'event_date'), // Rename createddate
                    $db->quoteName('t.doreminder', 'do_reminder'), // Rename doreminder
                    $db->quoteName('t.remark'),
                    $db->quoteName('t.assignedcompany', 'assigned_company'), // Rename assignedcompany
                    $db->quoteName('t.assignedmember'), // Keep original for processing
                    $db->quoteName('ttype.fielddata', 'transaction_type_name'),
                    $db->quoteName('tstatus.fielddata', 'transaction_status_name')
                ))
                    ->from($db->quoteName('#__unicornr_transaction', 't'))
                    ->leftJoin($db->quoteName('#__unicornr_transaction_custom', 'ttype') . ' ON (' . $db->quoteName('t.transtype') . ' = ' . $db->quoteName('ttype.id') . ' AND ' . $db->quoteName('ttype.fieldtype') . ' = ' . $db->quote('transaction') . ')')
                    ->leftJoin($db->quoteName('#__unicornr_transaction_custom', 'tstatus') . ' ON (' . $db->quoteName('t.transstatus') . ' = ' . $db->quoteName('tstatus.id') . ' AND ' . $db->quoteName('tstatus.fieldtype') . ' = ' . $db->quote('status') . ')')
                    ->where($db->quoteName('t.assignedcompany') . ' IN (' . $companyCodesIn . ')') // Use original column name here
                    ->order($db->quoteName('t.assignedcompany') . ' ASC, ' . $db->quoteName('t.createddate') . ' DESC'); // Use original column name here

                $db->setQuery($transQuery);
                $transactionsList = $db->loadObjectList();
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching transactions: ' . $db->stderr());
                }

                // Collect all unique member codes from the assignedmember field
                foreach ($transactionsList as $tx) {
                    if (!empty($tx->assignedmember)) {
                        $codes = explode(',', $tx->assignedmember);
                        foreach ($codes as $code) {
                            $trimmedCode = trim($code);
                            if (!empty($trimmedCode)) {
                                $allMemberCodes[$trimmedCode] = 1; // Use keys for uniqueness
                            }
                        }
                    }
                }
            }

            // --- 2b. Fetch Member Names for Collected Codes ---
            $memberNamesMap = array();
            if (!empty($allMemberCodes)) {
                $memberCodesToQuery = array_keys($allMemberCodes);
                $memberCodesQuoted = array();
                foreach ($memberCodesToQuery as $code) {
                    $memberCodesQuoted[] = $db->quote($code);
                }
                $memberCodesIn = implode(',', $memberCodesQuoted);

                $memberQuery = $db->getQuery(true);
                $memberQuery->select(array($db->quoteName('code'), $db->quoteName('name')))
                    ->from($db->quoteName('#__unicornr_table_member'))
                    ->where($db->quoteName('code') . ' IN (' . $memberCodesIn . ')');

                $db->setQuery($memberQuery);
                $memberNamesList = $db->loadObjectList('code'); // Index by code
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching member names: ' . $db->stderr());
                }
                foreach ($memberNamesList as $code => $member) {
                    $memberNamesMap[$code] = $member->name;
                }
            }

            // --- 2c. Process Transactions to Add Member Names and Group ---
            $transactions = array(); // Reset and regroup
            foreach ($transactionsList as $tx) {
                $companyCode = $tx->assigned_company; // Keep the original code for grouping

                if (!isset($transactions[$companyCode])) {
                    $transactions[$companyCode] = array();
                }

                // Replace assigned_company code with name
                if (isset($companies[$companyCode])) {
                    $tx->assigned_company_name = $companies[$companyCode]->name;
                } else {
                    $tx->assigned_company_name = 'Unknown Company (' . $companyCode . ')'; // Fallback
                }
                // Optionally remove the code field if only name is desired
                // unset($tx->assigned_company);

                // Add member names
                $tx->assigned_member_names = array();
                if (!empty($tx->assignedmember)) {
                    $codes = explode(',', $tx->assignedmember);
                    foreach ($codes as $code) {
                        $trimmedCode = trim($code);
                        if (isset($memberNamesMap[$trimmedCode])) {
                            $tx->assigned_member_names[] = $memberNamesMap[$trimmedCode];
                        }
                        // Optionally include the code if name not found, or just skip
                        // else if (!empty($trimmedCode)) {
                        //     $tx->assigned_member_names[] = $trimmedCode . ' (Name not found)';
                        // }
                    }
                }
                unset($tx->assignedmember); // Remove the original code string

                $transactions[$companyCode][] = $tx;
            }

            // --- 4. Fetch Shareholders with Share Counts and Percentages from table_regmem ---
            $shareholders = array();
            if (!empty($companyCodesIn)) {
                $shQuery = $db->getQuery(true);
                $shQuery->select(array(
                    $db->quoteName('a.clientcode'),
                    $db->quoteName('a.memcode'),
                    $db->quoteName('b.name', 'member_name'),
                    $db->quoteName('a.Tnoshares', 'total_shares'),
                    $db->quoteName('a.Percent', 'share_percentage')
                ))
                    ->from($db->quoteName('#__unicornr_table_regmem', 'a'))
                    ->leftJoin($db->quoteName('#__unicornr_table_member', 'b') . ' ON ' . $db->quoteName('a.memcode') . ' = ' . $db->quoteName('b.code'))
                    ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
                    ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
                    ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'))
                    ->order($db->quoteName('a.clientcode') . ' ASC, ' . $db->quoteName('b.name') . ' ASC');

                $db->setQuery($shQuery);
                $shareholdersList = $db->loadObjectList();
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching shareholders from table_regmem: ' . $db->stderr());
                }

                // Group shareholders by company code
                foreach ($shareholdersList as $sh) {
                    // Ensure numeric types for consistency
                    $sh->total_shares = is_numeric($sh->total_shares) ? (float) $sh->total_shares : 0;
                    $sh->share_percentage = is_numeric($sh->share_percentage) ? (float) $sh->share_percentage : 0;
                    if (!isset($shareholders[$sh->clientcode])) {
                        $shareholders[$sh->clientcode] = array();
                    }
                    $shareholders[$sh->clientcode][] = $sh;
                }
            }

            // --- 5. Fetch Detailed Certificate Info for these Companies ---
            $certificates = array();
            if (!empty($companyCodesIn)) {
                $certQuery = $db->getQuery(true);
                $certQuery->select(array(
                    $db->quoteName('s.clientcode'),
                    $db->quoteName('s.certno'),
                    $db->quoteName('s.noshare'),
                    $db->quoteName('s.memcode'),
                    $db->quoteName('m.name', 'member_name'),
                    $db->quoteName('m.add1'),
                    $db->quoteName('m.add2'),
                    $db->quoteName('m.add3'),
                    $db->quoteName('m.postcode'),
                    $db->quoteName('m.town'),
                    $db->quoteName('s.tranno'),
                    $db->quoteName('s.trandate'),
                    $db->quoteName('s.docease')
                ))
                    ->from($db->quoteName('#__unicornr_table_shares', 's'))
                    ->leftJoin($db->quoteName('#__unicornr_table_member', 'm') . ' ON ' . $db->quoteName('s.memcode') . ' = ' . $db->quoteName('m.code'))
                    ->where($db->quoteName('s.clientcode') . ' IN (' . $companyCodesIn . ')')
                    ->where($db->quoteName('s.certno') . ' IS NOT NULL')
                    ->where($db->quoteName('s.certno') . ' != ' . $db->quote(''))
                    // Order by clientcode, certno, and then trandate descending to easily pick the latest relevant record per cert
                    ->order($db->quoteName('s.clientcode') . ' ASC, ' . $db->quoteName('s.certno') . ' ASC, ' . $db->quoteName('s.trandate') . ' DESC');

                $db->setQuery($certQuery);
                $certificatesList = $db->loadObjectList();
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching certificates: ' . $db->stderr());
                }

                $processedCerts = array(); // Keep track of certs already added per company
                $currentDomain = JURI::base(); // Get the base URL

                foreach ($certificatesList as $cert) {
                    $certIdentifier = $cert->clientcode . '|' . $cert->certno;

                    // Only process the latest record for each certificate number per company
                    if (!isset($processedCerts[$certIdentifier])) {
                        if (!isset($certificates[$cert->clientcode])) {
                            $certificates[$cert->clientcode] = array();
                        }

                        // Construct Member Address
                        $addressParts = array_filter([$cert->add1, $cert->add2, $cert->add3, $cert->postcode, $cert->town]);
                        $memberAddress = implode(',', $addressParts);

                        // Determine Status and Format Date of Cease
                        $isNullDate = ($cert->docease == '0000-00-00 00:00:00' || empty($cert->docease));
                        $status = $isNullDate ? 'Active' : 'Ceased';
                        $dateOfCease = $isNullDate ? '-' : JHTML::_('date', $cert->docease, 'Y-m-d'); // Format date if ceased

                        // Construct Certificate Link
                        // Ensure memcode and certno are properly URL encoded
                        $certificateLink = $currentDomain . 'index.php?option=com_ajax&plugin=pdfgenerator&format=raw&membercode=' . urlencode($cert->memcode) . '&certno=' . urlencode($cert->certno);

                        // Get Company Info (already fetched)
                        $companyInfo = $companies[$cert->clientcode];

                        $certificates[$cert->clientcode][] = array(
                            'company_name' => $companyInfo->name,
                            'company_number' => $companyInfo->company_number, // Use the aliased name
                            'certificate_number' => $cert->certno,
                            'number_of_shares' => $cert->noshare,
                            'member_code' => $cert->memcode,
                            'member_name' => $cert->member_name,
                            'member_address' => $memberAddress,
                            'transaction_number' => $cert->tranno,
                            'transaction_date' => JHTML::_('date', $cert->trandate, 'Y-m-d'), // Format date
                            'date_of_cease' => $dateOfCease,
                            'status' => $status,
                            'certificate_link' => $certificateLink
                        );

                        $processedCerts[$certIdentifier] = true; // Mark this cert for this company as processed
                    }
                }
            }

            // --- 6. Fetch Upcoming Share Price Info from History Logs ---
            // Replaces the previous "Latest Share Price Info" logic
            $upcomingSharePrices = array();
            if (!empty($companyCodesIn)) {
                $logQuery = $db->getQuery(true);
                $logQuery->select(array(
                    $db->quoteName('custom_field1', 'upcoming_price'), // Alias for clarity
                    $db->quoteName('custom_field2', 'clientcode')     // Need clientcode to map results
                ))
                    ->from($db->quoteName('#__unicornr_history_logs'))
                    ->where($db->quoteName('state') . " = " . $db->quote(1))
                    ->where($db->quoteName('custom_field2') . ' IN (' . $companyCodesIn . ')') // Filter by relevant company codes
                    ->order(array(
                        $db->quoteName('custom_field2') . ' ASC', // Group by company first
                        $db->quoteName('id') . ' DESC'           // Get the latest log entry first within each group
                    ));

                $db->setQuery($logQuery);
                $allLogEntries = $db->loadObjectList();
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching upcoming share price from logs: ' . $db->stderr());
                }

                // Filter to get only the latest log entry per company
                foreach ($allLogEntries as $logEntry) {
                    if (!isset($upcomingSharePrices[$logEntry->clientcode])) {
                        // Since ordered by id DESC, the first encountered entry for a clientcode is the latest
                        $upcomingSharePrices[$logEntry->clientcode] = !empty($logEntry->upcoming_price) ? $logEntry->upcoming_price : 'No Upcoming Share Price';
                    }
                }
            }


            // --- 7. Assemble Results ---
            foreach ($companies as $clientcode => $company) {
                $results[] = array(
                    'company_info' => $company,
                    'transactions' => isset($transactions[$clientcode]) ? $transactions[$clientcode] : array(),
                    'shareholders' => isset($shareholders[$clientcode]) ? $shareholders[$clientcode] : array(),
                    'certificates' => isset($certificates[$clientcode]) ? $certificates[$clientcode] : array(),
                    'upcoming_share_price' => isset($upcomingSharePrices[$clientcode]) ? $upcomingSharePrices[$clientcode] : 'No Upcoming Share Price',
                    'company_members' => isset($companyMembers[$clientcode]) ? $companyMembers[$clientcode] : array(),
                    'company_directors' => isset($companyDirectors[$clientcode]) ? $companyDirectors[$clientcode] : array(),
                );
            }

            JLog::add('getCompanyDetails executed successfully. Found ' . count($results) . ' companies.', JLog::INFO, 'flowiseapi');

            // Ensure we are returning the flat array of company results
            return $results; // Should return [{company1}, {company2}, ...]

        } catch (Exception $e) {
            JLog::add('Error in getCompanyDetails: ' . $e->getMessage(), JLog::ERROR, 'flowiseapi');
            // Return an empty array in case of error within this function
            return array();
        }
    }
}
