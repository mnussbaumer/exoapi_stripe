defmodule ExOAPI.Stripe.SDK.OrderReturns do
  @doc """
  **description**: <p>Retrieves the details of an existing order return. Supply the unique order ID from either an order return creation request or the order return list, and Stripe will return the corresponding order information.</p>

  """
  @type get_order_returns_id_opts :: {:expand, String.t()}
  @spec get_order_returns_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_order_returns_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_order_returns_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/order_returns/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your order returns. The returns are returned sorted by creation date, with the most recently created return appearing first.</p>

  """
  @type get_order_returns_opts ::
          {:starting_after, String.t()}
          | {:order, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_order_returns(client :: ExOAPI.Client.t(), list(get_order_returns_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_order_returns(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/order_returns")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:order, "order", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end