defmodule ExOAPI.Stripe.SDK.SubscriptionSchedules do
  @doc """
  **description**: <p>Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is <code>not_started</code> or <code>active</code>.</p>

  """

  @spec post_subscription_schedules_schedule_cancel(
          client :: ExOAPI.Client.t(),
          body ::
            %{:prorate => boolean(), :invoice_now => boolean(), :expand => [String.t()]} | map(),
          schedule :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.SubscriptionSchedule.t()
           | map()}
          | {:error, any()}
  def post_subscription_schedules_schedule_cancel(%ExOAPI.Client{} = client, body, schedule) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_schedules/{schedule}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("schedule", schedule)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing subscription schedule.</p>

  """

  @spec post_subscription_schedules_schedule(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :proration_behavior => String.t() | :always_invoice | :create_prorations | :none,
              :phases => [
                %{
                  :trial_end => String.t() | :now | integer(),
                  :trial => boolean(),
                  :transfer_data => %{:destination => String.t(), :amount_percent => number()},
                  :start_date => String.t() | :now | integer(),
                  :proration_behavior =>
                    String.t() | :always_invoice | :create_prorations | :none,
                  :iterations => integer(),
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
                      :billing_thresholds => String.t() | %{:usage_gte => integer()}
                    }
                  ],
                  :invoice_settings => %{:days_until_due => integer()},
                  :end_date => String.t() | :now | integer(),
                  :default_tax_rates => String.t() | [String.t()],
                  :default_payment_method => String.t(),
                  :coupon => String.t(),
                  :collection_method => String.t() | :charge_automatically | :send_invoice,
                  :billing_thresholds =>
                    String.t()
                    | %{:reset_billing_cycle_anchor => boolean(), :amount_gte => integer()},
                  :billing_cycle_anchor => String.t() | :automatic | :phase_start,
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
              ],
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :end_behavior => String.t() | :cancel | :none | :release | :renew,
              :default_settings => %{
                :transfer_data =>
                  String.t() | %{:destination => String.t(), :amount_percent => number()},
                :invoice_settings => %{:days_until_due => integer()},
                :default_payment_method => String.t(),
                :collection_method => String.t() | :charge_automatically | :send_invoice,
                :billing_thresholds =>
                  String.t()
                  | %{:reset_billing_cycle_anchor => boolean(), :amount_gte => integer()},
                :billing_cycle_anchor => String.t() | :automatic | :phase_start,
                :automatic_tax => %{:enabled => boolean()},
                :application_fee_percent => number()
              }
            }
            | map(),
          schedule :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.SubscriptionSchedule.t()
           | map()}
          | {:error, any()}
  def post_subscription_schedules_schedule(%ExOAPI.Client{} = client, body, schedule) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_schedules/{schedule}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("schedule", schedule)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing subscription schedule. You only need to supply the unique subscription schedule identifier that was returned upon subscription schedule creation.</p>

  """
  @type get_subscription_schedules_schedule_opts :: {:expand, String.t()}
  @spec get_subscription_schedules_schedule(
          client :: ExOAPI.Client.t(),
          schedule :: String.t(),
          list(get_subscription_schedules_schedule_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.SubscriptionSchedule.t()
           | map()}
          | {:error, any()}
  def get_subscription_schedules_schedule(%ExOAPI.Client{} = client, schedule, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_schedules/{schedule}")
    |> ExOAPI.Client.replace_in_path("schedule", schedule)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Releases the subscription schedule immediately, which will stop scheduling of its phases, but leave any existing subscription in place. A schedule can only be released if its status is <code>not_started</code> or <code>active</code>. If the subscription schedule is currently associated with a subscription, releasing it will remove its <code>subscription</code> property and set the subscription’s ID to the <code>released_subscription</code> property.</p>

  """

  @spec post_subscription_schedules_schedule_release(
          client :: ExOAPI.Client.t(),
          body :: %{:preserve_cancel_date => boolean(), :expand => [String.t()]} | map(),
          schedule :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.SubscriptionSchedule.t()
           | map()}
          | {:error, any()}
  def post_subscription_schedules_schedule_release(%ExOAPI.Client{} = client, body, schedule) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_schedules/{schedule}/release")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("schedule", schedule)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new subscription schedule object. Each customer can have up to 500 active or scheduled subscriptions.</p>

  """

  @spec post_subscription_schedules(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :start_date => String.t() | :now | integer(),
              :phases => [
                %{
                  :trial_end => integer(),
                  :trial => boolean(),
                  :transfer_data => %{:destination => String.t(), :amount_percent => number()},
                  :proration_behavior =>
                    String.t() | :always_invoice | :create_prorations | :none,
                  :iterations => integer(),
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
                      :billing_thresholds => String.t() | %{:usage_gte => integer()}
                    }
                  ],
                  :invoice_settings => %{:days_until_due => integer()},
                  :end_date => integer(),
                  :default_tax_rates => String.t() | [String.t()],
                  :default_payment_method => String.t(),
                  :coupon => String.t(),
                  :collection_method => String.t() | :charge_automatically | :send_invoice,
                  :billing_thresholds =>
                    String.t()
                    | %{:reset_billing_cycle_anchor => boolean(), :amount_gte => integer()},
                  :billing_cycle_anchor => String.t() | :automatic | :phase_start,
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
              ],
              :metadata => String.t() | map(),
              :from_subscription => String.t(),
              :expand => [String.t()],
              :end_behavior => String.t() | :cancel | :none | :release | :renew,
              :default_settings => %{
                :transfer_data =>
                  String.t() | %{:destination => String.t(), :amount_percent => number()},
                :invoice_settings => %{:days_until_due => integer()},
                :default_payment_method => String.t(),
                :collection_method => String.t() | :charge_automatically | :send_invoice,
                :billing_thresholds =>
                  String.t()
                  | %{:reset_billing_cycle_anchor => boolean(), :amount_gte => integer()},
                :billing_cycle_anchor => String.t() | :automatic | :phase_start,
                :automatic_tax => %{:enabled => boolean()},
                :application_fee_percent => number()
              },
              :customer => String.t()
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.SubscriptionSchedule.t()
           | map()}
          | {:error, any()}
  def post_subscription_schedules(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_schedules")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the list of your subscription schedules.</p>

  """
  @type get_subscription_schedules_opts ::
          {:starting_after, String.t()}
          | {:scheduled, String.t()}
          | {:released_at, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
          | {:completed_at, String.t()}
          | {:canceled_at, String.t()}
  @spec get_subscription_schedules(
          client :: ExOAPI.Client.t(),
          list(get_subscription_schedules_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.SubscriptionSchedule.t()]
             }
           | map()}
          | {:error, any()}
  def get_subscription_schedules(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_schedules")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:scheduled, "scheduled", "form", true},
      {:released_at, "released_at", "deepObject", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true},
      {:completed_at, "completed_at", "deepObject", true},
      {:canceled_at, "canceled_at", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end