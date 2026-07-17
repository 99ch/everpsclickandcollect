{*
* 2019-2023 Team Ever
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
*
*  @author    Team Ever <https://www.team-ever.com/>
*  @copyright 2019-2023 Team Ever
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}
{assign var='tdStyle' value='padding:0.3rem 1rem 0.3rem 1rem;'}
{assign var='tableStyle' value='border-collapse:collapse;width:100%;'}
{assign var='headerBg' value='background-color:#e3e3e3;'}

<h4>{$order_reference|escape:'htmlall':'UTF-8'}</h4>

<table style="{$tableStyle}">
    <tr style="{$headerBg}">
        <td style="{$tdStyle}">{l s='Order reference' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Customer' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Address' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Postcode' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='City' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Phone' mod='everpsclickandcollect'}</td>
    </tr>
    <tr>
        <td style="{$tdStyle}">{$order_reference|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$customer_fullname|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$address_line|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$address_postcode|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$address_city|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$address_phone|escape:'htmlall':'UTF-8'}</td>
    </tr>
</table>

<h4>{l s='Ordered products' mod='everpsclickandcollect'}</h4>

<table style="{$tableStyle}">
    <tr style="{$headerBg}">
        <td style="{$tdStyle}">{l s='Product name' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Product reference' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Product quantity' mod='everpsclickandcollect'}</td>
    </tr>
    {foreach from=$order_products item=product}
        <tr>
            <td style="{$tdStyle}">{$product.name|escape:'htmlall':'UTF-8'}</td>
            <td style="{$tdStyle}">{$product.reference|escape:'htmlall':'UTF-8'}</td>
            <td style="{$tdStyle}">{$product.cart_quantity|intval}</td>
        </tr>
    {/foreach}
</table>

<h4>{l s='Order informations' mod='everpsclickandcollect'}</h4>

<table style="{$tableStyle}">
    <tr style="{$headerBg}">
        <td style="{$tdStyle}">{l s='Payment method' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Order date add' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Total paid' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Shipping method' mod='everpsclickandcollect'}</td>
        <td style="{$tdStyle}">{l s='Total shipping' mod='everpsclickandcollect'}</td>
    </tr>
    <tr>
        <td style="{$tdStyle}">{$order_payment|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$order_date_add|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$order_total_paid|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$carrier_name|escape:'htmlall':'UTF-8'}</td>
        <td style="{$tdStyle}">{$order_total_shipping|escape:'htmlall':'UTF-8'}</td>
    </tr>
</table>

<hr>
<hr>
