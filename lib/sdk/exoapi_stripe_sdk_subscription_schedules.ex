defmodule ExOAPI.Stripe.SDK.SubscriptionSchedules do
  @doc """
  **description**: <p>Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is <code>not_started</code> or <code>active</code>.</p>

  """

  @spec post_subscription_schedules_schedule_cancel(
          client :: ExOAPI.Client.t(),
          body :: map(),
          schedule :: String.t()
        ) :: {:ok, any()} | {:error, any()}
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
          body :: map(),
          schedule :: String.t()
        ) :: {:ok, any()} | {:error, any()}
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
        ) :: {:ok, any()} | {:error, any()}
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
          body :: map(),
          schedule :: String.t()
        ) :: {:ok, any()} | {:error, any()}
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

  @spec post_subscription_schedules(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
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
        ) :: {:ok, any()} | {:error, any()}
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