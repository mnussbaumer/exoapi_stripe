defmodule ExOAPI.Stripe.SDK.Payouts do
  @doc """
  **description**: <p>To send funds to your own bank account, you create a new payout object. Your <a href="#balance">Stripe balance</a> must be able to cover the payout amount, or you’ll receive an “Insufficient Funds” error.</p>

  <p>If your API key is in test mode, money won’t actually be sent, though everything else will occur as if in live mode.</p>

  <p>If you are creating a manual payout on a Stripe account that uses multiple payment source types, you’ll need to specify the source type balance that the payout should draw from. The <a href="#balance_object">balance object</a> details available and pending amounts by source type.</p>

  """

  @spec post_payouts(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :statement_descriptor => String.t(),
              :source_type => String.t() | :bank_account | :card | :fpx,
              :method => String.t() | :instant | :standard,
              :metadata => map(),
              :expand => [String.t()],
              :destination => String.t(),
              :description => String.t(),
              :currency => String.t(),
              :amount => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_payouts(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payouts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of existing payouts sent to third-party bank accounts or that Stripe has sent you. The payouts are returned in sorted order, with the most recently created payouts appearing first.</p>

  """
  @type get_payouts_opts ::
          {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:destination, String.t()}
          | {:created, String.t()}
          | {:arrival_date, String.t()}
  @spec get_payouts(client :: ExOAPI.Client.t(), list(get_payouts_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_payouts(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payouts")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:destination, "destination", "form", true},
      {:created, "created", "deepObject", true},
      {:arrival_date, "arrival_date", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified payout by setting the values of the parameters passed. Any parameters not provided will be left unchanged. This request accepts only the metadata as arguments.</p>

  """

  @spec post_payouts_payout(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          payout :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payouts_payout(%ExOAPI.Client{} = client, body, payout) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payouts/{payout}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payout", payout)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing payout. Supply the unique payout ID from either a payout creation request or the payout list, and Stripe will return the corresponding payout information.</p>

  """
  @type get_payouts_payout_opts :: {:expand, String.t()}
  @spec get_payouts_payout(
          client :: ExOAPI.Client.t(),
          payout :: String.t(),
          list(get_payouts_payout_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payouts_payout(%ExOAPI.Client{} = client, payout, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payouts/{payout}")
    |> ExOAPI.Client.replace_in_path("payout", payout)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A previously created payout can be canceled if it has not yet been paid out. Funds will be refunded to your available balance. You may not cancel automatic Stripe payouts.</p>

  """

  @spec post_payouts_payout_cancel(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          payout :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payouts_payout_cancel(%ExOAPI.Client{} = client, body, payout) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payouts/{payout}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payout", payout)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Reverses a payout by debiting the destination bank account. Only payouts for connected accounts to US bank accounts may be reversed at this time. If the payout is in the <code>pending</code> status, <code>/v1/payouts/:id/cancel</code> should be used instead.</p>

  <p>By requesting a reversal via <code>/v1/payouts/:id/reverse</code>, you confirm that the authorized signatory of the selected bank account has authorized the debit on the bank account and that no other authorization is required.</p>

  """

  @spec post_payouts_payout_reverse(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => map(), :expand => [String.t()]} | map(),
          payout :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payouts_payout_reverse(%ExOAPI.Client{} = client, body, payout) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payouts/{payout}/reverse")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payout", payout)
    |> ExOAPI.Client.request()
  end
end