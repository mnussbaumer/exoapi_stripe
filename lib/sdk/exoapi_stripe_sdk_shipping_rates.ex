defmodule ExOAPI.Stripe.SDK.ShippingRates do
  @doc """
  **description**: <p>Creates a new shipping rate object.</p>

  """

  @spec post_shipping_rates(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :type => String.t() | :fixed_amount,
              :tax_code => String.t(),
              :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
              :metadata => map(),
              :fixed_amount => %{:currency => String.t(), :amount => integer()},
              :expand => [String.t()],
              :display_name => String.t(),
              :delivery_estimate => %{
                :minimum => %{
                  :value => integer(),
                  :unit => String.t() | :business_day | :day | :hour | :month | :week
                },
                :maximum => %{
                  :value => integer(),
                  :unit => String.t() | :business_day | :day | :hour | :month | :week
                }
              }
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ShippingRate.t() | map()}
          | {:error, any()}
  def post_shipping_rates(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/shipping_rates")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your shipping rates.</p>

  """
  @type get_shipping_rates_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:currency, String.t()}
          | {:created, String.t()}
          | {:active, String.t()}
  @spec get_shipping_rates(client :: ExOAPI.Client.t(), list(get_shipping_rates_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.ShippingRate.t()]
             }
           | map()}
          | {:error, any()}
  def get_shipping_rates(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/shipping_rates")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:currency, "currency", "form", true},
      {:created, "created", "deepObject", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing shipping rate object.</p>

  """

  @spec post_shipping_rates_shipping_rate_token(
          client :: ExOAPI.Client.t(),
          body ::
            %{:metadata => String.t() | map(), :expand => [String.t()], :active => boolean()}
            | map(),
          shipping_rate_token :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ShippingRate.t() | map()}
          | {:error, any()}
  def post_shipping_rates_shipping_rate_token(
        %ExOAPI.Client{} = client,
        body,
        shipping_rate_token
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/shipping_rates/{shipping_rate_token}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("shipping_rate_token", shipping_rate_token)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns the shipping rate object with the given ID.</p>

  """
  @type get_shipping_rates_shipping_rate_token_opts :: {:expand, String.t()}
  @spec get_shipping_rates_shipping_rate_token(
          client :: ExOAPI.Client.t(),
          shipping_rate_token :: String.t(),
          list(get_shipping_rates_shipping_rate_token_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ShippingRate.t() | map()}
          | {:error, any()}
  def get_shipping_rates_shipping_rate_token(
        %ExOAPI.Client{} = client,
        shipping_rate_token,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/shipping_rates/{shipping_rate_token}")
    |> ExOAPI.Client.replace_in_path("shipping_rate_token", shipping_rate_token)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end