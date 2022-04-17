defmodule ExOAPI.Stripe.SDK.PaymentLinks do
  @doc """
  **description**: <p>When retrieving a payment link, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_payment_links_payment_link_line_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_payment_links_payment_link_line_items(
          client :: ExOAPI.Client.t(),
          payment_link :: String.t(),
          list(get_payment_links_payment_link_line_items_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payment_links_payment_link_line_items(
        %ExOAPI.Client{} = client,
        payment_link,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links/{payment_link}/line_items")
    |> ExOAPI.Client.replace_in_path("payment_link", payment_link)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a payment link.</p>

  """

  @spec post_payment_links(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_payment_links(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your payment links.</p>

  """
  @type get_payment_links_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:active, String.t()}
  @spec get_payment_links(client :: ExOAPI.Client.t(), list(get_payment_links_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_payment_links(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a payment link.</p>

  """

  @spec post_payment_links_payment_link(
          client :: ExOAPI.Client.t(),
          body :: map(),
          payment_link :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_links_payment_link(%ExOAPI.Client{} = client, body, payment_link) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links/{payment_link}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_link", payment_link)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a payment link.</p>

  """
  @type get_payment_links_payment_link_opts :: {:expand, String.t()}
  @spec get_payment_links_payment_link(
          client :: ExOAPI.Client.t(),
          payment_link :: String.t(),
          list(get_payment_links_payment_link_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payment_links_payment_link(%ExOAPI.Client{} = client, payment_link, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links/{payment_link}")
    |> ExOAPI.Client.replace_in_path("payment_link", payment_link)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end