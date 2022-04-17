defmodule ExOAPI.Stripe.SDK.Plans do
  @doc """
  **description**: <p>Deleting plans means new subscribers can’t be added. Existing subscribers aren’t affected.</p>

  """

  @spec delete_plans_plan(client :: ExOAPI.Client.t(), body :: %{} | map(), plan :: String.t()) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedPlan.t() | map()}
          | {:error, any()}
  def delete_plans_plan(%ExOAPI.Client{} = client, body, plan) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/plans/{plan}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("plan", plan)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified plan by setting the values of the parameters passed. Any parameters not provided are left unchanged. By design, you cannot change a plan’s ID, amount, currency, or billing cycle.</p>

  """

  @spec post_plans_plan(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :trial_period_days => integer(),
              :product => String.t(),
              :nickname => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :active => boolean()
            }
            | map(),
          plan :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Plan.t() | map()}
          | {:error, any()}
  def post_plans_plan(%ExOAPI.Client{} = client, body, plan) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/plans/{plan}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("plan", plan)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the plan with the given ID.</p>

  """
  @type get_plans_plan_opts :: {:expand, String.t()}
  @spec get_plans_plan(
          client :: ExOAPI.Client.t(),
          plan :: String.t(),
          list(get_plans_plan_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Plan.t() | map()}
          | {:error, any()}
  def get_plans_plan(%ExOAPI.Client{} = client, plan, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/plans/{plan}")
    |> ExOAPI.Client.replace_in_path("plan", plan)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can now model subscriptions more flexibly using the <a href="#prices">Prices API</a>. It replaces the Plans API and is backwards compatible to simplify your migration.</p>

  """

  @spec post_plans(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :usage_type => String.t() | :licensed | :metered,
              :trial_period_days => integer(),
              :transform_usage => %{:round => String.t() | :down | :up, :divide_by => integer()},
              :tiers_mode => String.t() | :graduated | :volume,
              :tiers => [
                %{
                  :up_to => integer() | String.t() | :inf,
                  :unit_amount_decimal => String.t(),
                  :unit_amount => integer(),
                  :flat_amount_decimal => String.t(),
                  :flat_amount => integer()
                }
              ],
              :product =>
                String.t()
                | %{
                    :unit_label => String.t(),
                    :tax_code => String.t(),
                    :statement_descriptor => String.t(),
                    :name => String.t(),
                    :metadata => map(),
                    :id => String.t(),
                    :active => boolean()
                  },
              :nickname => String.t(),
              :metadata => String.t() | map(),
              :interval_count => integer(),
              :interval => String.t() | :day | :month | :week | :year,
              :id => String.t(),
              :expand => [String.t()],
              :currency => String.t(),
              :billing_scheme => String.t() | :per_unit | :tiered,
              :amount_decimal => String.t(),
              :amount => integer(),
              :aggregate_usage => String.t() | :last_during_period | :last_ever | :max | :sum,
              :active => boolean()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Plan.t() | map()}
          | {:error, any()}
  def post_plans(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/plans")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your plans.</p>

  """
  @type get_plans_opts ::
          {:starting_after, String.t()}
          | {:product, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:active, String.t()}
  @spec get_plans(client :: ExOAPI.Client.t(), list(get_plans_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Plan.t()]
             }
           | map()}
          | {:error, any()}
  def get_plans(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/plans")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:product, "product", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end