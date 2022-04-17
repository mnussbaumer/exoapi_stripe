defmodule ExOAPI.Stripe.SDK.Customers do
  @doc """
  **description**: <p>Delete a specified source for a given customer.</p>

  """

  @spec delete_customers_customer_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedPaymentSource.t()
           | ExOAPI.Stripe.Schemas.PaymentSource.t()
           | map()}
          | {:error, any()}
  def delete_customers_customer_bank_accounts_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/bank_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Update a specified source for a given customer.</p>

  """

  @spec post_customers_customer_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :owner => %{
                :phone => String.t(),
                :name => String.t(),
                :email => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :name => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :exp_year => String.t(),
              :exp_month => String.t(),
              :address_zip => String.t(),
              :address_state => String.t(),
              :address_line2 => String.t(),
              :address_line1 => String.t(),
              :address_country => String.t(),
              :address_city => String.t(),
              :account_holder_type => String.t() | :company | :individual,
              :account_holder_name => String.t()
            }
            | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.Source.t()
           | ExOAPI.Stripe.Schemas.BankAccount.t()
           | ExOAPI.Stripe.Schemas.Card.t()
           | map()}
          | {:error, any()}
  def post_customers_customer_bank_accounts_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/bank_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>By default, you can see the 10 most recent sources stored on a Customer directly on the object, but you can also retrieve details about a specific bank account stored on the Stripe account.</p>

  **deprecated**: true

  """
  @type get_customers_customer_bank_accounts_id_opts :: {:expand, String.t()}
  @spec get_customers_customer_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_bank_accounts_id_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.BankAccount.t() | map()}
          | {:error, any()}
  def get_customers_customer_bank_accounts_id(%ExOAPI.Client{} = client, id, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/bank_accounts/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Removes the currently applied discount on a customer.</p>

  """

  @spec delete_customers_customer_discount(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedDiscount.t() | map()}
          | {:error, any()}
  def delete_customers_customer_discount(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/discount")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @type get_customers_customer_discount_opts :: {:expand, String.t()}
  @spec get_customers_customer_discount(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_discount_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Discount.t() | map()}
          | {:error, any()}
  def get_customers_customer_discount(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/discount")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When you create a new credit card, you must specify a customer or recipient on which to create it.</p>

  <p>If the card’s owner has no default card, then the new card will become the default.
  However, if the owner already has a default, then it will not change.
  To change the default, you should <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>.</p>

  """

  @spec post_customers_customer_bank_accounts(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :source => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :card =>
                String.t()
                | %{
                    :object => String.t() | :card,
                    :number => String.t(),
                    :name => String.t(),
                    :metadata => map(),
                    :exp_year => integer(),
                    :exp_month => integer(),
                    :cvc => String.t(),
                    :address_zip => String.t(),
                    :address_state => String.t(),
                    :address_line2 => String.t(),
                    :address_line1 => String.t(),
                    :address_country => String.t(),
                    :address_city => String.t()
                  },
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  },
              :alipay_account => String.t()
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentSource.t() | map()}
          | {:error, any()}
  def post_customers_customer_bank_accounts(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/bank_accounts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can see a list of the bank accounts belonging to a Customer. Note that the 10 most recent sources are always available by default on the Customer. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional bank accounts.</p>

  **deprecated**: true

  """
  @type get_customers_customer_bank_accounts_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_bank_accounts(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_bank_accounts_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.BankAccount.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_bank_accounts(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/bank_accounts")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When you create a new credit card, you must specify a customer or recipient on which to create it.</p>

  <p>If the card’s owner has no default card, then the new card will become the default.
  However, if the owner already has a default, then it will not change.
  To change the default, you should <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>.</p>

  """

  @spec post_customers_customer_sources(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :source => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :card =>
                String.t()
                | %{
                    :object => String.t() | :card,
                    :number => String.t(),
                    :name => String.t(),
                    :metadata => map(),
                    :exp_year => integer(),
                    :exp_month => integer(),
                    :cvc => String.t(),
                    :address_zip => String.t(),
                    :address_state => String.t(),
                    :address_line2 => String.t(),
                    :address_line1 => String.t(),
                    :address_country => String.t(),
                    :address_city => String.t()
                  },
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  },
              :alipay_account => String.t()
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentSource.t() | map()}
          | {:error, any()}
  def post_customers_customer_sources(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/sources")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List sources for a specified customer.</p>

  """
  @type get_customers_customer_sources_opts ::
          {:starting_after, String.t()}
          | {:object, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_sources(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_sources_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [
                 ExOAPI.Stripe.Schemas.Source.t()
                 | ExOAPI.Stripe.Schemas.Card.t()
                 | ExOAPI.Stripe.Schemas.BitcoinReceiver.t()
                 | ExOAPI.Stripe.Schemas.BankAccount.t()
                 | ExOAPI.Stripe.Schemas.AlipayAccount.t()
               ]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_sources(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/sources")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:object, "object", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new subscription on an existing customer.</p>

  """

  @spec post_customers_customer_subscriptions(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :trial_period_days => integer(),
              :trial_from_plan => boolean(),
              :trial_end => integer() | String.t() | :now,
              :transfer_data => %{:destination => String.t(), :amount_percent => number()},
              :proration_behavior => String.t() | :always_invoice | :create_prorations | :none,
              :promotion_code => String.t(),
              :pending_invoice_item_interval =>
                String.t()
                | %{
                    :interval_count => integer(),
                    :interval => String.t() | :day | :month | :week | :year
                  },
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
                    String.t()
                    | %{
                        :request_three_d_secure => String.t() | :any | :automatic,
                        :mandate_options => %{
                          :description => String.t(),
                          :amount_type => String.t() | :fixed | :maximum,
                          :amount => integer()
                        }
                      },
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
              :payment_behavior =>
                String.t()
                | :allow_incomplete
                | :default_incomplete
                | :error_if_incomplete
                | :pending_if_incomplete,
              :off_session => boolean(),
              :metadata => String.t() | map(),
              :items => [
                %{
                  :tax_rates => String.t() | [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :recurring => %{
                      :interval_count => integer(),
                      :interval => String.t() | :day | :month | :week | :year
                    },
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t(),
                  :metadata => map(),
                  :billing_thresholds => String.t() | %{:usage_gte => integer()}
                }
              ],
              :expand => [String.t()],
              :default_tax_rates => String.t() | [String.t()],
              :default_source => String.t(),
              :default_payment_method => String.t(),
              :days_until_due => integer(),
              :coupon => String.t(),
              :collection_method => String.t() | :charge_automatically | :send_invoice,
              :cancel_at_period_end => boolean(),
              :cancel_at => integer(),
              :billing_thresholds =>
                String.t() | %{:reset_billing_cycle_anchor => boolean(), :amount_gte => integer()},
              :billing_cycle_anchor => integer(),
              :backdate_start_date => integer(),
              :automatic_tax => %{:enabled => boolean()},
              :application_fee_percent => number(),
              :add_invoice_items => [
                %{
                  :tax_rates => String.t() | [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t()
                }
              ]
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Subscription.t() | map()}
          | {:error, any()}
  def post_customers_customer_subscriptions(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/subscriptions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can see a list of the customer’s active subscriptions. Note that the 10 most recent active subscriptions are always available by default on the customer object. If you need more than those 10, you can use the limit and starting_after parameters to page through additional subscriptions.</p>

  """
  @type get_customers_customer_subscriptions_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_subscriptions(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_subscriptions_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Subscription.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_subscriptions(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/subscriptions")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes an existing <code>TaxID</code> object.</p>

  """

  @spec delete_customers_customer_tax_ids_id(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedTaxId.t() | map()}
          | {:error, any()}
  def delete_customers_customer_tax_ids_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/tax_ids/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the <code>TaxID</code> object with the given identifier.</p>

  """
  @type get_customers_customer_tax_ids_id_opts :: {:expand, String.t()}
  @spec get_customers_customer_tax_ids_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_tax_ids_id_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.TaxId.t() | map()}
          | {:error, any()}
  def get_customers_customer_tax_ids_id(%ExOAPI.Client{} = client, id, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/tax_ids/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Cancels a customer’s subscription. If you set the <code>at_period_end</code> parameter to <code>true</code>, the subscription will remain active until the end of the period, at which point it will be canceled and not renewed. Otherwise, with the default <code>false</code> value, the subscription is terminated immediately. In either case, the customer will not be charged again for the subscription.</p>

  <p>Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.</p>

  <p>By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.</p>

  """

  @spec delete_customers_customer_subscriptions_subscription_exposed_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{:prorate => boolean(), :invoice_now => boolean(), :expand => [String.t()]} | map(),
          subscription_exposed_id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Subscription.t() | map()}
          | {:error, any()}
  def delete_customers_customer_subscriptions_subscription_exposed_id(
        %ExOAPI.Client{} = client,
        body,
        subscription_exposed_id,
        customer
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/subscriptions/{subscription_exposed_id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>

  """

  @spec post_customers_customer_subscriptions_subscription_exposed_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :trial_from_plan => boolean(),
              :trial_end => integer() | String.t() | :now,
              :transfer_data =>
                String.t() | %{:destination => String.t(), :amount_percent => number()},
              :proration_date => integer(),
              :proration_behavior => String.t() | :always_invoice | :create_prorations | :none,
              :promotion_code => String.t(),
              :pending_invoice_item_interval =>
                String.t()
                | %{
                    :interval_count => integer(),
                    :interval => String.t() | :day | :month | :week | :year
                  },
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
                    String.t()
                    | %{
                        :request_three_d_secure => String.t() | :any | :automatic,
                        :mandate_options => %{
                          :description => String.t(),
                          :amount_type => String.t() | :fixed | :maximum,
                          :amount => integer()
                        }
                      },
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
              :payment_behavior =>
                String.t()
                | :allow_incomplete
                | :default_incomplete
                | :error_if_incomplete
                | :pending_if_incomplete,
              :pause_collection =>
                String.t()
                | %{
                    :resumes_at => integer(),
                    :behavior => String.t() | :keep_as_draft | :mark_uncollectible | :void
                  },
              :off_session => boolean(),
              :metadata => String.t() | map(),
              :items => [
                %{
                  :tax_rates => String.t() | [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :recurring => %{
                      :interval_count => integer(),
                      :interval => String.t() | :day | :month | :week | :year
                    },
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t(),
                  :metadata => String.t() | map(),
                  :id => String.t(),
                  :deleted => boolean(),
                  :clear_usage => boolean(),
                  :billing_thresholds => String.t() | %{:usage_gte => integer()}
                }
              ],
              :expand => [String.t()],
              :default_tax_rates => String.t() | [String.t()],
              :default_source => String.t(),
              :default_payment_method => String.t(),
              :days_until_due => integer(),
              :coupon => String.t(),
              :collection_method => String.t() | :charge_automatically | :send_invoice,
              :cancel_at_period_end => boolean(),
              :cancel_at => String.t() | integer(),
              :billing_thresholds =>
                String.t() | %{:reset_billing_cycle_anchor => boolean(), :amount_gte => integer()},
              :billing_cycle_anchor => String.t() | :now | :unchanged,
              :automatic_tax => %{:enabled => boolean()},
              :application_fee_percent => number(),
              :add_invoice_items => [
                %{
                  :tax_rates => String.t() | [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t()
                }
              ]
            }
            | map(),
          subscription_exposed_id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Subscription.t() | map()}
          | {:error, any()}
  def post_customers_customer_subscriptions_subscription_exposed_id(
        %ExOAPI.Client{} = client,
        body,
        subscription_exposed_id,
        customer
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/subscriptions/{subscription_exposed_id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the subscription with the given ID.</p>

  """
  @type get_customers_customer_subscriptions_subscription_exposed_id_opts :: {:expand, String.t()}
  @spec get_customers_customer_subscriptions_subscription_exposed_id(
          client :: ExOAPI.Client.t(),
          subscription_exposed_id :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_subscriptions_subscription_exposed_id_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Subscription.t() | map()}
          | {:error, any()}
  def get_customers_customer_subscriptions_subscription_exposed_id(
        %ExOAPI.Client{} = client,
        subscription_exposed_id,
        customer,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/subscriptions/{subscription_exposed_id}")
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When you create a new credit card, you must specify a customer or recipient on which to create it.</p>

  <p>If the card’s owner has no default card, then the new card will become the default.
  However, if the owner already has a default, then it will not change.
  To change the default, you should <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>.</p>

  """

  @spec post_customers_customer_cards(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :source => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :card =>
                String.t()
                | %{
                    :object => String.t() | :card,
                    :number => String.t(),
                    :name => String.t(),
                    :metadata => map(),
                    :exp_year => integer(),
                    :exp_month => integer(),
                    :cvc => String.t(),
                    :address_zip => String.t(),
                    :address_state => String.t(),
                    :address_line2 => String.t(),
                    :address_line1 => String.t(),
                    :address_country => String.t(),
                    :address_city => String.t()
                  },
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  },
              :alipay_account => String.t()
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentSource.t() | map()}
          | {:error, any()}
  def post_customers_customer_cards(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/cards")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can see a list of the cards belonging to a customer.
  Note that the 10 most recent sources are always available on the <code>Customer</code> object.
  If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional cards.</p>

  **deprecated**: true

  """
  @type get_customers_customer_cards_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_cards(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_cards_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Card.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_cards(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/cards")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Most credit balance transaction fields are immutable, but you may update its <code>description</code> and <code>metadata</code>.</p>

  """

  @spec post_customers_customer_balance_transactions_transaction(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t()
            }
            | map(),
          transaction :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.CustomerBalanceTransaction.t()
           | map()}
          | {:error, any()}
  def post_customers_customer_balance_transactions_transaction(
        %ExOAPI.Client{} = client,
        body,
        transaction,
        customer
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/balance_transactions/{transaction}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("transaction", transaction)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a specific customer balance transaction that updated the customer’s <a href="/docs/billing/customer/balance">balances</a>.</p>

  """
  @type get_customers_customer_balance_transactions_transaction_opts :: {:expand, String.t()}
  @spec get_customers_customer_balance_transactions_transaction(
          client :: ExOAPI.Client.t(),
          transaction :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_balance_transactions_transaction_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.CustomerBalanceTransaction.t()
           | map()}
          | {:error, any()}
  def get_customers_customer_balance_transactions_transaction(
        %ExOAPI.Client{} = client,
        transaction,
        customer,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/balance_transactions/{transaction}")
    |> ExOAPI.Client.replace_in_path("transaction", transaction)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Verify a specified bank account for a given customer.</p>

  """

  @spec post_customers_customer_sources_id_verify(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()], :amounts => [integer()]} | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.BankAccount.t() | map()}
          | {:error, any()}
  def post_customers_customer_sources_id_verify(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/sources/{id}/verify")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Verify a specified bank account for a given customer.</p>

  """

  @spec post_customers_customer_bank_accounts_id_verify(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()], :amounts => [integer()]} | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.BankAccount.t() | map()}
          | {:error, any()}
  def post_customers_customer_bank_accounts_id_verify(
        %ExOAPI.Client{} = client,
        body,
        id,
        customer
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/bank_accounts/{id}/verify")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for customers you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_customers_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_customers_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_customers_search_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :total_count => integer(),
               :object => String.t() | :search_result,
               :next_page => String.t(),
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Customer.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Removes the currently applied discount on a customer.</p>

  """

  @spec delete_customers_customer_subscriptions_subscription_exposed_id_discount(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          subscription_exposed_id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedDiscount.t() | map()}
          | {:error, any()}
  def delete_customers_customer_subscriptions_subscription_exposed_id_discount(
        %ExOAPI.Client{} = client,
        body,
        subscription_exposed_id,
        customer
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path(
      "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount"
    )
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @type get_customers_customer_subscriptions_subscription_exposed_id_discount_opts ::
          {:expand, String.t()}
  @spec get_customers_customer_subscriptions_subscription_exposed_id_discount(
          client :: ExOAPI.Client.t(),
          subscription_exposed_id :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_subscriptions_subscription_exposed_id_discount_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Discount.t() | map()}
          | {:error, any()}
  def get_customers_customer_subscriptions_subscription_exposed_id_discount(
        %ExOAPI.Client{} = client,
        subscription_exposed_id,
        customer,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path(
      "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount"
    )
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates an immutable transaction that updates the customer’s credit <a href="/docs/billing/customer/balance">balance</a>.</p>

  """

  @spec post_customers_customer_balance_transactions(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t(),
              :currency => String.t(),
              :amount => integer()
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.CustomerBalanceTransaction.t()
           | map()}
          | {:error, any()}
  def post_customers_customer_balance_transactions(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/balance_transactions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of transactions that updated the customer’s <a href="/docs/billing/customer/balance">balances</a>.</p>

  """
  @type get_customers_customer_balance_transactions_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_balance_transactions(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_balance_transactions_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.CustomerBalanceTransaction.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_balance_transactions(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/balance_transactions")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>TaxID</code> object for a customer.</p>

  """

  @spec post_customers_customer_tax_ids(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :value => String.t(),
              :type =>
                String.t()
                | :ae_trn
                | :au_abn
                | :au_arn
                | :bg_uic
                | :br_cnpj
                | :br_cpf
                | :ca_bn
                | :ca_gst_hst
                | :ca_pst_bc
                | :ca_pst_mb
                | :ca_pst_sk
                | :ca_qst
                | :ch_vat
                | :cl_tin
                | :es_cif
                | :eu_vat
                | :gb_vat
                | :ge_vat
                | :hk_br
                | :hu_tin
                | :id_npwp
                | :il_vat
                | :in_gst
                | :is_vat
                | :jp_cn
                | :jp_rn
                | :kr_brn
                | :li_uid
                | :mx_rfc
                | :my_frp
                | :my_itn
                | :my_sst
                | :no_vat
                | :nz_gst
                | :ru_inn
                | :ru_kpp
                | :sa_vat
                | :sg_gst
                | :sg_uen
                | :si_tin
                | :th_vat
                | :tw_vat
                | :ua_vat
                | :us_ein
                | :za_vat,
              :expand => [String.t()]
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.TaxId.t() | map()}
          | {:error, any()}
  def post_customers_customer_tax_ids(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/tax_ids")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of tax IDs for a customer.</p>

  """
  @type get_customers_customer_tax_ids_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_tax_ids(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_tax_ids_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.TaxId.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_tax_ids(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/tax_ids")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a specified source for a given customer.</p>

  """

  @spec delete_customers_customer_sources_id(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedPaymentSource.t()
           | ExOAPI.Stripe.Schemas.PaymentSource.t()
           | map()}
          | {:error, any()}
  def delete_customers_customer_sources_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/sources/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Update a specified source for a given customer.</p>

  """

  @spec post_customers_customer_sources_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :owner => %{
                :phone => String.t(),
                :name => String.t(),
                :email => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :name => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :exp_year => String.t(),
              :exp_month => String.t(),
              :address_zip => String.t(),
              :address_state => String.t(),
              :address_line2 => String.t(),
              :address_line1 => String.t(),
              :address_country => String.t(),
              :address_city => String.t(),
              :account_holder_type => String.t() | :company | :individual,
              :account_holder_name => String.t()
            }
            | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.Source.t()
           | ExOAPI.Stripe.Schemas.BankAccount.t()
           | ExOAPI.Stripe.Schemas.Card.t()
           | map()}
          | {:error, any()}
  def post_customers_customer_sources_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/sources/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a specified source for a given customer.</p>

  """
  @type get_customers_customer_sources_id_opts :: {:expand, String.t()}
  @spec get_customers_customer_sources_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_sources_id_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentSource.t() | map()}
          | {:error, any()}
  def get_customers_customer_sources_id(%ExOAPI.Client{} = client, id, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/sources/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new customer object.</p>

  """

  @spec post_customers(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :test_clock => String.t(),
              :tax_id_data => [
                %{
                  :value => String.t(),
                  :type =>
                    String.t()
                    | :ae_trn
                    | :au_abn
                    | :au_arn
                    | :bg_uic
                    | :br_cnpj
                    | :br_cpf
                    | :ca_bn
                    | :ca_gst_hst
                    | :ca_pst_bc
                    | :ca_pst_mb
                    | :ca_pst_sk
                    | :ca_qst
                    | :ch_vat
                    | :cl_tin
                    | :es_cif
                    | :eu_vat
                    | :gb_vat
                    | :ge_vat
                    | :hk_br
                    | :hu_tin
                    | :id_npwp
                    | :il_vat
                    | :in_gst
                    | :is_vat
                    | :jp_cn
                    | :jp_rn
                    | :kr_brn
                    | :li_uid
                    | :mx_rfc
                    | :my_frp
                    | :my_itn
                    | :my_sst
                    | :no_vat
                    | :nz_gst
                    | :ru_inn
                    | :ru_kpp
                    | :sa_vat
                    | :sg_gst
                    | :sg_uen
                    | :si_tin
                    | :th_vat
                    | :tw_vat
                    | :ua_vat
                    | :us_ein
                    | :za_vat
                }
              ],
              :tax_exempt => String.t() | :exempt | :none | :reverse,
              :tax => %{:ip_address => String.t()},
              :source => String.t(),
              :shipping =>
                String.t()
                | %{
                    :phone => String.t(),
                    :name => String.t(),
                    :address => %{
                      :state => String.t(),
                      :postal_code => String.t(),
                      :line2 => String.t(),
                      :line1 => String.t(),
                      :country => String.t(),
                      :city => String.t()
                    }
                  },
              :promotion_code => String.t(),
              :preferred_locales => [String.t()],
              :phone => String.t(),
              :payment_method => String.t(),
              :next_invoice_sequence => integer(),
              :name => String.t(),
              :metadata => String.t() | map(),
              :invoice_settings => %{
                :footer => String.t(),
                :default_payment_method => String.t(),
                :custom_fields => String.t() | [%{:value => String.t(), :name => String.t()}]
              },
              :invoice_prefix => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :description => String.t(),
              :coupon => String.t(),
              :cash_balance => %{
                :settings => %{:reconciliation_mode => String.t() | :automatic | :manual}
              },
              :balance => integer(),
              :address =>
                String.t()
                | %{
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  }
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Customer.t() | map()}
          | {:error, any()}
  def post_customers(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.</p>

  """
  @type get_customers_opts ::
          {:test_clock, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:email, String.t()}
          | {:created, String.t()}
  @spec get_customers(client :: ExOAPI.Client.t(), list(get_customers_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Customer.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:test_clock, "test_clock", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:email, "email", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of PaymentMethods for a given Customer</p>

  """
  @type get_customers_customer_payment_methods_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_customers_customer_payment_methods(
          client :: ExOAPI.Client.t(),
          type :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_payment_methods_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.PaymentMethod.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_payment_methods(
        %ExOAPI.Client{} = client,
        type,
        customer,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/payment_methods")
    |> ExOAPI.Client.add_query("type", type)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a specified source for a given customer.</p>

  """

  @spec delete_customers_customer_cards_id(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedPaymentSource.t()
           | ExOAPI.Stripe.Schemas.PaymentSource.t()
           | map()}
          | {:error, any()}
  def delete_customers_customer_cards_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/cards/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Update a specified source for a given customer.</p>

  """

  @spec post_customers_customer_cards_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :owner => %{
                :phone => String.t(),
                :name => String.t(),
                :email => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :name => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :exp_year => String.t(),
              :exp_month => String.t(),
              :address_zip => String.t(),
              :address_state => String.t(),
              :address_line2 => String.t(),
              :address_line1 => String.t(),
              :address_country => String.t(),
              :address_city => String.t(),
              :account_holder_type => String.t() | :company | :individual,
              :account_holder_name => String.t()
            }
            | map(),
          id :: String.t(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.Source.t()
           | ExOAPI.Stripe.Schemas.BankAccount.t()
           | ExOAPI.Stripe.Schemas.Card.t()
           | map()}
          | {:error, any()}
  def post_customers_customer_cards_id(%ExOAPI.Client{} = client, body, id, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/cards/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can always see the 10 most recent cards directly on a customer; this method lets you retrieve details about a specific card stored on the customer.</p>

  **deprecated**: true

  """
  @type get_customers_customer_cards_id_opts :: {:expand, String.t()}
  @spec get_customers_customer_cards_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          customer :: String.t(),
          list(get_customers_customer_cards_id_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Card.t() | map()}
          | {:error, any()}
  def get_customers_customer_cards_id(%ExOAPI.Client{} = client, id, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/cards/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.</p>

  """

  @spec delete_customers_customer(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedCustomer.t() | map()}
          | {:error, any()}
  def delete_customers_customer(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged. For example, if you pass the <strong>source</strong> parameter, that becomes the customer’s active source (e.g., a card) to be used for all charges in the future. When you update a customer to a new valid card source by passing the <strong>source</strong> parameter: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the <code>past_due</code> state, then the latest open invoice for the subscription with automatic collection enabled will be retried. This retry will not count as an automatic retry, and will not affect the next regularly scheduled payment for the invoice. Changing the <strong>default_source</strong> for a customer will not trigger this behavior.</p>

  <p>This request accepts mostly the same arguments as the customer creation call.</p>

  """

  @spec post_customers_customer(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :trial_end => integer() | String.t() | :now,
              :tax_exempt => String.t() | :exempt | :none | :reverse,
              :tax => %{:ip_address => String.t()},
              :source => String.t(),
              :shipping =>
                String.t()
                | %{
                    :phone => String.t(),
                    :name => String.t(),
                    :address => %{
                      :state => String.t(),
                      :postal_code => String.t(),
                      :line2 => String.t(),
                      :line1 => String.t(),
                      :country => String.t(),
                      :city => String.t()
                    }
                  },
              :promotion_code => String.t(),
              :preferred_locales => [String.t()],
              :phone => String.t(),
              :next_invoice_sequence => integer(),
              :name => String.t(),
              :metadata => String.t() | map(),
              :invoice_settings => %{
                :footer => String.t(),
                :default_payment_method => String.t(),
                :custom_fields => String.t() | [%{:value => String.t(), :name => String.t()}]
              },
              :invoice_prefix => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :description => String.t(),
              :default_source => String.t(),
              :default_card => String.t(),
              :default_bank_account => String.t(),
              :default_alipay_account => String.t(),
              :coupon => String.t(),
              :cash_balance => %{
                :settings => %{:reconciliation_mode => String.t() | :automatic | :manual}
              },
              :card =>
                String.t()
                | %{
                    :object => String.t() | :card,
                    :number => String.t(),
                    :name => String.t(),
                    :metadata => map(),
                    :exp_year => integer(),
                    :exp_month => integer(),
                    :cvc => String.t(),
                    :address_zip => String.t(),
                    :address_state => String.t(),
                    :address_line2 => String.t(),
                    :address_line1 => String.t(),
                    :address_country => String.t(),
                    :address_city => String.t()
                  },
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  },
              :balance => integer(),
              :address =>
                String.t()
                | %{
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  }
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Customer.t() | map()}
          | {:error, any()}
  def post_customers_customer(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a Customer object.</p>

  """
  @type get_customers_customer_opts :: {:expand, String.t()}
  @spec get_customers_customer(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedCustomer.t()
           | ExOAPI.Stripe.Schemas.Customer.t()
           | map()}
          | {:error, any()}
  def get_customers_customer(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve funding instructions for a customer cash balance. If funding instructions do not yet exist for the customer, new
  funding instructions will be created. If funding instructions have already been created for a given customer, the same
  funding instructions will be retrieved. In other words, we will return the same funding instructions each time.</p>

  """

  @spec post_customers_customer_funding_instructions(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :funding_type => String.t() | :bank_transfer,
              :expand => [String.t()],
              :currency => String.t(),
              :bank_transfer => %{
                :type => String.t() | :jp_bank_transfer,
                :requested_address_types => [String.t() | :zengin]
              }
            }
            | map(),
          customer :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.FundingInstructions.t() | map()}
          | {:error, any()}
  def post_customers_customer_funding_instructions(%ExOAPI.Client{} = client, body, customer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/funding_instructions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve all applicable funding instructions for a customer cash balance.</p>

  """
  @type get_customers_customer_funding_instructions_opts :: {:expand, String.t()}
  @spec get_customers_customer_funding_instructions(
          client :: ExOAPI.Client.t(),
          customer :: String.t(),
          list(get_customers_customer_funding_instructions_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.FundingInstructions.t()]
             }
           | map()}
          | {:error, any()}
  def get_customers_customer_funding_instructions(%ExOAPI.Client{} = client, customer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/customers/{customer}/funding_instructions")
    |> ExOAPI.Client.replace_in_path("customer", customer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end