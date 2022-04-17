defmodule ExOAPI.Stripe.SDK.Coupons do
  @doc """
  **description**: <p>You can create coupons easily via the <a href="https://dashboard.stripe.com/coupons">coupon management</a> page of the Stripe dashboard. Coupon creation is also accessible via the API if you need to create coupons on the fly.</p>

  <p>A coupon has either a <code>percent_off</code> or an <code>amount_off</code> and <code>currency</code>. If you set an <code>amount_off</code>, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of <currency>100</currency> will have a final total of <currency>0</currency> if a coupon with an <code>amount_off</code> of <amount>200</amount> is applied to it and an invoice with a subtotal of <currency>300</currency> will have a final total of <currency>100</currency> if a coupon with an <code>amount_off</code> of <amount>200</amount> is applied to it.</p>

  """

  @spec post_coupons(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :redeem_by => integer(),
              :percent_off => number(),
              :name => String.t(),
              :metadata => String.t() | map(),
              :max_redemptions => integer(),
              :id => String.t(),
              :expand => [String.t()],
              :duration_in_months => integer(),
              :duration => String.t() | :forever | :once | :repeating,
              :currency => String.t(),
              :applies_to => %{:products => [String.t()]},
              :amount_off => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_coupons(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/coupons")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your coupons.</p>

  """
  @type get_coupons_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_coupons(client :: ExOAPI.Client.t(), list(get_coupons_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_coupons(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/coupons")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can delete coupons via the <a href="https://dashboard.stripe.com/coupons">coupon management</a> page of the Stripe dashboard. However, deleting a coupon does not affect any customers who have already applied the coupon; it means that new customers can’t redeem the coupon. You can also delete coupons via the API.</p>

  """

  @spec delete_coupons_coupon(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          coupon :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_coupons_coupon(%ExOAPI.Client{} = client, body, coupon) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/coupons/{coupon}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("coupon", coupon)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are, by design, not editable.</p>

  """

  @spec post_coupons_coupon(
          client :: ExOAPI.Client.t(),
          body ::
            %{:name => String.t(), :metadata => String.t() | map(), :expand => [String.t()]}
            | map(),
          coupon :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_coupons_coupon(%ExOAPI.Client{} = client, body, coupon) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/coupons/{coupon}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("coupon", coupon)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the coupon with the given ID.</p>

  """
  @type get_coupons_coupon_opts :: {:expand, String.t()}
  @spec get_coupons_coupon(
          client :: ExOAPI.Client.t(),
          coupon :: String.t(),
          list(get_coupons_coupon_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_coupons_coupon(%ExOAPI.Client{} = client, coupon, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/coupons/{coupon}")
    |> ExOAPI.Client.replace_in_path("coupon", coupon)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end