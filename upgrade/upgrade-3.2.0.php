<?php
/**
 * 2019-2023 Team Ever
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 *  @author    Team Ever <https://www.team-ever.com/>
 *  @copyright 2019-2023 Team Ever
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

function upgrade_module_3_2_0($module)
{
    $db = Db::getInstance();
    $result = true;

    $tables = array(
        'everpsclickandcollect_store',
        'everpsclickandcollect_store_stock',
    );

    foreach ($tables as $table) {
        $fullTable = _DB_PREFIX_ . $table;
        $exists = $db->executeS(
            'SHOW COLUMNS FROM `' . bqSQL($fullTable) . '` LIKE \'id_vendor\''
        );
        if (empty($exists)) {
            $result = $result && $db->execute(
                'ALTER TABLE `' . bqSQL($fullTable) . '` '
                . 'ADD COLUMN `id_vendor` INT UNSIGNED NULL DEFAULT NULL'
            );
        }
    }

    $indexes = array(
        'everpsclickandcollect_store' => array(
            'idx_ecc_store_vendor' => '`id_vendor`',
        ),
        'everpsclickandcollect_store_stock' => array(
            'idx_ecc_stock_vendor_store' => '`id_vendor`, `id_store`',
        ),
    );

    foreach ($indexes as $table => $tableIndexes) {
        $fullTable = _DB_PREFIX_ . $table;
        foreach ($tableIndexes as $indexName => $columns) {
            $existing = $db->executeS(
                'SHOW INDEX FROM `' . bqSQL($fullTable) . '` '
                . 'WHERE Key_name = \'' . bqSQL($indexName) . '\''
            );
            if (empty($existing)) {
                $result = $result && $db->execute(
                    'ALTER TABLE `' . bqSQL($fullTable) . '` '
                    . 'ADD INDEX `' . bqSQL($indexName) . '` (' . $columns . ')'
                );
            }
        }
    }

    return $result;
}
