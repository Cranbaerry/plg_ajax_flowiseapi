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
     * Get company details including transactions, shareholders, certificates, and share price info.
     * 
     * Retrieves a list of companies matching the search term, along with their associated data.
     * 
     * @param string $searchTerm Optional search term to filter companies by name or code.
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
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCompanyDetails&searchTerm=TestCompany
     */
    public function getCompanyDetails($searchTerm = '', $limit = 10, $orderBy = 'name', $orderDir = 'asc')
    {
        JLog::add('getCompanyDetails called with searchTerm: ' . $searchTerm . ', limit: ' . $limit, JLog::INFO, 'flowiseapi');
        $db = JFactory::getDbo();
        $results = array();

        try {
            // --- 1. Fetch Companies ---
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
                $db->quoteName('comno') . ' AS company_number' // Alias comno from previous step
            ))
            ->from($db->quoteName('#__unicornr_table_clientdata', 'cd'));

            if (!empty($searchTerm)) {
                $searchTermQuoted = $db->quote('%' . $db->escape($searchTerm, true) . '%', false);
                $companyQuery->where('(' . $db->quoteName('cd.name') . ' LIKE ' . $searchTermQuoted . ' OR ' . $db->quoteName('cd.clientcode') . ' LIKE ' . $searchTermQuoted . ')');
            }

            // Validate and apply ordering
            $allowedOrderColumns = array('name', 'clientcode');
            $orderColumn = 'cd.name'; // Default
            if (in_array(strtolower($orderBy), $allowedOrderColumns)) {
                $orderColumn = 'cd.' . strtolower($orderBy);
            }
            $direction = strtoupper($orderDir) === 'DESC' ? 'DESC' : 'ASC';
            $companyQuery->order($db->escape($orderColumn) . ' ' . $db->escape($direction));

            // Apply limit
            if (is_numeric($limit) && $limit > 0) {
                $companyQuery->setLimit((int)$limit);
            }

            $db->setQuery($companyQuery);
            $companies = $db->loadObjectList('clientcode'); // Index by clientcode for easier lookup

            if ($db->getErrorNum()) {
                throw new Exception('Database error while fetching companies: ' . $db->stderr());
            }

            if (empty($companies)) {
                JLog::add('No companies found matching search term: ' . $searchTerm, JLog::INFO, 'flowiseapi');
                return array('success' => true, 'data' => array(), 'message' => 'No companies found.');
            }

            $companyCodes = array_keys($companies);
            $companyCodesQuoted = array();
            foreach ($companyCodes as $code) {
                $companyCodesQuoted[] = $db->quote($code);
            }
            $companyCodesIn = implode(',', $companyCodesQuoted);

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

            // --- 3. Fetch Total Active Shares per Company ---
            $companyTotalShares = array();
            if (!empty($companyCodesIn)) {
                $totalSharesQuery = $db->getQuery(true);
                $totalSharesQuery->select(array(
                    $db->quoteName('clientcode'),
                    'SUM(' . $db->quoteName('noshare') . ') AS total_shares'
                ))
                ->from($db->quoteName('#__unicornr_table_shares'))
                ->where($db->quoteName('clientcode') . ' IN (' . $companyCodesIn . ')')
                ->where('(' . $db->quoteName('docease') . ' IS NULL OR ' . $db->quoteName('docease') . ' = ' . $db->quote('0000-00-00 00:00:00') . ')') // Active shares
                ->where($db->quoteName('trantype') . ' != ' . $db->quote('CANCELLED')) // Exclude cancelled transactions
                ->group($db->quoteName('clientcode'));

                $db->setQuery($totalSharesQuery);
                $totalSharesList = $db->loadObjectList('clientcode');
                if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching total company shares: ' . $db->stderr());
                }
                foreach ($totalSharesList as $code => $data) {
                    $companyTotalShares[$code] = (float) $data->total_shares; // Store as float
                }
            }


            // --- 4. Fetch Shareholders with Share Counts and Percentages ---
            $shareholders = array();
             if (!empty($companyCodesIn)) {
                // Query shares table, group by member, sum shares, join member details
                $shQuery = $db->getQuery(true);
                $shQuery->select(array(
                    $db->quoteName('s.clientcode'),
                    $db->quoteName('s.memcode'),
                    $db->quoteName('m.name', 'member_name'),
                    $db->quoteName('m.idtype'),
                    $db->quoteName('m.icno'),
                    $db->quoteName('m.passport'),
                    'SUM(' . $db->quoteName('s.noshare') . ') AS total_member_shares' // Sum shares per member
                ))
                ->from($db->quoteName('#__unicornr_table_shares', 's'))
                ->leftJoin($db->quoteName('#__unicornr_table_member', 'm') . ' ON ' . $db->quoteName('s.memcode') . ' = ' . $db->quoteName('m.code'))
                ->where($db->quoteName('s.clientcode') . ' IN (' . $companyCodesIn . ')')
                ->where('(' . $db->quoteName('s.docease') . ' IS NULL OR ' . $db->quoteName('s.docease') . ' = ' . $db->quote('0000-00-00 00:00:00') . ')') // Active shares
                ->where($db->quoteName('s.trantype') . ' != ' . $db->quote('CANCELLED')) // Exclude cancelled transactions
                ->group(array(
                    $db->quoteName('s.clientcode'),
                    $db->quoteName('s.memcode'),
                    $db->quoteName('m.name'), // Include non-aggregated columns used in SELECT
                    $db->quoteName('m.idtype'),
                    $db->quoteName('m.icno'),
                    $db->quoteName('m.passport')
                ))
                ->order($db->quoteName('s.clientcode') . ' ASC, ' . $db->quoteName('m.name') . ' ASC');

                $db->setQuery($shQuery);
                $shareholdersList = $db->loadObjectList();
                 if ($db->getErrorNum()) {
                    throw new Exception('Database error while fetching shareholders and share counts: ' . $db->stderr());
                }

                // Group shareholders by company code
                foreach ($shareholdersList as $sh) {
                    // Ensure numeric types for consistency, handle potential non-numeric values if necessary
                    $sh->total_shares = is_numeric($sh->total_shares) ? (float) $sh->total_shares : 0;
                    // $sh->share_percentage = is_numeric($sh->share_percentage) ? (float) $sh->share_percentage : 0; // Removed as per user request

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
                    $db->quoteName('m.add1'), $db->quoteName('m.add2'), $db->quoteName('m.add3'),
                    $db->quoteName('m.postcode'), $db->quoteName('m.town'),
                    $db->quoteName('s.sharecls'),
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
                            'share_class' => $cert->sharecls,
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
                     // Use the new upcoming share price data
                     'upcoming_share_price' => isset($upcomingSharePrices[$clientcode]) ? $upcomingSharePrices[$clientcode] : 'No Upcoming Share Price',
                     // Remove or keep 'latest_share_info' depending on requirements
                     // 'latest_share_info' => isset($sharePrices[$clientcode]) ? $sharePrices[$clientcode] : null, // Commented out old field
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
