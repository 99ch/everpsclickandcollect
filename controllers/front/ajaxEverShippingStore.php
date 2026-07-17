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

class EverpsclickandcollectAjaxEverShippingStoreModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        $this->isSeven = Tools::version_compare(_PS_VERSION_, '1.7', '>=') ? true : false;
        $this->ajax = true;

        parent::initContent();
    }

    /**
     * Ajax Process
     */
    public function displayAjaxSaveShippingStore()
    {
        if (!Tools::getValue('everclickncollect_id')
            || !Validate::isInt(Tools::getValue('everclickncollect_id'))
        ) {
            die(json_encode(array(
                'return' => false,
                'error' => $this->module->l('ID store is not valid')
            )));
        }
        $askDate = (bool) Configuration::get('EVERPSCLICKANDCOLLECT_ASK_DATE');
        $delivery_date = null;
        if ($askDate) {
            $rawDate = Tools::getValue('everclickncollect_date');
            if ($rawDate) {
                if (!Validate::isDate($rawDate)) {
                    die(json_encode(array(
                        'return' => false,
                        'error' => $this->module->l('Date is not valid')
                    )));
                }
                $delivery_date = pSQL($rawDate);
                $this->context->cookie->__set(
                    'everclickncollect_date',
                    $rawDate
                );
            }
        }
        $cart = Context::getContext()->cart;
        Db::getInstance()->insert(
            'everpsclickandcollect',
            array(
                'id_cart' => (int)$cart->id,
                'id_store' => (int)Tools::getValue('everclickncollect_id'),
                'delivery_date' => (string)$delivery_date
            ),
            false,
            true,
            Db::REPLACE
        );
        Context::getContext()->cookie->__unset('everclickncollect_id');
        $this->context->cookie->__set(
            'everclickncollect_id',
            Tools::getValue('everclickncollect_id')
        );
        die(json_encode(array(
            'return' => true,
            'success' => $this->module->l('Store has been saved')
        )));
    }
}
