defmodule ExOAPI.Stripe.SDK.Balance do
  @doc """
  **description**: <p>Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.</p>

  <p>Note that this endpoint was previously called “Balance history” and used the path <code>/v1/balance/history</code>.</p>

  """
  @type get_balance_history_opts ::
          {:type, String.t()}
          | {:starting_after, String.t()}
          | {:source, String.t()}
          | {:payout, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:currency, String.t()}
          | {:created, String.t()}
  @spec get_balance_history(client :: ExOAPI.Client.t(), list(get_balance_history_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.BalanceTransaction.t()]
             }
           | map()}
          | {:error, any()}
  def get_balance_history(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/balance/history")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:source, "source", "form", true},
      {:payout, "payout", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:currency, "currency", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the current account balance, based on the authentication that was used to make the request.
   For a sample request, see <a href="/docs/connect/account-balances#accounting-for-negative-balances">Accounting for negative balances</a>.</p>

  """
  @type get_balance_opts :: {:expand, String.t()}
  @spec get_balance(client :: ExOAPI.Client.t(), list(get_balance_opts())) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Balance.t() | map()}
          | {:error, any()}
  def get_balance(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/balance")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the balance transaction with the given ID.</p>

  <p>Note that this endpoint previously used the path <code>/v1/balance/history/:id</code>.</p>

  """
  @type get_balance_history_id_opts :: {:expand, String.t()}
  @spec get_balance_history_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_balance_history_id_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.BalanceTransaction.t() | map()}
          | {:error, any()}
  def get_balance_history_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/balance/history/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end