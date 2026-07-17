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
<div class="panel">
    <div class="panel-heading">
        <i class="icon-users"></i> {l s='Vendor assignment per pickup store' mod='everpsclickandcollect'}
    </div>
    <p class="text-muted">
        {l s='Assign each pickup store to a marketplace vendor. Leave empty to keep the store unassigned (shared). The id_vendor is defined by your marketplace module.' mod='everpsclickandcollect'}
    </p>
    <form action="{$current_index|escape:'htmlall':'UTF-8'}&token={$vendor_mapping_token|escape:'htmlall':'UTF-8'}" method="post">
        <table class="table">
            <thead>
                <tr>
                    <th>{l s='Store' mod='everpsclickandcollect'}</th>
                    <th style="width:220px">{l s='Vendor ID' mod='everpsclickandcollect'}</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$vendor_mapping_stores item=store}
                    <tr>
                        <td>
                            <strong>{$store.name|escape:'htmlall':'UTF-8'}</strong>
                            <small class="text-muted">(#{$store.id_store|intval})</small>
                        </td>
                        <td>
                            <input
                                type="number"
                                min="0"
                                class="form-control"
                                name="vendor_map[{$store.id_store|intval}]"
                                value="{if $store.id_vendor !== null}{$store.id_vendor|intval}{/if}"
                                placeholder="{l s='empty = unassigned' mod='everpsclickandcollect'}"
                            />
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="panel-footer">
            <button type="submit" name="submitEverpsclickandcollectVendorMapping" class="btn btn-primary pull-right">
                <i class="process-icon-save"></i> {l s='Save vendor assignments' mod='everpsclickandcollect'}
            </button>
        </div>
    </form>
</div>
