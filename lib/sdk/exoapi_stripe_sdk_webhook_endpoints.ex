defmodule ExOAPI.Stripe.SDK.WebhookEndpoints do
  @doc """
  **description**: <p>You can also delete webhook endpoints via the <a href="https://dashboard.stripe.com/account/webhooks">webhook endpoint management</a> page of the Stripe dashboard.</p>

  """

  @spec delete_webhook_endpoints_webhook_endpoint(
          client :: ExOAPI.Client.t(),
          body :: map(),
          webhook_endpoint :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_webhook_endpoints_webhook_endpoint(%ExOAPI.Client{} = client, body, webhook_endpoint) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints/{webhook_endpoint}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("webhook_endpoint", webhook_endpoint)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the webhook endpoint. You may edit the <code>url</code>, the list of <code>enabled_events</code>, and the status of your endpoint.</p>

  """

  @spec post_webhook_endpoints_webhook_endpoint(
          client :: ExOAPI.Client.t(),
          body :: map(),
          webhook_endpoint :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_webhook_endpoints_webhook_endpoint(%ExOAPI.Client{} = client, body, webhook_endpoint) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints/{webhook_endpoint}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("webhook_endpoint", webhook_endpoint)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the webhook endpoint with the given ID.</p>

  """
  @type get_webhook_endpoints_webhook_endpoint_opts :: {:expand, String.t()}
  @spec get_webhook_endpoints_webhook_endpoint(
          client :: ExOAPI.Client.t(),
          webhook_endpoint :: String.t(),
          list(get_webhook_endpoints_webhook_endpoint_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_webhook_endpoints_webhook_endpoint(
        %ExOAPI.Client{} = client,
        webhook_endpoint,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints/{webhook_endpoint}")
    |> ExOAPI.Client.replace_in_path("webhook_endpoint", webhook_endpoint)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A webhook endpoint must have a <code>url</code> and a list of <code>enabled_events</code>. You may optionally specify the Boolean <code>connect</code> parameter. If set to true, then a Connect webhook endpoint that notifies the specified <code>url</code> about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified <code>url</code> only about events from your account is created. You can also create webhook endpoints in the <a href="https://dashboard.stripe.com/account/webhooks">webhooks settings</a> section of the Dashboard.</p>

  """

  @spec post_webhook_endpoints(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_webhook_endpoints(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your webhook endpoints.</p>

  """
  @type get_webhook_endpoints_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_webhook_endpoints(client :: ExOAPI.Client.t(), list(get_webhook_endpoints_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_webhook_endpoints(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/webhook_endpoints")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end