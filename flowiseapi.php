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
    protected $db;

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
        $this->db = JFactory::getDbo();
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
     * Get basic company details associated with a phone number.
     */
    public function getCompanyList($phonenumber, $limit = 10, $orderby = 'name', $orderdir = 'asc')
    {
        // Fetch member codes by phone
        $memberQuery = $this->db->getQuery(true)
            ->select('code')
            ->from('#__unicornr_table_member')
            ->where('hphone = ' . $this->db->quote($phonenumber));
        $this->db->setQuery($memberQuery);
        $memberCodes = $this->db->loadColumn();
        if (empty($memberCodes)) {
            return [];
        }

        // Fetch company codes from regmem and regdir
        $quotedMembers = array_map([$this->db, 'quote'], $memberCodes);
        $inMembers = implode(',', $quotedMembers);

        $regmemQ = $this->db->getQuery(true)
            ->select('clientcode')
            ->from('#__unicornr_table_regmem')
            ->where("memcode IN ($inMembers)")
            ->where("state = 1 AND docease = '0000-00-00 00:00:00'");
        $this->db->setQuery($regmemQ);
        $memCompanies = $this->db->loadColumn();

        $regdirQ = $this->db->getQuery(true)
            ->select('clientcode')
            ->from('#__unicornr_table_regdir')
            ->where("dircode IN ($inMembers)")
            ->where("state = 1 AND docease = '0000-00-00 00:00:00'");
        $this->db->setQuery($regdirQ);
        $dirCompanies = $this->db->loadColumn();

        $companyCodes = array_unique(array_merge($memCompanies, $dirCompanies));
        if (empty($companyCodes)) {
            return [];
        }

        // Fetch companies info
        $quotedCompanies = array_map([$this->db, 'quote'], $companyCodes);
        $inCompanies = implode(',', $quotedCompanies);

        $allowed = ['name', 'clientcode'];
        $orderColumn = in_array(strtolower($orderby), $allowed) ? $orderby : 'name';
        $direction = strtoupper($orderdir) === 'DESC' ? 'DESC' : 'ASC';

        $companyQ = $this->db->getQuery(true)
            ->select([
                'comno AS company_number',
                'clientcode',
                'name',
                'refno AS reference_number',
                'curr AS currency',
                'roccode',
                'lodger',
                'compattrib',
                'gstno',
                'doi',
                'countryi',
                'paidcap',
                'status',
                'yearend',
            ])
            ->from('#__unicornr_table_clientdata')
            ->where("clientcode IN ($inCompanies)")
            ->order($orderColumn . ' ' . $direction)
            ->setLimit((int) $limit);
        $this->db->setQuery($companyQ);
        $companies = $this->db->loadObjectList('clientcode'); // index by clientcode

        // Fetch share info for all companies and all members
        $shareQ = $this->db->getQuery(true)
            ->select(['clientcode', 'memcode', 'Tnoshares AS total_shares', 'Percent AS share_percentage'])
            ->from('#__unicornr_table_regmem')
            ->where('clientcode IN (' . $inCompanies . ')')
            ->where("state = 1 AND docease = '0000-00-00 00:00:00'");
        $this->db->setQuery($shareQ);
        $shareRows = $this->db->loadObjectList();

        // Build a map: [clientcode][memcode] => [total_shares, share_percentage]
        $shareMap = [];
        foreach ($shareRows as $row) {
            $shareMap[$row->clientcode][$row->memcode] = [
                'total_shares' => (float) $row->total_shares,
                'share_percentage' => (float) $row->share_percentage
            ];
        }

        // For each company, fetch the latest upcoming share price and user's shares/percentage
        foreach ($companies as $clientcode => &$company) {
            // Upcoming share price
            $priceQ = $this->db->getQuery(true)
                ->select('custom_field1')
                ->from('#__unicornr_history_logs')
                ->where('state=1')
                ->where('custom_field2=' . $this->db->quote($company->clientcode))
                ->order('id DESC')
                ->setLimit(1);
            $this->db->setQuery($priceQ);
            $company->upcoming_share_price = $this->db->loadResult() ?: 'No Upcoming Share Price';

            // User's total shares and share percentage for this company
            $user_total_shares = 0;
            $user_share_percentage = 0;
            if (isset($shareMap[$clientcode])) {
                foreach ($memberCodes as $memcode) {
                    if (isset($shareMap[$clientcode][$memcode])) {
                        $user_total_shares += $shareMap[$clientcode][$memcode]['total_shares'];
                        $user_share_percentage += $shareMap[$clientcode][$memcode]['share_percentage'];
                    }
                }
            }
            $company->user_total_shares = $user_total_shares;
            $company->user_share_percentage = $user_share_percentage;

            // Fetch last transactions for this company, ordered by event date descending
            $transQ = $this->db->getQuery(true)
                ->select([
                    't.id',
                    't.topic',
                    't.createddate AS event_date',
                    't.remark',
                    't.assignedcompany AS assigned_company',
                    't.assignedmember',
                    'ttype.fielddata AS transaction_type_name',
                    'tstatus.fielddata AS transaction_status_name'
                ])
                ->from('#__unicornr_transaction AS t')
                ->leftJoin('#__unicornr_transaction_custom AS ttype ON t.transtype = ttype.id AND ttype.fieldtype = ' . $this->db->quote('transaction'))
                ->leftJoin('#__unicornr_transaction_custom AS tstatus ON t.transstatus = tstatus.id AND tstatus.fieldtype = ' . $this->db->quote('status'))
                ->where('t.assignedcompany = ' . $this->db->quote($clientcode))
                ->order('t.createddate DESC')
                ->setLimit(5);
            $this->db->setQuery($transQ);
            $transactionsList = $this->db->loadObjectList();

            // Collect all unique member codes from assignedmember field
            $allMemberCodes = [];
            foreach ($transactionsList as $tx) {
                if (!empty($tx->assignedmember)) {
                    $codes = explode(',', $tx->assignedmember);
                    foreach ($codes as $code) {
                        $trimmedCode = trim($code);
                        if (!empty($trimmedCode)) {
                            $allMemberCodes[$trimmedCode] = 1;
                        }
                    }
                }
            }

            // Fetch member names for these codes
            $memberNamesMap = [];
            if (!empty($allMemberCodes)) {
                $memberCodesToQuery = array_keys($allMemberCodes);
                $memberCodesQuoted = array_map([$this->db, 'quote'], $memberCodesToQuery);
                $memberCodesIn = implode(',', $memberCodesQuoted);
                $memberQuery = $this->db->getQuery(true)
                    ->select(['code', 'name'])
                    ->from('#__unicornr_table_member')
                    ->where('code IN (' . $memberCodesIn . ')');
                $this->db->setQuery($memberQuery);
                $memberNamesList = $this->db->loadObjectList('code');
                foreach ($memberNamesList as $code => $member) {
                    $memberNamesMap[$code] = $member->name;
                }
            }

            // Add member names to transactions
            foreach ($transactionsList as &$tx) {
                // Remove unwanted fields from each transaction
                unset($tx->assigned_member_names);
                unset($tx->assignedmember);
                unset($tx->assigned_company);
                unset($tx->do_reminder);
                unset($tx->id);
            }
            unset($tx); // break reference

            //$company->last_transactions = $transactionsList;
        }
        // Return as a flat array (not indexed by clientcode)
        return array_values($companies);
    }

    /**
     * Get members, directors, and share price for a given company.
     */
    public function getCompanyMembers($phonenumber, $companynumber)
    {
        // Find the clientcode for this company number
        $clientcodeQ = $this->db->getQuery(true)
            ->select('clientcode')
            ->from('#__unicornr_table_clientdata')
            ->where('comno = ' . $this->db->quote($companynumber));
        $this->db->setQuery($clientcodeQ);
        $clientcode = $this->db->loadResult();
        if (empty($clientcode)) return [];

        // Validate association
        // Fetch member codes
        $memberQuery = $this->db->getQuery(true)
            ->select('code')->from('#__unicornr_table_member')
            ->where('hphone = ' . $this->db->quote($phonenumber));
        $this->db->setQuery($memberQuery);
        $memberCodes = $this->db->loadColumn();

        if (empty($memberCodes)) {
            return [];
        }
        $inMembers = implode(',', array_map([$this->db, 'quote'], $memberCodes));

        // Check in regmem/regdir
        $assocQ = $this->db->getQuery(true)
            ->select('1')->from('#__unicornr_table_regmem')
            ->where("clientcode = " . $this->db->quote($clientcode))
            ->where("memcode IN ($inMembers)")
            ->union(
                (clone $this->db->getQuery(true))
                    ->select('1')->from('#__unicornr_table_regdir')
                    ->where("clientcode = " . $this->db->quote($clientcode))
                    ->where("dircode IN ($inMembers)")
            );
        $this->db->setQuery($assocQ);
        if (!$this->db->loadResult()) {
            return [];
        }

        // Fetch share info
        $shareQ = $this->db->getQuery(true)
            ->select(['memcode', 'Tnoshares AS total_shares', 'Percent AS share_percentage'])
            ->from('#__unicornr_table_regmem')
            ->where('clientcode = ' . $this->db->quote($clientcode))
            ->where("state = 1 AND docease = '0000-00-00 00:00:00'");
        $this->db->setQuery($shareQ);
        $shareholders = $this->db->loadObjectList();

        // Map shares
        $shareMap = [];
        foreach ($shareholders as $sh) {
            $shareMap[$sh->memcode] = [
                'total_shares'    => (float) $sh->total_shares,
                'share_percentage' => (float) $sh->share_percentage
            ];
        }

        // Fetch members
        $memQ = $this->db->getQuery(true)
            ->select(['b.code', 'b.name'])
            ->from('#__unicornr_table_regmem AS a')
            ->join('LEFT', '#__unicornr_table_member AS b ON a.memcode=b.code')
            ->where('a.clientcode=' . $this->db->quote($clientcode))
            ->where("a.state = 1 AND a.docease='0000-00-00 00:00:00'")
            ->order('b.name ASC');
        $this->db->setQuery($memQ);
        $members = [];
        foreach ($this->db->loadObjectList() as $m) {
            $m->total_shares    = $shareMap[$m->code]['total_shares']    ?? 0;
            $m->share_percentage = $shareMap[$m->code]['share_percentage'] ?? 0;
            $members[] = $m;
        }

        // Fetch directors similarly
        $dirQ = $this->db->getQuery(true)
            ->select(['b.code', 'b.name'])
            ->from('#__unicornr_table_regdir AS a')
            ->join('LEFT', '#__unicornr_table_member AS b ON a.dircode=b.code')
            ->where('a.clientcode=' . $this->db->quote($clientcode))
            ->where("a.state = 1 AND a.docease='0000-00-00 00:00:00'")
            ->order('b.name ASC');
        $this->db->setQuery($dirQ);
        $directors = [];
        foreach ($this->db->loadObjectList() as $d) {
            $d->total_shares    = $shareMap[$d->code]['total_shares']    ?? 0;
            $d->share_percentage = $shareMap[$d->code]['share_percentage'] ?? 0;
            $directors[] = $d;
        }

        // Fetch latest share price
        $priceQ = $this->db->getQuery(true)
            ->select('custom_field1')->from('#__unicornr_history_logs')
            ->where('state=1')->where('custom_field2=' . $this->db->quote($clientcode))
            ->order('id DESC')->setLimit(1);
        $this->db->setQuery($priceQ);
        $price = $this->db->loadResult() ?: 'No Upcoming Share Price';

        return [
            'members'        => $members,
            'directors'      => $directors,
            'upcoming_price' => $price
        ];
    }

    /**
     * Get certificate details for a given company.
     */
    public function getCompanyCertificates($phonenumber, $companynumber)
    {
        // Find the clientcode for this company number
        $clientcodeQ = $this->db->getQuery(true)
            ->select('clientcode')
            ->from('#__unicornr_table_clientdata')
            ->where('comno = ' . $this->db->quote($companynumber));
        $this->db->setQuery($clientcodeQ);
        $clientcode = $this->db->loadResult();
        if (empty($clientcode)) return [];

        // Validate association (reuse logic from getCompanyMembers start)
        $memberQuery = $this->db->getQuery(true)
            ->select('code')->from('#__unicornr_table_member')
            ->where('hphone = ' . $this->db->quote($phonenumber));
        $this->db->setQuery($memberQuery);
        $memberCodes = $this->db->loadColumn();
        if (empty($memberCodes)) return [];
        $inMembers = implode(',', array_map([$this->db, 'quote'], $memberCodes));
        $assocQ = $this->db->getQuery(true)
            ->select('1')->from('#__unicornr_table_regmem')
            ->where("clientcode = " . $this->db->quote($clientcode))
            ->where("memcode IN ($inMembers)")
            ->union(
                (clone $this->db->getQuery(true))
                    ->select('1')->from('#__unicornr_table_regdir')
                    ->where("clientcode = " . $this->db->quote($clientcode))
                    ->where("dircode IN ($inMembers)")
            );
        $this->db->setQuery($assocQ);
        if (!$this->db->loadResult()) return [];

        // Fetch certificates ONLY for the member(s) associated with the phone number
        $certQ = $this->db->getQuery(true)
            ->select([
                's.certno',
                's.noshare',
                's.memcode',
                'm.name AS member_name',
                'm.add1',
                'm.add2',
                'm.add3',
                'm.postcode',
                'm.town',
                's.tranno',
                's.trandate',
                's.docease'
            ])
            ->from('#__unicornr_table_shares AS s')
            ->leftJoin('#__unicornr_table_member AS m ON s.memcode=m.code')
            ->where('s.clientcode=' . $this->db->quote($clientcode))
            ->where("s.certno IS NOT NULL AND s.certno!=''")
            ->where('s.memcode IN (' . $inMembers . ')')
            ->order('s.certno ASC, s.trandate DESC');
        $this->db->setQuery($certQ);
        $rows = $this->db->loadObjectList();

        $seen = [];
        $baseUrl = JURI::base();
        $certs = [];

        foreach ($rows as $row) {
            if (isset($seen[$row->certno])) continue;
            $seen[$row->certno] = true;

            $address = implode(', ', array_filter([
                $row->add1,
                $row->add2,
                $row->add3,
                $row->postcode,
                $row->town
            ]));
            $active = ($row->docease === '0000-00-00 00:00:00');

            $certs[] = [
                'certificate_number' => $row->certno,
                'number_of_shares'   => $row->noshare,
                'member_name'        => $row->member_name,
                'member_address'     => $address,
                'transaction_date'   => date('Y-m-d', strtotime($row->trandate)),
                'status'             => $active ? 'Active' : 'Ceased',
                'certificate_link'   => $baseUrl
                    . 'index.php?option=com_ajax&plugin=pdfgenerator&format=raw'
                    . '&membercode=' . urlencode($row->memcode)
                    . '&certno='    . urlencode($row->certno)
            ];
        }

        return $certs;
    }

    /**
     * Get all transactions for a company, only if the user (by phone number) is associated as a shareholder or director.
     *
     * @param string $phoneNumber The user's phone number (required).
     * @param string $companyCode The company code (clientcode) to fetch transactions for (required).
     * @return array List of transactions for the company, or empty array if not associated.
     */
    public function getCompanyTransactions($phonenumber, $companynumber)
    {
        // 1. Find the clientcode for this company number
        $clientcodeQ = $this->db->getQuery(true)
            ->select('clientcode')
            ->from('#__unicornr_table_clientdata')
            ->where('comno = ' . $this->db->quote($companynumber));
        $this->db->setQuery($clientcodeQ);
        $clientcode = $this->db->loadResult();
        if (empty($clientcode)) return [];

        // 2. Find member codes for this phone number
        $memberQuery = $this->db->getQuery(true)
            ->select('code')
            ->from('#__unicornr_table_member')
            ->where('hphone = ' . $this->db->quote($phonenumber));
        $this->db->setQuery($memberQuery);
        $memberCodes = $this->db->loadColumn();
        if (empty($memberCodes)) {
            return [];
        }
        $inMembers = implode(',', array_map([$this->db, 'quote'], $memberCodes));

        // 3. Check association in regmem/regdir
        $assocQ = $this->db->getQuery(true)
            ->select('1')->from('#__unicornr_table_regmem')
            ->where('clientcode = ' . $this->db->quote($clientcode))
            ->where('memcode IN (' . $inMembers . ')')
            ->union(
                (clone $this->db->getQuery(true))
                    ->select('1')->from('#__unicornr_table_regdir')
                    ->where('clientcode = ' . $this->db->quote($clientcode))
                    ->where('dircode IN (' . $inMembers . ')')
            );
        $this->db->setQuery($assocQ);
        if (!$this->db->loadResult()) {
            return [];
        }

        // 4. Fetch transactions for this company
        $transQuery = $this->db->getQuery(true)
            ->select([
                't.topic',
                // Only select the date part for event_date
                'DATE(t.createddate) AS event_date',
                't.remark',
                't.assignedcompany AS assigned_company',
                't.assignedmember',
                'ttype.fielddata AS transaction_type_name',
                'tstatus.fielddata AS transaction_status_name'
            ])
            ->from('#__unicornr_transaction AS t')
            ->leftJoin('#__unicornr_transaction_custom AS ttype ON t.transtype = ttype.id AND ttype.fieldtype = ' . $this->db->quote('transaction'))
            ->leftJoin('#__unicornr_transaction_custom AS tstatus ON t.transstatus = tstatus.id AND tstatus.fieldtype = ' . $this->db->quote('status'))
            ->where('t.assignedcompany = ' . $this->db->quote($clientcode))
            ->order('event_date DESC');
        $this->db->setQuery($transQuery);
        $transactionsList = $this->db->loadObjectList();

        // Only keep transactions where the user is in assignedmember
        $userMemberCodes = array_map('strval', $memberCodes); // ensure string comparison
        $filteredTransactions = [];
        $allMemberCodes = [];
        foreach ($transactionsList as $tx) {
            $hasUser = false;
            if (!empty($tx->assignedmember)) {
                $codes = explode(',', $tx->assignedmember);
                foreach ($codes as $code) {
                    $trimmedCode = trim($code);
                    if (!empty($trimmedCode)) {
                        $allMemberCodes[$trimmedCode] = 1;
                        if (in_array($trimmedCode, $userMemberCodes, true)) {
                            $hasUser = true;
                        }
                    }
                }
            }
            if ($hasUser) {
                $filteredTransactions[] = $tx;
            }
        }

        // 6. Fetch member names for these codes
        $memberNamesMap = [];
        if (!empty($allMemberCodes)) {
            $memberCodesToQuery = array_keys($allMemberCodes);
            $memberCodesQuoted = array_map([$this->db, 'quote'], $memberCodesToQuery);
            $memberCodesIn = implode(',', $memberCodesQuoted);
            $memberQuery = $this->db->getQuery(true)
                ->select(['code', 'name'])
                ->from('#__unicornr_table_member')
                ->where('code IN (' . $memberCodesIn . ')');
            $this->db->setQuery($memberQuery);
            $memberNamesList = $this->db->loadObjectList('code');
            foreach ($memberNamesList as $code => $member) {
                $memberNamesMap[$code] = $member->name;
            }
        }

        // 7. Add member names to transactions and ensure event_date is only date
        foreach ($filteredTransactions as &$tx) {
            // Remove assigned_member_names and assignedmember fields from output
            unset($tx->assigned_member_names);
            unset($tx->assignedmember);
            // Ensure event_date is only date (YYYY-MM-DD)
            if (!empty($tx->event_date)) {
                $tx->event_date = substr($tx->event_date, 0, 10);
            }
        }

        return $filteredTransactions;
    }

    /**
     * Get upcoming transactions for a company, only if the user (by phone number) is associated as a shareholder or director.
     * Upcoming transactions are those with a future event_date.
     *
     * @param string $phonenumber The user's phone number (required).
     * @param string $companynumber The company number to fetch transactions for (required).
     * @return array List of upcoming transactions for the company, or empty array if not associated.
     */
    public function getCompanyUpcomingTransactions($phonenumber, $companynumber)
    {
        // 1. Find the clientcode for this company number
        $clientcodeQ = $this->db->getQuery(true)
            ->select('clientcode')
            ->from('#__unicornr_table_clientdata')
            ->where('comno = ' . $this->db->quote($companynumber));
        $this->db->setQuery($clientcodeQ);
        $clientcode = $this->db->loadResult();
        if (empty($clientcode)) return [];

        // 2. Find member codes for this phone number
        $memberQuery = $this->db->getQuery(true)
            ->select('code')
            ->from('#__unicornr_table_member')
            ->where('hphone = ' . $this->db->quote($phonenumber));
        $this->db->setQuery($memberQuery);
        $memberCodes = $this->db->loadColumn();
        if (empty($memberCodes)) {
            return [];
        }
        $inMembers = implode(',', array_map([$this->db, 'quote'], $memberCodes));

        // 3. Check association in regmem/regdir
        $assocQ = $this->db->getQuery(true)
            ->select('1')->from('#__unicornr_table_regmem')
            ->where('clientcode = ' . $this->db->quote($clientcode))
            ->where('memcode IN (' . $inMembers . ')')
            ->union(
                (clone $this->db->getQuery(true))
                    ->select('1')->from('#__unicornr_table_regdir')
                    ->where('clientcode = ' . $this->db->quote($clientcode))
                    ->where('dircode IN (' . $inMembers . ')')
            );
        $this->db->setQuery($assocQ);
        if (!$this->db->loadResult()) {
            return [];
        }

        // 4. Fetch upcoming transactions for this company (event_date in the future)
        $today = date('Y-m-d');
        $transQuery = $this->db->getQuery(true)
            ->select([
                't.topic',
                'DATE(t.createddate) AS event_date',
                't.remark',
                't.assignedcompany AS assigned_company',
                't.assignedmember',
                'ttype.fielddata AS transaction_type_name',
                'tstatus.fielddata AS transaction_status_name'
            ])
            ->from('#__unicornr_transaction AS t')
            ->leftJoin('#__unicornr_transaction_custom AS ttype ON t.transtype = ttype.id AND ttype.fieldtype = ' . $this->db->quote('transaction'))
            ->leftJoin('#__unicornr_transaction_custom AS tstatus ON t.transstatus = tstatus.id AND tstatus.fieldtype = ' . $this->db->quote('status'))
            ->where('t.assignedcompany = ' . $this->db->quote($clientcode))
            ->where('DATE(t.createddate) > ' . $this->db->quote($today))
            ->order('event_date ASC');
        $this->db->setQuery($transQuery);
        $transactionsList = $this->db->loadObjectList();

        // Only keep transactions where the user is in assignedmember
        $userMemberCodes = array_map('strval', $memberCodes); // ensure string comparison
        $filteredTransactions = [];
        $allMemberCodes = [];
        foreach ($transactionsList as $tx) {
            $hasUser = false;
            if (!empty($tx->assignedmember)) {
                $codes = explode(',', $tx->assignedmember);
                foreach ($codes as $code) {
                    $trimmedCode = trim($code);
                    if (!empty($trimmedCode)) {
                        $allMemberCodes[$trimmedCode] = 1;
                        if (in_array($trimmedCode, $userMemberCodes, true)) {
                            $hasUser = true;
                        }
                    }
                }
            }
            if ($hasUser) {
                $filteredTransactions[] = $tx;
            }
        }

        // Fetch member names for these codes (not included in output, but could be used if needed)
        $memberNamesMap = [];
        if (!empty($allMemberCodes)) {
            $memberCodesToQuery = array_keys($allMemberCodes);
            $memberCodesQuoted = array_map([$this->db, 'quote'], $memberCodesToQuery);
            $memberCodesIn = implode(',', $memberCodesQuoted);
            $memberQuery = $this->db->getQuery(true)
                ->select(['code', 'name'])
                ->from('#__unicornr_table_member')
                ->where('code IN (' . $memberCodesIn . ')');
            $this->db->setQuery($memberQuery);
            $memberNamesList = $this->db->loadObjectList('code');
            foreach ($memberNamesList as $code => $member) {
                $memberNamesMap[$code] = $member->name;
            }
        }

        // Remove assigned_member_names and assignedmember fields from output
        foreach ($filteredTransactions as &$tx) {
            unset($tx->assigned_member_names);
            unset($tx->assignedmember);
            if (!empty($tx->event_date)) {
                $tx->event_date = substr($tx->event_date, 0, 10);
            }
        }

        return $filteredTransactions;
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
     *               - 'certificates': (array) List of share certificates issued by the company. Each certificate is an associative array.
     *               - 'upcoming_share_price': (string) The latest upcoming share price from history logs, or a default message if none found.
     *               - 'company_members': (array) List of company members. Each member includes total_shares and share_percentage.
     *               - 'company_directors': (array) List of company directors. Each director includes total_shares and share_percentage.
     *
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getCompanyDetails&phone_number=0123456789
     */
    // public function getCompanyDetails($phone_number = '', $limit = 10, $orderBy = 'name', $orderDir = 'asc')
    // {

    //     JLog::add('getCompanyDetails called', JLog::INFO, 'flowiseapi');
    //     $db = JFactory::getDbo();
    //     $results = array();

    //     try {
    //         // --- 2. Find all member codes with this phone number ---
    //         $memberQuery = $db->getQuery(true);
    //         $memberQuery->select($db->quoteName('code'))
    //             ->from($db->quoteName('#__unicornr_table_member'))
    //             ->where($db->quoteName('hphone') . ' = ' . $db->quote($phone_number));
    //         $db->setQuery($memberQuery);
    //         $memberCodes = $db->loadColumn();
    //         if ($db->getErrorNum()) {
    //             throw new Exception('Database error while fetching member codes by phone: ' . $db->stderr());
    //         }
    //         if (empty($memberCodes)) {
    //             return array('success' => true, 'data' => array(), 'message' => 'No companies found for this phone number.');
    //         }

    //         // --- 3. Find all company codes where this member is a shareholder (regmem) or director (regdir) ---
    //         $companyCodes = array();
    //         // From regmem (shareholder)
    //         $regmemQuery = $db->getQuery(true);
    //         $regmemQuery->select($db->quoteName('clientcode'))
    //             ->from($db->quoteName('#__unicornr_table_regmem'))
    //             ->where($db->quoteName('memcode') . ' IN (' . implode(',', array_map(array($db, 'quote'), $memberCodes)) . ')')
    //             ->where($db->quoteName('state') . ' = ' . $db->quote(1))
    //             ->where($db->quoteName('docease') . ' = ' . $db->quote('0000-00-00 00:00:00'));
    //         $db->setQuery($regmemQuery);
    //         $regmemCompanyCodes = $db->loadColumn();
    //         if ($db->getErrorNum()) {
    //             throw new Exception('Database error while fetching company codes from regmem: ' . $db->stderr());
    //         }
    //         // From regdir (director)
    //         $regdirQuery = $db->getQuery(true);
    //         $regdirQuery->select($db->quoteName('clientcode'))
    //             ->from($db->quoteName('#__unicornr_table_regdir'))
    //             ->where($db->quoteName('dircode') . ' IN (' . implode(',', array_map(array($db, 'quote'), $memberCodes)) . ')')
    //             ->where($db->quoteName('state') . ' = ' . $db->quote(1))
    //             ->where($db->quoteName('docease') . ' = ' . $db->quote('0000-00-00 00:00:00'));
    //         $db->setQuery($regdirQuery);
    //         $regdirCompanyCodes = $db->loadColumn();
    //         if ($db->getErrorNum()) {
    //             throw new Exception('Database error while fetching company codes from regdir: ' . $db->stderr());
    //         }
    //         $allCompanyCodes = array_unique(array_merge($regmemCompanyCodes, $regdirCompanyCodes));
    //         if (empty($allCompanyCodes)) {
    //             return array('success' => true, 'data' => array(), 'message' => 'No companies found for this phone number.');
    //         }

    //         // --- 4. Fetch Companies for these codes ---
    //         $companyCodesQuoted = array();
    //         foreach ($allCompanyCodes as $code) {
    //             $companyCodesQuoted[] = $db->quote($code);
    //         }
    //         $companyCodesIn = implode(',', $companyCodesQuoted);

    //         $companyQuery = $db->getQuery(true);
    //         $companyQuery->select(array(
    //             $db->quoteName('id'),
    //             $db->quoteName('clientcode'),
    //             $db->quoteName('name'),
    //             $db->quoteName('refno') . ' AS reference_number',
    //             $db->quoteName('curr') . ' AS currency',
    //             $db->quoteName('roccode') . ' AS ssm_office_code',
    //             $db->quoteName('lodger'),
    //             $db->quoteName('compattrib') . ' AS company_attribute',
    //             $db->quoteName('gstno') . ' AS gst_number',
    //             $db->quoteName('doi') . ' AS date_of_incorporation',
    //             $db->quoteName('countryi') . ' AS incorporation_place',
    //             $db->quoteName('paidcap') . ' AS paid_up_capital',
    //             $db->quoteName('status') . ' AS company_status',
    //             $db->quoteName('yearend') . ' AS financial_year_end',
    //             $db->quoteName('lastagm') . ' AS last_agm_date',
    //             $db->quoteName('lastar') . ' AS last_ar_date',
    //             $db->quoteName('comno') . ' AS company_number'
    //         ))
    //             ->from($db->quoteName('#__unicornr_table_clientdata', 'cd'))
    //             ->where($db->quoteName('cd.clientcode') . ' IN (' . $companyCodesIn . ')');

    //         // --- 4b. Fetch Company Members and Directors for these Companies ---
    //         // Only run these queries after $companyCodesIn is defined

    //         // Validate and apply ordering
    //         $allowedOrderColumns = array('name', 'clientcode');
    //         $orderColumn = 'cd.name'; // Default
    //         if (in_array(strtolower($orderBy), $allowedOrderColumns)) {
    //             $orderColumn = 'cd.' . strtolower($orderBy);
    //         }
    //         $direction = strtoupper($orderDir) === 'DESC' ? 'DESC' : 'ASC';
    //         $companyQuery->order($db->escape($orderColumn) . ' ' . $db->escape($direction));

    //         // Apply limit
    //         // if (is_numeric($limit) && $limit > 0) {
    //         //     $companyQuery->setLimit((int)$limit);
    //         // }

    //         $db->setQuery($companyQuery);
    //         $companies = $db->loadObjectList('clientcode'); // Index by clientcode for easier lookup

    //         if ($db->getErrorNum()) {
    //             throw new Exception('Database error while fetching companies: ' . $db->stderr());
    //         }

    //         if (empty($companies)) {
    //             JLog::add('No companies found matching search term: ' . $phone_number, JLog::INFO, 'flowiseapi');
    //             return array('success' => true, 'data' => array(), 'message' => 'No companies found.');
    //         }

    //         $companyCodes = array_keys($companies);
    //         $companyCodesQuoted = array();
    //         foreach ($companyCodes as $code) {
    //             $companyCodesQuoted[] = $db->quote($code);
    //         }
    //         $companyCodesIn = implode(',', $companyCodesQuoted);

    //         // --- 4. Fetch Shareholders with Share Counts and Percentages from table_regmem ---
    //         // Build a map of [clientcode][memcode] => ['total_shares' => ..., 'share_percentage' => ...]
    //         $shareInfoMap = array();
    //         if (!empty($companyCodesIn)) {
    //             $shQuery = $db->getQuery(true);
    //             $shQuery->select(array(
    //                 $db->quoteName('a.clientcode'),
    //                 $db->quoteName('a.memcode'),
    //                 $db->quoteName('a.Tnoshares', 'total_shares'),
    //                 $db->quoteName('a.Percent', 'share_percentage')
    //             ))
    //                 ->from($db->quoteName('#__unicornr_table_regmem', 'a'))
    //                 ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
    //                 ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
    //                 ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'));

    //             $db->setQuery($shQuery);
    //             $shareholdersList = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching shareholders from table_regmem: ' . $db->stderr());
    //             }
    //             foreach ($shareholdersList as $sh) {
    //                 $clientcode = $sh->clientcode;
    //                 $memcode = $sh->memcode;
    //                 $total_shares = is_numeric($sh->total_shares) ? (float) $sh->total_shares : 0;
    //                 $share_percentage = is_numeric($sh->share_percentage) ? (float) $sh->share_percentage : 0;
    //                 if (!isset($shareInfoMap[$clientcode])) {
    //                     $shareInfoMap[$clientcode] = array();
    //                 }
    //                 $shareInfoMap[$clientcode][$memcode] = array(
    //                     'total_shares' => $total_shares,
    //                     'share_percentage' => $share_percentage
    //                 );
    //             }
    //         }

    //         // --- Fetch Company Members ---
    //         $companyMembers = array();
    //         if (!empty($companyCodesIn)) {
    //             $memQuery = $db->getQuery(true);
    //             $memQuery->select(array(
    //                 $db->quoteName('a.clientcode'),
    //                 $db->quoteName('b.code'),
    //                 $db->quoteName('b.name')
    //             ))
    //                 ->from($db->quoteName('#__unicornr_table_regmem', 'a'))
    //                 ->join('LEFT', $db->quoteName('#__unicornr_table_member', 'b') . ' ON ' . $db->quoteName('a.memcode') . ' = ' . $db->quoteName('b.code'))
    //                 ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
    //                 ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
    //                 ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'))
    //                 ->order($db->quoteName('b.name') . ' ASC');

    //             $db->setQuery($memQuery);
    //             $membersList = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching company members: ' . $db->stderr());
    //             }
    //             foreach ($membersList as $mem) {
    //                 if (!isset($companyMembers[$mem->clientcode])) {
    //                     $companyMembers[$mem->clientcode] = array();
    //                 }
    //                 $memberObj = clone $mem;
    //                 unset($memberObj->clientcode);
    //                 // Add share info if available
    //                 $memcode = $mem->code;
    //                 $clientcode = $mem->clientcode;
    //                 $memberObj->total_shares = isset($shareInfoMap[$clientcode][$memcode]) ? $shareInfoMap[$clientcode][$memcode]['total_shares'] : 0;
    //                 $memberObj->share_percentage = isset($shareInfoMap[$clientcode][$memcode]) ? $shareInfoMap[$clientcode][$memcode]['share_percentage'] : 0;
    //                 $companyMembers[$mem->clientcode][] = $memberObj;
    //             }
    //         }

    //         // --- Fetch Company Directors ---
    //         $companyDirectors = array();
    //         if (!empty($companyCodesIn)) {
    //             $dirQuery = $db->getQuery(true);
    //             $dirQuery->select(array(
    //                 $db->quoteName('a.clientcode'),
    //                 $db->quoteName('b.code'),
    //                 $db->quoteName('b.name')
    //             ))
    //                 ->from($db->quoteName('#__unicornr_table_regdir', 'a'))
    //                 ->join('LEFT', $db->quoteName('#__unicornr_table_member', 'b') . ' ON ' . $db->quoteName('a.dircode') . ' = ' . $db->quoteName('b.code'))
    //                 ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
    //                 ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
    //                 ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'))
    //                 ->order($db->quoteName('b.name') . ' ASC');

    //             $db->setQuery($dirQuery);
    //             $directorsList = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching company directors: ' . $db->stderr());
    //             }
    //             foreach ($directorsList as $dir) {
    //                 if (!isset($companyDirectors[$dir->clientcode])) {
    //                     $companyDirectors[$dir->clientcode] = array();
    //                 }
    //                 $directorObj = clone $dir;
    //                 unset($directorObj->clientcode);
    //                 // Add share info if available
    //                 $memcode = $dir->code;
    //                 $clientcode = $dir->clientcode;
    //                 $directorObj->total_shares = isset($shareInfoMap[$clientcode][$memcode]) ? $shareInfoMap[$clientcode][$memcode]['total_shares'] : 0;
    //                 $directorObj->share_percentage = isset($shareInfoMap[$clientcode][$memcode]) ? $shareInfoMap[$clientcode][$memcode]['share_percentage'] : 0;
    //                 $companyDirectors[$dir->clientcode][] = $directorObj;
    //             }
    //         }

    //         // --- 2. Fetch Transactions for these Companies ---
    //         $transactions = array();
    //         $allMemberCodes = array(); // Collect all member codes from all transactions
    //         if (!empty($companyCodesIn)) {
    //             $transQuery = $db->getQuery(true);
    //             $transQuery->select(array(
    //                 $db->quoteName('t.id'),
    //                 $db->quoteName('t.topic'),
    //                 $db->quoteName('t.createddate', 'event_date'), // Rename createddate
    //                 $db->quoteName('t.doreminder', 'do_reminder'), // Rename doreminder
    //                 $db->quoteName('t.remark'),
    //                 $db->quoteName('t.assignedcompany', 'assigned_company'), // Rename assignedcompany
    //                 $db->quoteName('t.assignedmember'), // Keep original for processing
    //                 $db->quoteName('ttype.fielddata', 'transaction_type_name'),
    //                 $db->quoteName('tstatus.fielddata', 'transaction_status_name')
    //             ))
    //                 ->from($db->quoteName('#__unicornr_transaction', 't'))
    //                 ->leftJoin($db->quoteName('#__unicornr_transaction_custom', 'ttype') . ' ON (' . $db->quoteName('t.transtype') . ' = ' . $db->quoteName('ttype.id') . ' AND ' . $db->quoteName('ttype.fieldtype') . ' = ' . $db->quote('transaction') . ')')
    //                 ->leftJoin($db->quoteName('#__unicornr_transaction_custom', 'tstatus') . ' ON (' . $db->quoteName('t.transstatus') . ' = ' . $db->quoteName('tstatus.id') . ' AND ' . $db->quoteName('tstatus.fieldtype') . ' = ' . $db->quote('status') . ')')
    //                 ->where($db->quoteName('t.assignedcompany') . ' IN (' . $companyCodesIn . ')') // Use original column name here
    //                 ->order($db->quoteName('t.assignedcompany') . ' ASC, ' . $db->quoteName('t.createddate') . ' DESC'); // Use original column name here

    //             $db->setQuery($transQuery);
    //             $transactionsList = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching transactions: ' . $db->stderr());
    //             }

    //             // Collect all unique member codes from the assignedmember field
    //             foreach ($transactionsList as $tx) {
    //                 if (!empty($tx->assignedmember)) {
    //                     $codes = explode(',', $tx->assignedmember);
    //                     foreach ($codes as $code) {
    //                         $trimmedCode = trim($code);
    //                         if (!empty($trimmedCode)) {
    //                             $allMemberCodes[$trimmedCode] = 1; // Use keys for uniqueness
    //                         }
    //                     }
    //                 }
    //             }
    //         }

    //         // --- 2b. Fetch Member Names for Collected Codes ---
    //         $memberNamesMap = array();
    //         if (!empty($allMemberCodes)) {
    //             $memberCodesToQuery = array_keys($allMemberCodes);
    //             $memberCodesQuoted = array();
    //             foreach ($memberCodesToQuery as $code) {
    //                 $memberCodesQuoted[] = $db->quote($code);
    //             }
    //             $memberCodesIn = implode(',', $memberCodesQuoted);

    //             $memberQuery = $db->getQuery(true);
    //             $memberQuery->select(array($db->quoteName('code'), $db->quoteName('name')))
    //                 ->from($db->quoteName('#__unicornr_table_member'))
    //                 ->where($db->quoteName('code') . ' IN (' . $memberCodesIn . ')');

    //             $db->setQuery($memberQuery);
    //             $memberNamesList = $db->loadObjectList('code'); // Index by code
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching member names: ' . $db->stderr());
    //             }
    //             foreach ($memberNamesList as $code => $member) {
    //                 $memberNamesMap[$code] = $member->name;
    //             }
    //         }

    //         // --- 2c. Process Transactions to Add Member Names and Group ---
    //         $transactions = array(); // Reset and regroup
    //         foreach ($transactionsList as $tx) {
    //             $companyCode = $tx->assigned_company; // Keep the original code for grouping

    //             if (!isset($transactions[$companyCode])) {
    //                 $transactions[$companyCode] = array();
    //             }

    //             // Replace assigned_company code with name
    //             if (isset($companies[$companyCode])) {
    //                 $tx->assigned_company_name = $companies[$companyCode]->name;
    //             } else {
    //                 $tx->assigned_company_name = 'Unknown Company (' . $companyCode . ')'; // Fallback
    //             }
    //             // Optionally remove the code field if only name is desired
    //             // unset($tx->assigned_company);

    //             // Add member names
    //             $tx->assigned_member_names = array();
    //             if (!empty($tx->assignedmember)) {
    //                 $codes = explode(',', $tx->assignedmember);
    //                 foreach ($codes as $code) {
    //                     $trimmedCode = trim($code);
    //                     if (isset($memberNamesMap[$trimmedCode])) {
    //                         $tx->assigned_member_names[] = $memberNamesMap[$trimmedCode];
    //                     }
    //                     // Optionally include the code if name not found, or just skip
    //                     // else if (!empty($trimmedCode)) {
    //                     //     $tx->assigned_member_names[] = $trimmedCode . ' (Name not found)';
    //                     // }
    //                 }
    //             }
    //             unset($tx->assignedmember); // Remove the original code string

    //             $transactions[$companyCode][] = $tx;
    //         }

    //         // --- 4. Fetch Shareholders with Share Counts and Percentages from table_regmem ---
    //         // Build a map of [clientcode][memcode] => ['total_shares' => ..., 'share_percentage' => ...]
    //         $shareInfoMap = array();
    //         if (!empty($companyCodesIn)) {
    //             $shQuery = $db->getQuery(true);
    //             $shQuery->select(array(
    //                 $db->quoteName('a.clientcode'),
    //                 $db->quoteName('a.memcode'),
    //                 $db->quoteName('a.Tnoshares', 'total_shares'),
    //                 $db->quoteName('a.Percent', 'share_percentage')
    //             ))
    //                 ->from($db->quoteName('#__unicornr_table_regmem', 'a'))
    //                 ->where($db->quoteName('a.clientcode') . ' IN (' . $companyCodesIn . ')')
    //                 ->where($db->quoteName('a.state') . ' = ' . $db->quote(1))
    //                 ->where($db->quoteName('a.docease') . ' = ' . $db->quote('0000-00-00 00:00:00'));

    //             $db->setQuery($shQuery);
    //             $shareholdersList = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching shareholders from table_regmem: ' . $db->stderr());
    //             }
    //             foreach ($shareholdersList as $sh) {
    //                 $clientcode = $sh->clientcode;
    //                 $memcode = $sh->memcode;
    //                 $total_shares = is_numeric($sh->total_shares) ? (float) $sh->total_shares : 0;
    //                 $share_percentage = is_numeric($sh->share_percentage) ? (float) $sh->share_percentage : 0;
    //                 if (!isset($shareInfoMap[$clientcode])) {
    //                     $shareInfoMap[$clientcode] = array();
    //                 }
    //                 $shareInfoMap[$clientcode][$memcode] = array(
    //                     'total_shares' => $total_shares,
    //                     'share_percentage' => $share_percentage
    //                 );
    //             }
    //         }

    //         // --- 5. Fetch Detailed Certificate Info for these Companies ---
    //         $certificates = array();
    //         if (!empty($companyCodesIn)) {
    //             $certQuery = $db->getQuery(true);
    //             $certQuery->select(array(
    //                 $db->quoteName('s.clientcode'),
    //                 $db->quoteName('s.certno'),
    //                 $db->quoteName('s.noshare'),
    //                 $db->quoteName('s.memcode'),
    //                 $db->quoteName('m.name', 'member_name'),
    //                 $db->quoteName('m.add1'),
    //                 $db->quoteName('m.add2'),
    //                 $db->quoteName('m.add3'),
    //                 $db->quoteName('m.postcode'),
    //                 $db->quoteName('m.town'),
    //                 $db->quoteName('s.tranno'),
    //                 $db->quoteName('s.trandate'),
    //                 $db->quoteName('s.docease')
    //             ))
    //                 ->from($db->quoteName('#__unicornr_table_shares', 's'))
    //                 ->leftJoin($db->quoteName('#__unicornr_table_member', 'm') . ' ON ' . $db->quoteName('s.memcode') . ' = ' . $db->quoteName('m.code'))
    //                 ->where($db->quoteName('s.clientcode') . ' IN (' . $companyCodesIn . ')')
    //                 ->where($db->quoteName('s.certno') . ' IS NOT NULL')
    //                 ->where($db->quoteName('s.certno') . ' != ' . $db->quote(''))
    //                 // Order by clientcode, certno, and then trandate descending to easily pick the latest relevant record per cert
    //                 ->order($db->quoteName('s.clientcode') . ' ASC, ' . $db->quoteName('s.certno') . ' ASC, ' . $db->quoteName('s.trandate') . ' DESC');

    //             $db->setQuery($certQuery);
    //             $certificatesList = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching certificates: ' . $db->stderr());
    //             }

    //             $processedCerts = array(); // Keep track of certs already added per company
    //             $currentDomain = JURI::base(); // Get the base URL

    //             foreach ($certificatesList as $cert) {
    //                 $certIdentifier = $cert->clientcode . '|' . $cert->certno;

    //                 // Only process the latest record for each certificate number per company
    //                 if (!isset($processedCerts[$certIdentifier])) {
    //                     if (!isset($certificates[$cert->clientcode])) {
    //                         $certificates[$cert->clientcode] = array();
    //                     }

    //                     // Construct Member Address
    //                     $addressParts = array_filter([$cert->add1, $cert->add2, $cert->add3, $cert->postcode, $cert->town]);
    //                     $memberAddress = implode(',', $addressParts);

    //                     // Determine Status and Format Date of Cease
    //                     $isNullDate = ($cert->docease == '0000-00-00 00:00:00' || empty($cert->docease));
    //                     $status = $isNullDate ? 'Active' : 'Ceased';
    //                     $dateOfCease = $isNullDate ? '-' : JHTML::_('date', $cert->docease, 'Y-m-d'); // Format date if ceased

    //                     // Construct Certificate Link
    //                     // Ensure memcode and certno are properly URL encoded
    //                     $certificateLink = $currentDomain . 'index.php?option=com_ajax&plugin=pdfgenerator&format=raw&membercode=' . urlencode($cert->memcode) . '&certno=' . urlencode($cert->certno);

    //                     // Get Company Info (already fetched)
    //                     $companyInfo = $companies[$cert->clientcode];

    //                     $certificates[$cert->clientcode][] = array(
    //                         'company_name' => $companyInfo->name,
    //                         'company_number' => $companyInfo->company_number, // Use the aliased name
    //                         'certificate_number' => $cert->certno,
    //                         'number_of_shares' => $cert->noshare,
    //                         'member_code' => $cert->memcode,
    //                         'member_name' => $cert->member_name,
    //                         'member_address' => $memberAddress,
    //                         'transaction_number' => $cert->tranno,
    //                         'transaction_date' => JHTML::_('date', $cert->trandate, 'Y-m-d'), // Format date
    //                         'date_of_cease' => $dateOfCease,
    //                         'status' => $status,
    //                         'certificate_link' => $certificateLink
    //                     );

    //                     $processedCerts[$certIdentifier] = true; // Mark this cert for this company as processed
    //                 }
    //             }
    //         }

    //         // --- 6. Fetch Upcoming Share Price Info from History Logs ---
    //         // Replaces the previous "Latest Share Price Info" logic
    //         $upcomingSharePrices = array();
    //         if (!empty($companyCodesIn)) {
    //             $logQuery = $db->getQuery(true);
    //             $logQuery->select(array(
    //                 $db->quoteName('custom_field1', 'upcoming_price'), // Alias for clarity
    //                 $db->quoteName('custom_field2', 'clientcode')     // Need clientcode to map results
    //             ))
    //                 ->from($db->quoteName('#__unicornr_history_logs'))
    //                 ->where($db->quoteName('state') . " = " . $db->quote(1))
    //                 ->where($db->quoteName('custom_field2') . ' IN (' . $companyCodesIn . ')') // Filter by relevant company codes
    //                 ->order(array(
    //                     $db->quoteName('custom_field2') . ' ASC', // Group by company first
    //                     $db->quoteName('id') . ' DESC'           // Get the latest log entry first within each group
    //                 ));

    //             $db->setQuery($logQuery);
    //             $allLogEntries = $db->loadObjectList();
    //             if ($db->getErrorNum()) {
    //                 throw new Exception('Database error while fetching upcoming share price from logs: ' . $db->stderr());
    //             }

    //             // Filter to get only the latest log entry per company
    //             foreach ($allLogEntries as $logEntry) {
    //                 if (!isset($upcomingSharePrices[$logEntry->clientcode])) {
    //                     // Since ordered by id DESC, the first encountered entry for a clientcode is the latest
    //                     $upcomingSharePrices[$logEntry->clientcode] = !empty($logEntry->upcoming_price) ? $logEntry->upcoming_price : 'No Upcoming Share Price';
    //                 }
    //             }
    //         }

    //         $clientInfo = null;
    //         $clientQuery = $db->getQuery(true)
    //             ->select(array('name', 'hphone', 'code'))
    //             ->from($db->quoteName('#__unicornr_table_member'))
    //             ->where($db->quoteName('hphone') . ' = ' . $db->quote($phone_number));
    //         $db->setQuery($clientQuery);
    //         $clientInfo = $db->loadAssoc();

    //         // --- 7. Assemble Results ---
    //         foreach ($companies as $clientcode => $company) {
    //             $results[] = array(
    //                 'client_info' => $clientInfo ?: new stdClass(),
    //                 'company_info' => $company,
    //                 'transactions' => isset($transactions[$clientcode]) ? $transactions[$clientcode] : array(),
    //                 'certificates' => isset($certificates[$clientcode]) ? $certificates[$clientcode] : array(),
    //                 'upcoming_share_price' => isset($upcomingSharePrices[$clientcode]) ? $upcomingSharePrices[$clientcode] : 'No Upcoming Share Price',
    //                 'company_members' => isset($companyMembers[$clientcode]) ? $companyMembers[$clientcode] : array(),
    //                 'company_directors' => isset($companyDirectors[$clientcode]) ? $companyDirectors[$clientcode] : array(),
    //             );
    //         }

    //         JLog::add('getCompanyDetails executed successfully. Found ' . count($results) . ' companies.', JLog::INFO, 'flowiseapi');

    //         // Ensure we are returning the flat array of company results
    //         return $results; // Should return [{company1}, {company2}, ...]

    //     } catch (Exception $e) {
    //         JLog::add('Error in getCompanyDetails: ' . $e->getMessage(), JLog::ERROR, 'flowiseapi');
    //         // Return an empty array in case of error within this function
    //         return array();
    //     }
    // }

    /**
     * Get courses and articles with detailed information.
     * 
     * Retrieves a list of published courses and articles based on filters.
     * Results include course details (lessons, reviews based on flags) and article details.
     * 
     * @param string $keyword Optional search keyword to filter items by title or description/introtext
     * @param int $limit Optional maximum number of items (courses and articles each) to return (default: 20, 0 = no limit)
     * @param int $category_id Optional category ID to filter courses by specific category (articles are not filtered by this)
     * @param bool $include_lessons Whether to include course lesson details (default: true)
     * @param bool $include_reviews Whether to include course reviews (default: false)
     * @param int $user_id Optional user ID to check course enrollment status (default: 0)
     * 
     * @return array An array containing two keys: 'courses' and 'articles', each holding a list of items.
     * 
     * @example Call via: index.php?option=com_ajax&plugin=flowiseapi&format=json&method=getItems&keyword=joomla&limit=10&category_id=5&include_reviews=1
     */
    public function getItems($keyword = '', $limit = 20, $category_id = 0)
    {
        $result = ['articles' => []];
        try {
            $db = JFactory::getDbo();
            $app = JFactory::getApplication();
            $menu = $app->getMenu();
            $articleQuery = $db->getQuery(true)
                ->select('a.id, a.title, a.alias, a.introtext, a.fulltext, a.catid, a.created, a.images')
                ->select('cc.title AS category_title, cc.alias AS category_alias')
                ->from($db->quoteName('#__content', 'a'))
                ->join('LEFT', $db->quoteName('#__categories', 'cc') . ' ON a.catid = cc.id')
                ->where('a.state = 1');

            // Filter by search keyword
            if (!empty($keyword)) {
                $searchKeyword = '%' . $db->escape($keyword, true) . '%';
                $articleQuery->where('(a.title LIKE ' . $db->quote($searchKeyword) .
                    ' OR a.introtext LIKE ' . $db->quote($searchKeyword) . ')');
            }

            // Order by newest articles first
            $articleQuery->order('a.created DESC');

            // Apply limit if specified
            // if ($limit > 0) {
            //     $articleQuery->setLimit($limit);
            // }

            $db->setQuery($articleQuery);
            $articles = $db->loadAssocList();

            // Process articles (format images, get SP Page Builder content)
            if (!empty($articles)) {
                $siteRoot = rtrim(JURI::root(), '/'); // JURI (all caps) is correct in Joomla 3
                foreach ($articles as &$article) {
                    // Format images
                    if (!empty($article['images'])) {
                        $imagePaths = json_decode($article['images']);
                        if (isset($imagePaths->image_intro) && !empty($imagePaths->image_intro)) {
                            if (!preg_match('/^(https?:\/\/|www\.)/', $imagePaths->image_intro)) {
                                $article['intro_image'] = $siteRoot . '/' . $imagePaths->image_intro;
                            } else {
                                $article['intro_image'] = $imagePaths->image_intro;
                            }
                        }
                        if (isset($imagePaths->image_fulltext) && !empty($imagePaths->image_fulltext)) {
                            if (!preg_match('/^(https?:\/\/|www\.)/', $imagePaths->image_fulltext)) {
                                $article['fulltext_image'] = $siteRoot . '/' . $imagePaths->image_fulltext;
                            } else {
                                $article['fulltext_image'] = $imagePaths->image_fulltext;
                            }
                        }
                    }
                    // Remove original images field if desired
                    // unset($article['images']); 

                    // Construct Article URL with menu item if available
                    $itemid = 0;
                    // Try to find a menu item for this category
                    foreach ($menu->getMenu() as $menuItem) {
                        if (
                            isset($menuItem->query['view']) && $menuItem->query['view'] === 'category' &&
                            isset($menuItem->query['id']) && (int)$menuItem->query['id'] === (int)$article['catid']
                        ) {
                            $itemid = (int)$menuItem->id;
                            break;
                        }
                    }
                    if ($itemid) {
                        // Use Joomla route helper to build the URL with Itemid
                        $article['url'] = JRoute::_('index.php?option=com_content&view=article&id=' . $article['id'] . '&catid=' . $article['catid'] . '&Itemid=' . $itemid, false, -1);
                        // If JRoute returns a relative URL, prepend site root
                        if (strpos($article['url'], 'http') !== 0) {
                            $article['url'] = $siteRoot . '/' . ltrim($article['url'], '/');
                        }
                    } else {
                        // Fallback to previous logic
                        $article['url'] = $siteRoot . '/' . $article['category_alias'] . '/' . $article['id'] . '-' . $article['alias'];
                    }

                    // Check for SP Page Builder content
                    $spPageBuilderContent = null;
                    try {
                        $spQuery = $db->getQuery(true)
                            ->select('text, title')
                            ->from($db->quoteName('#__sppagebuilder'))
                            ->where($db->quoteName('view_id') . ' = ' . (int) $article['id']);
                        $db->setQuery($spQuery);
                        $spPageBuilderContent = $db->loadResult();
                    } catch (Exception $spException) {
                        // Optionally log error if SP Page Builder table doesn't exist or query fails
                        // JLog::add('SP Page Builder check failed for article ID ' . $article['id'] . ': ' . $spException->getMessage(), JLog::WARNING, 'flowiseapiarticle');
                    }

                    // Assign content: SP Page Builder content takes precedence
                    if (!empty($spPageBuilderContent)) {
                        $article['content'] = $spPageBuilderContent; // Could be JSON
                        $article['content_type'] = 'sp_page_builder';
                    } else {
                        $article['content'] = $article['fulltext']; // Use standard fulltext if no SPPB content
                        $article['content_type'] = 'joomla_fulltext';
                    }

                    // Optionally remove the raw fulltext field
                    unset($article['fulltext']);
                }
            }

            $result['articles'] = $articles;
            return $result;
        } catch (Exception $e) {
            JLog::add('Error in getItems: ' . $e->getMessage(), JLog::ERROR, 'flowiseapiarticle');
            // Return error within the expected structure if possible
            return ['error' => $e->getMessage(), 'articles' => []];
        }
    }

    /**
     * URL-safe Base64 encode.
     */
    function base64url_encode(string $data): string
    {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }

    /**
     * URL-safe Base64 decode.
     */
    function base64url_decode(string $data): string
    {
        $padding = 4 - (strlen($data) % 4);
        if ($padding < 4) {
            $data .= str_repeat('=', $padding);
        }
        return base64_decode(strtr($data, '-_', '+/'));
    }

    /**
     * Create a JWT using HS256.
     *
     * @param array  $payload   The JWT payload.
     * @param string $secret    The secret key.
     * @return string           The JWT string.
     */
    function jwt_encode(array $payload, string $secret): string
    {
        $header = ['alg' => 'HS256', 'typ' => 'JWT'];
        $segments = [];
        $segments[] = $this->base64url_encode(json_encode($header));
        $segments[] = $this->base64url_encode(json_encode($payload));
        $signature = hash_hmac('sha256', implode('.', $segments), $secret, true);

        $segments[] = $this->base64url_encode($signature);

        return implode('.', $segments);
    }

    /**
     * Decode and verify a JWT using HS256.
     *
     * @param string $token     The JWT string.
     * @param string $secret    The secret key.
     * @return array            Decoded payload.
     * @throws RuntimeException If token is invalid or expired.
     */
    function jwt_decode(string $token, string $secret): array
    {
        [$b64header, $b64payload, $b64sig] = explode('.', $token);
        $header = json_decode($this->base64url_decode($b64header), true);
        $payload = json_decode($this->base64url_decode($b64payload), true);
        $sig = $this->base64url_decode($b64sig);

        if (empty($header['alg']) || $header['alg'] !== 'HS256') {
            throw new \RuntimeException('Unsupported JWT algorithm');
        }

        // Verify signature
        $validSig = hash_hmac('sha256', "$b64header.$b64payload", $secret, true);
        if (!hash_equals($validSig, $sig)) {
            throw new \RuntimeException('Invalid JWT signature');
        }

        // Expiration check
        if (isset($payload['exp']) && time() >= $payload['exp']) {
            throw new \RuntimeException('JWT expired');
        }

        return $payload;
    }

    /**
     * Perform a single sign-on from Joomla to NextAuth-powered Next.js app.
     */
    function singleSignOn(): void
    {
        $userId = 'd0c9d39f-cc98-4f86-9266-7934666eeb35';
        $userSecret = 'n4Aowtcna_DR7OoekqSwZl2xhex2UafkKoJHWDbEz00';


        // Site A endpoints
        $siteA_base = 'https://agent.dreamztrack.com.my';
        $ssoEndpoint = $siteA_base . '/api/auth/callback/credentials-sso';

        // Create SSO JWT on server
        $payload = ['sub' => $userId, 'iat' => time(), 'exp' => time() + 60];
        $ssoJwt = $this->jwt_encode($payload, $userSecret);

        // Emit HTML + JS
        echo '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"';
        echo '><meta name="viewport" content="width=device-width, initial-scale=1.0"';
        echo '><title>Single Sign-On Redirect</title></head><body>';
        echo '<script>
';
        echo "const ssoToken = '" . addslashes($ssoJwt) . "';\n";
        echo "const callbackUrl = '" . addslashes($siteA_base . '/') . "';\n";
        echo "fetch('" . addslashes($siteA_base) . "/api/auth/csrf', { credentials: 'include' })\n";
        echo "  .then(res => res.json())\n";
        echo "  .then(data => {\n";
        echo "    const csrf = data.csrfToken;\n";
        echo "    const form = document.createElement('form');\n";
        echo "    form.method = 'POST';\n";
        echo "    form.action = '" . addslashes($ssoEndpoint) . "';\n";
        echo "    ['csrfToken', 'token', 'callbackUrl'].forEach(name => {\n";
        echo "      const input = document.createElement('input');\n";
        echo "      input.type = 'hidden';\n";
        echo "      input.name = name;\n";
        echo "      input.value = name === 'csrfToken' ? csrf : (name === 'token' ? ssoToken : callbackUrl);\n";
        echo "      form.appendChild(input);\n";
        echo "    });\n";
        echo "    document.body.appendChild(form);\n";
        echo "    form.submit();\n";
        echo "  });\n";
        echo '</script></body></html>';
        exit;
    }

    /**
     * Get a list of keywords from unicornr_workflows where type = 2.
     *
     * @return array Array containing the list of keywords
     */
    function getKeywords()
    {
        try {
            $db = JFactory::getDbo();
            $query = $db->getQuery(true)
                ->select($db->quoteName('keyword'))
                ->from($db->quoteName('#__unicornr_workflows'))
                ->where($db->quoteName('type') . ' = 2');
            $db->setQuery($query);
            $keywords = $db->loadColumn();
            if ($db->getErrorNum()) {
                throw new Exception('Database error while fetching keywords: ' . $db->stderr());
            }
            header('Content-Type: application/json');
            echo json_encode($keywords);
            exit;
        } catch (Exception $e) {
            header('Content-Type: application/json');
            echo json_encode([]);
            exit;
        }
    }

    function processKeywords()
    {
        // Get raw POST body
        $payload = file_get_contents('php://input');
        $data = json_decode($payload, true);
        if (!$data || !isset($data['messages'][0]['text']['body'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'error' => 'Invalid payload or missing message body.']);
            exit;
        }

        $messageBody = $data['messages'][0]['text']['body'];

        // Fetch all active workflows of type=2
        $db = JFactory::getDbo();
        $query = $db->getQuery(true)
            ->select('*')
            ->from($db->quoteName('#__unicornr_workflows'))
            ->where($db->quoteName('type') . ' = 2')
            ->where($db->quoteName('state') . ' = 1');
        $db->setQuery($query);
        $workflowRows = $db->loadObjectList();

        if (empty($workflowRows)) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'error' => 'No workflows found.']);
            exit;
        }

        $matched = false;
        $scheduleTimes = [];
        foreach ($workflowRows as $workflowRow) {
            if (!empty($workflowRow->keyword) && stripos($messageBody, $workflowRow->keyword) !== false) {
                // Found a matching keyword, trigger workflow(s)
                if (!empty($workflowRow->workflow)) {
                    $workflows = json_decode($workflowRow->workflow, true);
                    if (is_array($workflows)) {
                        foreach ($workflows as $wf) {
                            // Calculate schedule_date_time based on workflow time/unit and user's timezone
                            $interval = isset($wf['time']) ? (int) $wf['time'] : 0;
                            $unit = isset($wf['unit']) ? strtolower($wf['unit']) : 'minutes';

                            $userTimezone = Factory::getUser()->getTimezone()->getName();
                            // Set eventDate to 8:00 AM in user's timezone
                            $eventDate = new \Joomla\CMS\Date\Date('now', 'UTC');
                            $eventDate->setTimezone(new DateTimeZone($userTimezone));

                            // Apply interval
                            if ($interval > 0) {
                                switch ($unit) {
                                    case 'minutes':
                                        $eventDate->modify('+' . $interval . ' minutes');
                                        break;
                                    case 'days':
                                        $eventDate->modify('+' . $interval . ' days');
                                        break;
                                    case 'weeks':
                                        $eventDate->modify('+' . $interval . ' weeks');
                                        break;
                                    default:
                                        $eventDate->modify('+' . $interval . ' minutes');
                                }
                            }
                            $scheduleDateTime = $eventDate->format('Y-m-d H:i:s', true);
                            $scheduleTimes[] = $scheduleDateTime;
                            $scheduleTimes[] = $scheduleDateTime;

                            $postFields = [
                                'dreamztrack_user' => '68',
                                'function' => 'storeScheduleMessage',
                                'method' => 'apiWebhook',
                                'type' => 'contact',
                                'target' => $data['messages'][0]['from'],
                                'schedule_date_time' => $scheduleDateTime,
                                'template' => $workflowRow->name . '_' . $workflowRow->id,
                                'custom_field_1' => !empty($wf['image']) ? 'Send Image' : 'Send Message Only',
                                'custom_field_2' => isset($wf['message']) ? $wf['message'] : $messageBody,
                            ];

                            $ch = curl_init('https://whatsapp.dreamztrack.com.my/index.php?option=com_ajax&plugin=downloadwhatsappcontacts&format=raw');
                            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                            curl_setopt($ch, CURLOPT_POST, true);

                            if (!empty($wf['image'])) {
                                $imagePath = $wf['image'];
                                $tmpFile = tempnam(sys_get_temp_dir(), 'wfimg_');
                                file_put_contents($tmpFile, file_get_contents($imagePath));
                                $postFields['file'] = new CURLFile($tmpFile, mime_content_type($tmpFile), basename($imagePath));
                                curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
                            } else {
                                curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
                            }

                            $response = curl_exec($ch);
                            $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                            $curlErrorNum = curl_errno($ch);
                            $curlError = curl_error($ch);
                            curl_close($ch);

                            if (!empty($wf['image']) && isset($tmpFile) && file_exists($tmpFile)) {
                                unlink($tmpFile);
                            }

                            if ($curlErrorNum !== 0 || $httpcode != 200) {
                                header('Content-Type: application/json');
                                echo json_encode([
                                    'success' => false,
                                    'error' => 'Failed to send workflow message.',
                                    'curl_error' => $curlError,
                                    'http_code' => $httpcode,
                                    'response' => $response
                                ]);
                                exit;
                            }
                        }
                        $matched = true;
                    }
                }
            }
        }

        header('Content-Type: application/json');
        if ($matched) {
            echo json_encode(['success' => true, 'message' => 'Workflow(s) triggered.', 'schedule_date_times' => $scheduleTimes]);
        } else {
            echo json_encode(['success' => false, 'message' => 'No matching keyword found in message.', 'schedule_date_times' => $scheduleTimes]);
        }
        exit;
    }

    /**
     * Notify assigned members of transaction status changes (for cron job)
     *
     * This function should be called every minute by a cron job (via CLI or web cron).
     * It checks moz70_unicornr_transaction_status_log for entries with notified_to_user = 0,
     * fetches the transaction and assigned members, gets the workflow message, sends the message,
     * and marks the log as notified.
     *
     * @return array Summary of notifications sent
     */
    public function notifyTransactionStatusChange()
    {
        $db = JFactory::getDbo();
        $results = [];

        $user = \Joomla\CMS\Factory::getUser();
        $tz = $user && method_exists($user, 'getTimezone') ? $user->getTimezone() : null;
        if ($tz instanceof \DateTimeZone) {
            $userTimezone = $tz->getName();
        } elseif (is_string($tz) && !empty($tz)) {
            $userTimezone = $tz;
        } else {
            $userTimezone = 'Asia/Kuala_Lumpur';
        }

        try {
            // 1. Get all unnotified status changes
            $query = $db->getQuery(true)
                ->select('*')
                ->from($db->quoteName('#__unicornr_transaction_status_log'))
                ->where($db->quoteName('notified_to_user') . ' = 0');
            $db->setQuery($query);
            $logRows = $db->loadObjectList();

            if (empty($logRows)) {
                return ['success' => true, 'message' => 'No unnotified status changes.'];
            }

            $allWorkflowDetails = [];
            $allScheduleTimes = [];
            foreach ($logRows as $logRow) {
                $transactionId = $logRow->transaction_id;
                // 2. Get transaction
                $txQuery = $db->getQuery(true)
                    ->select('*')
                    ->from($db->quoteName('#__unicornr_transaction'))
                    ->where($db->quoteName('id') . ' = ' . (int) $transactionId);
                $db->setQuery($txQuery);
                $transaction = $db->loadObject();
                if (!$transaction) {
                    $results[] = [
                        'transaction_id' => $transactionId,
                        'status' => 'error',
                        'message' => 'Transaction not found.'
                    ];
                    continue;
                }

                // Lookup before_status and after_status text from unicornr_transaction_custom
                $beforeStatusId = isset($logRow->before_transstatus) ? (int) $logRow->before_transstatus : null;
                $afterStatusId = isset($logRow->after_transstatus) ? (int) $logRow->after_transstatus : null;
                $statusTextMap = [];
                $statusIdsToLookup = [];
                if ($beforeStatusId)
                    $statusIdsToLookup[] = $beforeStatusId;
                if ($afterStatusId)
                    $statusIdsToLookup[] = $afterStatusId;
                if (!empty($statusIdsToLookup)) {
                    $statusQuery = $db->getQuery(true)
                        ->select('id, fielddata')
                        ->from($db->quoteName('#__unicornr_transaction_custom'))
                        ->where($db->quoteName('id') . ' IN (' . implode(',', array_map('intval', $statusIdsToLookup)) . ')');
                    $db->setQuery($statusQuery);
                    $statusRows = $db->loadAssocList('id', 'fielddata');
                    if ($statusRows && is_array($statusRows)) {
                        $statusTextMap = $statusRows;
                    }
                }
                // 3. Get assigned members (comma-separated codes)
                $assignedMembers = [];
                if (!empty($transaction->assignedmember)) {
                    $codes = explode(',', $transaction->assignedmember);
                    foreach ($codes as $code) {
                        $trimmed = trim($code);
                        if ($trimmed !== '') {
                            $assignedMembers[] = $trimmed;
                        }
                    }
                }
                if (empty($assignedMembers)) {
                    $results[] = [
                        'transaction_id' => $transactionId,
                        'status' => 'skipped',
                        'message' => 'No assigned members.'
                    ];
                    // Still mark as notified to avoid repeated attempts
                    $this->markStatusLogNotified($logRow->id);
                    continue;
                }

                // 4. Get member contact info
                $memberQuery = $db->getQuery(true)
                    ->select('code, name, hphone, email')
                    ->from($db->quoteName('#__unicornr_table_member'))
                    ->where($db->quoteName('code') . ' IN (' . implode(',', array_map([$db, 'quote'], $assignedMembers)) . ')');
                $db->setQuery($memberQuery);
                $members = $db->loadObjectList('code');

                // 5. Get workflow (based on transaction type and status change)
                $workflow = null;
                $workflowQuery = $db->getQuery(true)
                    ->select('*')
                    ->from($db->quoteName('#__unicornr_workflows'))
                    ->where($db->quoteName('type') . ' IN (5,6)')
                    ->where($db->quoteName('state') . ' = 1');
                $db->setQuery($workflowQuery);
                $workflows = $db->loadObjectList();

                // Determine transaction type: 1=AGM, 2=Resolution
                $transactionType = isset($transaction->transtype) ? (int) $transaction->transtype : 0;
                $workflowFieldType = null;
                if ($transactionType === 1) {
                    $workflowFieldType = 5; // AGM
                } elseif ($transactionType === 2) {
                    $workflowFieldType = 6; // Resolution
                }
                $transactionStatus = isset($transaction->transstatus) ? $transaction->transstatus : null;
                // Find matching workflow
                foreach ($workflows as $wfRow) {
                    // Only notify if afterStatusId matches workflow updatetype
                    if (
                        isset($wfRow->type) && (int) $wfRow->type === $workflowFieldType &&
                        isset($wfRow->updatetype) && $afterStatusId !== null && $wfRow->updatetype == $afterStatusId
                    ) {
                        $workflow = $wfRow;
                        break;
                    }
                }

                // If no workflow found, skip everything for this transaction
                if (!$workflow) {
                    // Mark as notified to avoid repeated attempts
                    $this->markStatusLogNotified($logRow->id);
                    continue;
                }

                // 6. Prepare message and image support
                $scheduleTimes = [];
                $workflowDetails = [];
                $sendResults = [];
                if (empty($workflow->workflow)) {
                    // Mark as notified to avoid repeated attempts
                    $this->markStatusLogNotified($logRow->id);
                    continue;
                }
                $wfDecoded = json_decode($workflow->workflow, true);
                if (!is_array($wfDecoded) || count($wfDecoded) === 0) {
                    // Mark as notified to avoid repeated attempts
                    $this->markStatusLogNotified($logRow->id);
                    continue;
                }
                foreach ($wfDecoded as $wfItem) {

                    // Build workflowDetails for each workflow item
                    $interval = isset($wfItem['time']) ? (int) $wfItem['time'] : 0;
                    $unit = isset($wfItem['unit']) ? strtolower($wfItem['unit']) : 'minutes';
                    $scheduleDate = new \Joomla\CMS\Date\Date('now', 'UTC');
                    $scheduleDate->setTimezone(new \DateTimeZone($userTimezone));
                    if ($interval > 0) {
                        switch ($unit) {
                            case 'minutes':
                                $scheduleDate->modify('+' . $interval . ' minutes');
                                break;
                            case 'days':
                                $scheduleDate->modify('+' . $interval . ' days');
                                break;
                            case 'weeks':
                                $scheduleDate->modify('+' . $interval . ' weeks');
                                break;
                            default:
                                $scheduleDate->modify('+' . $interval . ' minutes');
                        }
                    }
                    $scheduleDateTime = $scheduleDate->format('Y-m-d H:i:s', true);
                    $scheduleTimes[] = $scheduleDateTime;
                    $workflowDetails[] = [
                        'workflow_name' => $workflow->name,
                        'workflow_id' => $workflow->id,
                        'message' => isset($wfItem['message']) ? $wfItem['message'] : null,
                        'image' => isset($wfItem['image']) ? $wfItem['image'] : null,
                        'schedule_date_time' => $scheduleDateTime
                    ];
                }

                // Now send notifications for each workflow item (not just the first)
                foreach ($workflowDetails as $wfDetail) {
                    $msgTemplate = isset($wfDetail['message']) ? $wfDetail['message'] : null;
                    $scheduleDateTime = isset($wfDetail['schedule_date_time']) ? $wfDetail['schedule_date_time'] : date('Y-m-d H:i:s');
                    if ($msgTemplate) {
                        foreach ($members as $member) {
                            $target = $member->hphone;
                            if (empty($target)) {
                                $sendResults[] = [
                                    'member_code' => $member->code,
                                    'status' => 'skipped',
                                    'message' => 'No phone number.'
                                ];
                                continue;
                            }

                            // Get company name from clientdata
                            $companyName = '';
                            if (!empty($transaction->assignedcompany)) {
                                $companyQuery = $db->getQuery(true)
                                    ->select('name')
                                    ->from($db->quoteName('#__unicornr_table_clientdata'))
                                    ->where($db->quoteName('clientcode') . ' = ' . $db->quote($transaction->assignedcompany));
                                $db->setQuery($companyQuery);
                                $companyName = $db->loadResult();
                            }

                            // Format event_date in user's timezone as 'l, d F Y' at 8:00 AM
                            $formattedEventDate = '';
                            if (isset($transaction->createddate) && !empty($transaction->createddate)) {
                                try {
                                    $eventDate = new \Joomla\CMS\Date\Date($transaction->createddate, 'UTC');
                                    $eventDate->setTimezone(new \DateTimeZone($userTimezone));
                                    $eventDate->setTime(8, 0, 0);
                                    $formattedEventDate = $eventDate->format('l, d F Y');
                                } catch (\Exception $ex) {
                                    $formattedEventDate = $transaction->createddate;
                                }
                            }

                            // Replace variables, including user name
                            $replacements = [
                                '{user_name}' => isset($member->name) ? $member->name : '',
                                '{company}' => $companyName,
                                '{transaction_topic}' => isset($transaction->topic) ? $transaction->topic : '',
                                '{event_date}' => $formattedEventDate,
                                '{before_status}' => isset($statusTextMap[$beforeStatusId]) ? $statusTextMap[$beforeStatusId] : $logRow->before_transstatus,
                                '{after_status}' => isset($statusTextMap[$afterStatusId]) ? $statusTextMap[$afterStatusId] : $logRow->after_transstatus,
                            ];
                            $messageBody = strtr($msgTemplate, $replacements);

                            $postFields = [
                                'dreamztrack_user' => '68',
                                'function' => 'storeScheduleMessage',
                                'method' => 'apiWebhook',
                                'type' => 'contact',
                                'target' => $target,
                                'schedule_date_time' => $scheduleDateTime,
                                'template' => $workflow ? ($workflow->name . '_' . $workflow->id) : ('TransactionStatusChange_' . $transactionId),
                                'custom_field_1' => !empty($wfDetail['image']) ? 'Send Image' : 'Send Message Only',
                                'custom_field_2' => $messageBody,
                            ];
                            //die(var_dump(['postFields' => $postFields, 'image' => $image]));

                            $ch = curl_init('https://whatsapp.dreamztrack.com.my/index.php?option=com_ajax&plugin=downloadwhatsappcontacts&format=raw');
                            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                            curl_setopt($ch, CURLOPT_POST, true);

                            // die(var_dump($wfDetail));
                            if (!empty($wfDetail['image'])) {
                                $imagePath = $wfDetail['image'];
                                $tmpFile = tempnam(sys_get_temp_dir(), 'wfimg_');
                                file_put_contents($tmpFile, file_get_contents($imagePath));
                                $postFields['file'] = new CURLFile($tmpFile, mime_content_type($tmpFile), basename($imagePath));
                                curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
                                //die('here');
                            } else {
                                curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
                                //die('here2');
                            }

                            $response = curl_exec($ch);
                            $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                            $curlErrorNum = curl_errno($ch);
                            $curlError = curl_error($ch);
                            curl_close($ch);

                            if (!empty($wfDetail['image']) && isset($tmpFile) && file_exists($tmpFile)) {
                                unlink($tmpFile);
                            }

                            if ($curlErrorNum !== 0 || $httpcode != 200) {
                                $sendResults[] = [
                                    'member_code' => $member->code,
                                    'status' => 'error',
                                    'curl_error' => $curlError,
                                    'http_code' => $httpcode,
                                    'response' => $response
                                ];
                            } else {
                                $sendResults[] = [
                                    'member_code' => $member->code,
                                    'status' => 'sent',
                                    'response' => $response
                                ];
                            }
                        }
                    }
                }

                $allWorkflowDetails = array_merge($allWorkflowDetails, $workflowDetails);
                $allScheduleTimes = array_merge($allScheduleTimes, $scheduleTimes);

                // Only add to results if a workflow was found and message sent
                if (!empty($workflowDetails) && !empty($sendResults)) {
                    $results[] = [
                        'transaction_id' => $transactionId,
                        'notified_members' => $sendResults
                    ];
                    // Mark as notified after successful send
                    $this->markStatusLogNotified($logRow->id);
                }
            }
            return [
                'results' => $results,
                'workflow_details' => $allWorkflowDetails,
                'schedule_times' => $allScheduleTimes
            ];
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    /**
     * Helper to mark a status log row as notified
     */
    private function markStatusLogNotified($logId)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true)
            ->update($db->quoteName('#__unicornr_transaction_status_log'))
            ->set($db->quoteName('notified_to_user') . ' = 1')
            ->where($db->quoteName('id') . ' = ' . (int) $logId);
        $db->setQuery($query);
        $db->execute();
    }
}
