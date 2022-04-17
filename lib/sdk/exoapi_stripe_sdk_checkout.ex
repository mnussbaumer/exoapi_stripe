defmodule ExOAPI.Stripe.SDK.Checkout do
  @doc """
  **description**: <p>A Session can be expired when it is in one of these statuses: <code>open</code> </p>

  <p>After it expires, a customer can’t complete a Session and customers loading the Session see a message saying the Session is expired.</p>

  """

  @spec post_checkout_sessions_session_expire(
          client :: ExOAPI.Client.t(),
          body :: map(),
          session :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_checkout_sessions_session_expire(%ExOAPI.Client{} = client, body, session) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions/{session}/expire")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving a Checkout Session, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_checkout_sessions_session_line_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_checkout_sessions_session_line_items(
          client :: ExOAPI.Client.t(),
          session :: String.t(),
          list(get_checkout_sessions_session_line_items_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_checkout_sessions_session_line_items(%ExOAPI.Client{} = client, session, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions/{session}/line_items")
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a Session object.</p>

  """

  @spec post_checkout_sessions(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_checkout_sessions(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Checkout Sessions.</p>

  """
  @type get_checkout_sessions_opts ::
          {:subscription, String.t()}
          | {:starting_after, String.t()}
          | {:payment_intent, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_checkout_sessions(client :: ExOAPI.Client.t(), list(get_checkout_sessions_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_checkout_sessions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:subscription, "subscription", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:payment_intent, "payment_intent", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a Session object.</p>

  """
  @type get_checkout_sessions_session_opts :: {:expand, String.t()}
  @spec get_checkout_sessions_session(
          client :: ExOAPI.Client.t(),
          session :: String.t(),
          list(get_checkout_sessions_session_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_checkout_sessions_session(%ExOAPI.Client{} = client, session, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions/{session}")
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end