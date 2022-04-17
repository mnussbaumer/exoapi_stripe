defmodule ExOAPI.Stripe.SDK.PromotionCodes do
  @doc """
  **description**: <p>Updates the specified promotion code by setting the values of the parameters passed. Most fields are, by design, not editable.</p>

  """

  @spec post_promotion_codes_promotion_code(
          client :: ExOAPI.Client.t(),
          body ::
            %{:metadata => String.t() | map(), :expand => [String.t()], :active => boolean()}
            | map(),
          promotion_code :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_promotion_codes_promotion_code(%ExOAPI.Client{} = client, body, promotion_code) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/promotion_codes/{promotion_code}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("promotion_code", promotion_code)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the promotion code with the given ID. In order to retrieve a promotion code by the customer-facing <code>code</code> use <a href="/docs/api/promotion_codes/list">list</a> with the desired <code>code</code>.</p>

  """
  @type get_promotion_codes_promotion_code_opts :: {:expand, String.t()}
  @spec get_promotion_codes_promotion_code(
          client :: ExOAPI.Client.t(),
          promotion_code :: String.t(),
          list(get_promotion_codes_promotion_code_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_promotion_codes_promotion_code(%ExOAPI.Client{} = client, promotion_code, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/promotion_codes/{promotion_code}")
    |> ExOAPI.Client.replace_in_path("promotion_code", promotion_code)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A promotion code points to a coupon. You can optionally restrict the code to a specific customer, redemption limit, and expiration date.</p>

  """

  @spec post_promotion_codes(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :restrictions => %{
                :minimum_amount_currency => String.t(),
                :minimum_amount => integer(),
                :first_time_transaction => boolean()
              },
              :metadata => map(),
              :max_redemptions => integer(),
              :expires_at => integer(),
              :expand => [String.t()],
              :customer => String.t(),
              :coupon => String.t(),
              :code => String.t(),
              :active => boolean()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_promotion_codes(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/promotion_codes")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your promotion codes.</p>

  """
  @type get_promotion_codes_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
          | {:coupon, String.t()}
          | {:code, String.t()}
          | {:active, String.t()}
  @spec get_promotion_codes(client :: ExOAPI.Client.t(), list(get_promotion_codes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_promotion_codes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/promotion_codes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true},
      {:coupon, "coupon", "form", true},
      {:code, "code", "form", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end