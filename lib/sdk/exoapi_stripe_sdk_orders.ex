defmodule ExOAPI.Stripe.SDK.Orders do
  @doc """
  **description**: <p>Return all or part of an order. The order must have a status of <code>paid</code> or <code>fulfilled</code> before it can be returned. Once all items have been returned, the order will become <code>canceled</code> or <code>returned</code> depending on which status the order started in.</p>

  """

  @spec post_orders_id_returns(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_orders_id_returns(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/orders/{id}/returns")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specific order by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_orders_id(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_orders_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/orders/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing order. Supply the unique order ID from either an order creation request or the order list, and Stripe will return the corresponding order information.</p>

  """
  @type get_orders_id_opts :: {:expand, String.t()}
  @spec get_orders_id(client :: ExOAPI.Client.t(), id :: String.t(), list(get_orders_id_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_orders_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/orders/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new order object.</p>

  """

  @spec post_orders(client :: ExOAPI.Client.t(), body :: map()) :: {:ok, any()} | {:error, any()}
  def post_orders(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/orders")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your orders. The orders are returned sorted by creation date, with the most recently created orders appearing first.</p>

  """
  @type get_orders_opts ::
          {:upstream_ids, String.t()}
          | {:status_transitions, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:ids, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
  @spec get_orders(client :: ExOAPI.Client.t(), list(get_orders_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_orders(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/orders")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:upstream_ids, "upstream_ids", "deepObject", true},
      {:status_transitions, "status_transitions", "deepObject", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:ids, "ids", "deepObject", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Pay an order by providing a <code>source</code> to create a payment.</p>

  """

  @spec post_orders_id_pay(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_orders_id_pay(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/orders/{id}/pay")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end
end