defmodule ExOAPI.Stripe.SDK.Subscriptions do
  @doc """
  **description**: <p>Removes the currently applied discount on a subscription.</p>

  """

  @spec delete_subscriptions_subscription_exposed_id_discount(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          subscription_exposed_id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_subscriptions_subscription_exposed_id_discount(
        %ExOAPI.Client{} = client,
        body,
        subscription_exposed_id
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions/{subscription_exposed_id}/discount")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for subscriptions you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_subscriptions_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_subscriptions_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_subscriptions_search_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_subscriptions_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new subscription on an existing customer. Each customer can have up to 500 active or scheduled subscriptions.</p>

  <p>When you create a subscription with <code>collection_method=charge_automatically</code>, the first invoice is finalized as part of the request.
  The <code>payment_behavior</code> parameter determines the exact behavior of the initial payment.</p>

  <p>To start subscriptions where the first invoice always begins in a <code>draft</code> status, use <a href="/docs/billing/subscriptions/subscription-schedules#managing">subscription schedules</a> instead.
  Schedules provide the flexibility to model more complex billing configurations that change over time.</p>

  """

  @spec post_subscriptions(
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
              :customer => String.t(),
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
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_subscriptions(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>By default, returns a list of subscriptions that have not been canceled. In order to list canceled subscriptions, specify <code>status=canceled</code>.</p>

  """
  @type get_subscriptions_opts ::
          {:test_clock, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:price, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:current_period_start, String.t()}
          | {:current_period_end, String.t()}
          | {:created, String.t()}
          | {:collection_method, String.t()}
  @spec get_subscriptions(client :: ExOAPI.Client.t(), list(get_subscriptions_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_subscriptions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:test_clock, "test_clock", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:price, "price", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:current_period_start, "current_period_start", "deepObject", true},
      {:current_period_end, "current_period_end", "deepObject", true},
      {:created, "created", "deepObject", true},
      {:collection_method, "collection_method", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Cancels a customer’s subscription immediately. The customer will not be charged again for the subscription.</p>

  <p>Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.</p>

  <p>By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.</p>

  """

  @spec delete_subscriptions_subscription_exposed_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{:prorate => boolean(), :invoice_now => boolean(), :expand => [String.t()]} | map(),
          subscription_exposed_id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_subscriptions_subscription_exposed_id(
        %ExOAPI.Client{} = client,
        body,
        subscription_exposed_id
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions/{subscription_exposed_id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>

  """

  @spec post_subscriptions_subscription_exposed_id(
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
          subscription_exposed_id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_subscriptions_subscription_exposed_id(
        %ExOAPI.Client{} = client,
        body,
        subscription_exposed_id
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions/{subscription_exposed_id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the subscription with the given ID.</p>

  """
  @type get_subscriptions_subscription_exposed_id_opts :: {:expand, String.t()}
  @spec get_subscriptions_subscription_exposed_id(
          client :: ExOAPI.Client.t(),
          subscription_exposed_id :: String.t(),
          list(get_subscriptions_subscription_exposed_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_subscriptions_subscription_exposed_id(
        %ExOAPI.Client{} = client,
        subscription_exposed_id,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscriptions/{subscription_exposed_id}")
    |> ExOAPI.Client.replace_in_path("subscription_exposed_id", subscription_exposed_id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end