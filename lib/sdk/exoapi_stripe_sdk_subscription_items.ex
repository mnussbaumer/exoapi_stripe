defmodule ExOAPI.Stripe.SDK.SubscriptionItems do
  @doc """
  **description**: <p>Deletes an item from the subscription. Removing a subscription item from a subscription will not cancel the subscription.</p>

  """

  @spec delete_subscription_items_item(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :proration_date => integer(),
              :proration_behavior => String.t() | :always_invoice | :create_prorations | :none,
              :clear_usage => boolean()
            }
            | map(),
          item :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedSubscriptionItem.t()
           | map()}
          | {:error, any()}
  def delete_subscription_items_item(%ExOAPI.Client{} = client, body, item) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items/{item}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("item", item)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the plan or quantity of an item on a current subscription.</p>

  """

  @spec post_subscription_items_item(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :tax_rates => String.t() | [String.t()],
              :quantity => integer(),
              :proration_date => integer(),
              :proration_behavior => String.t() | :always_invoice | :create_prorations | :none,
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
              :payment_behavior =>
                String.t()
                | :allow_incomplete
                | :default_incomplete
                | :error_if_incomplete
                | :pending_if_incomplete,
              :off_session => boolean(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :billing_thresholds => String.t() | %{:usage_gte => integer()}
            }
            | map(),
          item :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.SubscriptionItem.t() | map()}
          | {:error, any()}
  def post_subscription_items_item(%ExOAPI.Client{} = client, body, item) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items/{item}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("item", item)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the subscription item with the given ID.</p>

  """
  @type get_subscription_items_item_opts :: {:expand, String.t()}
  @spec get_subscription_items_item(
          client :: ExOAPI.Client.t(),
          item :: String.t(),
          list(get_subscription_items_item_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.SubscriptionItem.t() | map()}
          | {:error, any()}
  def get_subscription_items_item(%ExOAPI.Client{} = client, item, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items/{item}")
    |> ExOAPI.Client.replace_in_path("item", item)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a usage record for a specified subscription item and date, and fills it with a quantity.</p>

  <p>Usage records provide <code>quantity</code> information that Stripe uses to track how much a customer is using your service. With usage information and the pricing model set up by the <a href="https://stripe.com/docs/billing/subscriptions/metered-billing">metered billing</a> plan, Stripe helps you send accurate invoices to your customers.</p>

  <p>The default calculation for usage is to add up all the <code>quantity</code> values of the usage records within a billing period. You can change this default behavior with the billing plan’s <code>aggregate_usage</code> <a href="/docs/api/plans/create#create_plan-aggregate_usage">parameter</a>. When there is more than one usage record with the same timestamp, Stripe adds the <code>quantity</code> values together. In most cases, this is the desired resolution, however, you can change this behavior with the <code>action</code> parameter.</p>

  <p>The default pricing model for metered billing is <a href="/docs/api/plans/object#plan_object-billing_scheme">per-unit pricing</a>. For finer granularity, you can configure metered billing to have a <a href="https://stripe.com/docs/billing/subscriptions/tiers">tiered pricing</a> model.</p>

  """

  @spec post_subscription_items_subscription_item_usage_records(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :timestamp => integer() | String.t() | :now,
              :quantity => integer(),
              :expand => [String.t()],
              :action => String.t() | :increment | :set
            }
            | map(),
          subscription_item :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.UsageRecord.t() | map()}
          | {:error, any()}
  def post_subscription_items_subscription_item_usage_records(
        %ExOAPI.Client{} = client,
        body,
        subscription_item
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items/{subscription_item}/usage_records")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("subscription_item", subscription_item)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Adds a new item to an existing subscription. No existing items will be changed or replaced.</p>

  """

  @spec post_subscription_items(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :tax_rates => String.t() | [String.t()],
              :subscription => String.t(),
              :quantity => integer(),
              :proration_date => integer(),
              :proration_behavior => String.t() | :always_invoice | :create_prorations | :none,
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
              :payment_behavior =>
                String.t()
                | :allow_incomplete
                | :default_incomplete
                | :error_if_incomplete
                | :pending_if_incomplete,
              :metadata => map(),
              :expand => [String.t()],
              :billing_thresholds => String.t() | %{:usage_gte => integer()}
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.SubscriptionItem.t() | map()}
          | {:error, any()}
  def post_subscription_items(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your subscription items for a given subscription.</p>

  """
  @type get_subscription_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_subscription_items(
          client :: ExOAPI.Client.t(),
          subscription :: String.t(),
          list(get_subscription_items_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.SubscriptionItem.t()]
             }
           | map()}
          | {:error, any()}
  def get_subscription_items(%ExOAPI.Client{} = client, subscription, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items")
    |> ExOAPI.Client.add_query("subscription", subscription)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>For the specified subscription item, returns a list of summary objects. Each object in the list provides usage information that’s been summarized from multiple usage records and over a subscription billing period (e.g., 15 usage records in the month of September).</p>

  <p>The list is sorted in reverse-chronological order (newest first). The first list item represents the most current usage period that hasn’t ended yet. Since new usage records can still be added, the returned summary information for the subscription item’s ID should be seen as unstable until the subscription billing period ends.</p>

  """
  @type get_subscription_items_subscription_item_usage_record_summaries_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_subscription_items_subscription_item_usage_record_summaries(
          client :: ExOAPI.Client.t(),
          subscription_item :: String.t(),
          list(get_subscription_items_subscription_item_usage_record_summaries_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.UsageRecordSummary.t()]
             }
           | map()}
          | {:error, any()}
  def get_subscription_items_subscription_item_usage_record_summaries(
        %ExOAPI.Client{} = client,
        subscription_item,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/subscription_items/{subscription_item}/usage_record_summaries")
    |> ExOAPI.Client.replace_in_path("subscription_item", subscription_item)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end