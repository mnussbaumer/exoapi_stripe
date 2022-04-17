defmodule ExOAPI.Stripe.SDK.Invoices do
  @doc """
  **description**: <p>Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.</p>

  """

  @spec post_invoices_invoice_pay(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :source => String.t(),
              :payment_method => String.t(),
              :paid_out_of_band => boolean(),
              :off_session => boolean(),
              :forgive => boolean(),
              :expand => [String.t()]
            }
            | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices_invoice_pay(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}/pay")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving an invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_invoices_invoice_lines_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_invoices_invoice_lines(
          client :: ExOAPI.Client.t(),
          invoice :: String.t(),
          list(get_invoices_invoice_lines_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_invoices_invoice_lines(%ExOAPI.Client{} = client, invoice, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}/lines")
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for invoices you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_invoices_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_invoices_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_invoices_search_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_invoices_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Stripe will automatically send invoices to customers according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to manually send an invoice to your customer out of the normal schedule, you can do so. When sending invoices that have already been paid, there will be no reference to the payment in the email.</p>

  <p>Requests made in test-mode result in no emails being sent, despite sending an <code>invoice.sent</code> event.</p>

  """

  @spec post_invoices_invoice_send(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices_invoice_send(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}/send")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>At any time, you can preview the upcoming invoice for a customer. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discounts that are applicable to the invoice.</p>

  <p>Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the invoice has not yet been created. As such, the upcoming invoice will not show up in invoice listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the amount that your customer will be billed, you can add, remove, or update pending invoice items, or update the customer’s discount.</p>

  <p>You can preview the effects of updating a subscription, including a preview of what proration will take place. To ensure that the actual proration is calculated exactly the same as the previewed proration, you should pass a <code>proration_date</code> parameter when doing the actual subscription update. The value passed in should be the same as the <code>subscription_proration_date</code> returned on the upcoming invoice resource. The recommended way to get only the prorations being previewed is to consider only proration line items where <code>period[start]</code> is equal to the <code>subscription_proration_date</code> on the upcoming invoice resource.</p>

  """
  @type get_invoices_upcoming_opts ::
          {:subscription_trial_from_plan, String.t()}
          | {:subscription_trial_end, String.t()}
          | {:subscription_start_date, String.t()}
          | {:subscription_proration_date, String.t()}
          | {:subscription_proration_behavior, String.t()}
          | {:subscription_items, String.t()}
          | {:subscription_default_tax_rates, String.t()}
          | {:subscription_cancel_now, String.t()}
          | {:subscription_cancel_at_period_end, String.t()}
          | {:subscription_cancel_at, String.t()}
          | {:subscription_billing_cycle_anchor, String.t()}
          | {:subscription, String.t()}
          | {:schedule, String.t()}
          | {:invoice_items, String.t()}
          | {:expand, String.t()}
          | {:discounts, String.t()}
          | {:customer_details, String.t()}
          | {:customer, String.t()}
          | {:coupon, String.t()}
          | {:automatic_tax, String.t()}
  @spec get_invoices_upcoming(client :: ExOAPI.Client.t(), list(get_invoices_upcoming_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_invoices_upcoming(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/upcoming")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:subscription_trial_from_plan, "subscription_trial_from_plan", "form", true},
      {:subscription_trial_end, "subscription_trial_end", "deepObject", true},
      {:subscription_start_date, "subscription_start_date", "form", true},
      {:subscription_proration_date, "subscription_proration_date", "form", true},
      {:subscription_proration_behavior, "subscription_proration_behavior", "form", true},
      {:subscription_items, "subscription_items", "deepObject", true},
      {:subscription_default_tax_rates, "subscription_default_tax_rates", "deepObject", true},
      {:subscription_cancel_now, "subscription_cancel_now", "form", true},
      {:subscription_cancel_at_period_end, "subscription_cancel_at_period_end", "form", true},
      {:subscription_cancel_at, "subscription_cancel_at", "deepObject", true},
      {:subscription_billing_cycle_anchor, "subscription_billing_cycle_anchor", "deepObject",
       true},
      {:subscription, "subscription", "form", true},
      {:schedule, "schedule", "form", true},
      {:invoice_items, "invoice_items", "deepObject", true},
      {:expand, "expand", "deepObject", true},
      {:discounts, "discounts", "deepObject", true},
      {:customer_details, "customer_details", "deepObject", true},
      {:customer, "customer", "form", true},
      {:coupon, "coupon", "form", true},
      {:automatic_tax, "automatic_tax", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>This endpoint creates a draft invoice for a given customer. The draft invoice created pulls in all pending invoice items on that customer, including prorations. The invoice remains a draft until you <a href="#finalize_invoice">finalize</a> the invoice, which allows you to <a href="#pay_invoice">pay</a> or <a href="#send_invoice">send</a> the invoice to your customers.</p>

  """

  @spec post_invoices(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data => %{:destination => String.t(), :amount => integer()},
              :subscription => String.t(),
              :statement_descriptor => String.t(),
              :pending_invoice_items_behavior =>
                String.t() | :exclude | :include | :include_and_require,
              :payment_settings => %{
                :payment_method_types =>
                  String.t()
                  | [
                      String.t()
                      | :ach_credit_transfer
                      | :ach_debit
                      | :acss_debit
                      | :au_becs_debit
                      | :bacs_debit
                      | :bancontact
                      | :boleto
                      | :card
                      | :customer_balance
                      | :fpx
                      | :giropay
                      | :grabpay
                      | :ideal
                      | :konbini
                      | :paynow
                      | :sepa_debit
                      | :sofort
                      | :us_bank_account
                      | :wechat_pay
                    ],
                :payment_method_options => %{
                  :us_bank_account =>
                    String.t()
                    | %{
                        :verification_method =>
                          String.t() | :automatic | :instant | :microdeposits
                      },
                  :konbini => String.t() | %{},
                  :customer_balance =>
                    String.t()
                    | %{:funding_type => String.t(), :bank_transfer => %{:type => String.t()}},
                  :card =>
                    String.t() | %{:request_three_d_secure => String.t() | :any | :automatic},
                  :bancontact =>
                    String.t() | %{:preferred_language => String.t() | :de | :en | :fr | :nl},
                  :acss_debit =>
                    String.t()
                    | %{
                        :verification_method =>
                          String.t() | :automatic | :instant | :microdeposits,
                        :mandate_options => %{
                          :transaction_type => String.t() | :business | :personal
                        }
                      }
                }
              },
              :on_behalf_of => String.t(),
              :metadata => String.t() | map(),
              :footer => String.t(),
              :expand => [String.t()],
              :due_date => integer(),
              :discounts => String.t() | [%{:discount => String.t(), :coupon => String.t()}],
              :description => String.t(),
              :default_tax_rates => [String.t()],
              :default_source => String.t(),
              :default_payment_method => String.t(),
              :days_until_due => integer(),
              :customer => String.t(),
              :custom_fields => String.t() | [%{:value => String.t(), :name => String.t()}],
              :collection_method => String.t() | :charge_automatically | :send_invoice,
              :automatic_tax => %{:enabled => boolean()},
              :auto_advance => boolean(),
              :application_fee_amount => integer(),
              :account_tax_ids => String.t() | [String.t()]
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can list all invoices, or list the invoices for a specific customer. The invoices are returned sorted by creation date, with the most recently created invoices appearing first.</p>

  """
  @type get_invoices_opts ::
          {:subscription, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:due_date, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
          | {:collection_method, String.t()}
  @spec get_invoices(client :: ExOAPI.Client.t(), list(get_invoices_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_invoices(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:subscription, "subscription", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:due_date, "due_date", "deepObject", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true},
      {:collection_method, "collection_method", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Marking an invoice as uncollectible is useful for keeping track of bad debts that can be written off for accounting purposes.</p>

  """

  @spec post_invoices_invoice_mark_uncollectible(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices_invoice_mark_uncollectible(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}/mark_uncollectible")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Permanently deletes a one-off invoice draft. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized or if an invoice is for a subscription, it must be <a href="#void_invoice">voided</a>.</p>

  """

  @spec delete_invoices_invoice(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_invoices_invoice(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Draft invoices are fully editable. Once an invoice is <a href="/docs/billing/invoices/workflow#finalized">finalized</a>,
  monetary values, as well as <code>collection_method</code>, become uneditable.</p>

  <p>If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on,
  sending reminders for, or <a href="/docs/billing/invoices/reconciliation">automatically reconciling</a> invoices, pass
  <code>auto_advance=false</code>.</p>

  """

  @spec post_invoices_invoice(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data => String.t() | %{:destination => String.t(), :amount => integer()},
              :statement_descriptor => String.t(),
              :payment_settings => %{
                :payment_method_types =>
                  String.t()
                  | [
                      String.t()
                      | :ach_credit_transfer
                      | :ach_debit
                      | :acss_debit
                      | :au_becs_debit
                      | :bacs_debit
                      | :bancontact
                      | :boleto
                      | :card
                      | :customer_balance
                      | :fpx
                      | :giropay
                      | :grabpay
                      | :ideal
                      | :konbini
                      | :paynow
                      | :sepa_debit
                      | :sofort
                      | :us_bank_account
                      | :wechat_pay
                    ],
                :payment_method_options => %{
                  :us_bank_account =>
                    String.t()
                    | %{
                        :verification_method =>
                          String.t() | :automatic | :instant | :microdeposits
                      },
                  :konbini => String.t() | %{},
                  :customer_balance =>
                    String.t()
                    | %{:funding_type => String.t(), :bank_transfer => %{:type => String.t()}},
                  :card =>
                    String.t() | %{:request_three_d_secure => String.t() | :any | :automatic},
                  :bancontact =>
                    String.t() | %{:preferred_language => String.t() | :de | :en | :fr | :nl},
                  :acss_debit =>
                    String.t()
                    | %{
                        :verification_method =>
                          String.t() | :automatic | :instant | :microdeposits,
                        :mandate_options => %{
                          :transaction_type => String.t() | :business | :personal
                        }
                      }
                }
              },
              :on_behalf_of => String.t(),
              :metadata => String.t() | map(),
              :footer => String.t(),
              :expand => [String.t()],
              :due_date => integer(),
              :discounts => String.t() | [%{:discount => String.t(), :coupon => String.t()}],
              :description => String.t(),
              :default_tax_rates => String.t() | [String.t()],
              :default_source => String.t(),
              :default_payment_method => String.t(),
              :days_until_due => integer(),
              :custom_fields => String.t() | [%{:value => String.t(), :name => String.t()}],
              :collection_method => String.t() | :charge_automatically | :send_invoice,
              :automatic_tax => %{:enabled => boolean()},
              :auto_advance => boolean(),
              :application_fee_amount => integer(),
              :account_tax_ids => String.t() | [String.t()]
            }
            | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices_invoice(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the invoice with the given ID.</p>

  """
  @type get_invoices_invoice_opts :: {:expand, String.t()}
  @spec get_invoices_invoice(
          client :: ExOAPI.Client.t(),
          invoice :: String.t(),
          list(get_invoices_invoice_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_invoices_invoice(%ExOAPI.Client{} = client, invoice, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}")
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Stripe automatically finalizes drafts before sending and attempting payment on invoices. However, if you’d like to finalize a draft invoice manually, you can do so using this method.</p>

  """

  @spec post_invoices_invoice_finalize(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()], :auto_advance => boolean()} | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices_invoice_finalize(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}/finalize")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving an upcoming invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_invoices_upcoming_lines_opts ::
          {:subscription_trial_from_plan, String.t()}
          | {:subscription_trial_end, String.t()}
          | {:subscription_start_date, String.t()}
          | {:subscription_proration_date, String.t()}
          | {:subscription_proration_behavior, String.t()}
          | {:subscription_items, String.t()}
          | {:subscription_default_tax_rates, String.t()}
          | {:subscription_cancel_now, String.t()}
          | {:subscription_cancel_at_period_end, String.t()}
          | {:subscription_cancel_at, String.t()}
          | {:subscription_billing_cycle_anchor, String.t()}
          | {:subscription, String.t()}
          | {:starting_after, String.t()}
          | {:schedule, String.t()}
          | {:limit, String.t()}
          | {:invoice_items, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:discounts, String.t()}
          | {:customer_details, String.t()}
          | {:customer, String.t()}
          | {:coupon, String.t()}
          | {:automatic_tax, String.t()}
  @spec get_invoices_upcoming_lines(
          client :: ExOAPI.Client.t(),
          list(get_invoices_upcoming_lines_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_invoices_upcoming_lines(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/upcoming/lines")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:subscription_trial_from_plan, "subscription_trial_from_plan", "form", true},
      {:subscription_trial_end, "subscription_trial_end", "deepObject", true},
      {:subscription_start_date, "subscription_start_date", "form", true},
      {:subscription_proration_date, "subscription_proration_date", "form", true},
      {:subscription_proration_behavior, "subscription_proration_behavior", "form", true},
      {:subscription_items, "subscription_items", "deepObject", true},
      {:subscription_default_tax_rates, "subscription_default_tax_rates", "deepObject", true},
      {:subscription_cancel_now, "subscription_cancel_now", "form", true},
      {:subscription_cancel_at_period_end, "subscription_cancel_at_period_end", "form", true},
      {:subscription_cancel_at, "subscription_cancel_at", "deepObject", true},
      {:subscription_billing_cycle_anchor, "subscription_billing_cycle_anchor", "deepObject",
       true},
      {:subscription, "subscription", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:schedule, "schedule", "form", true},
      {:limit, "limit", "form", true},
      {:invoice_items, "invoice_items", "deepObject", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:discounts, "discounts", "deepObject", true},
      {:customer_details, "customer_details", "deepObject", true},
      {:customer, "customer", "form", true},
      {:coupon, "coupon", "form", true},
      {:automatic_tax, "automatic_tax", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to <a href="#delete_invoice">deletion</a>, however it only applies to finalized invoices and maintains a papertrail where the invoice can still be found.</p>

  """

  @spec post_invoices_invoice_void(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          invoice :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoices_invoice_void(%ExOAPI.Client{} = client, body, invoice) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoices/{invoice}/void")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoice", invoice)
    |> ExOAPI.Client.request()
  end
end