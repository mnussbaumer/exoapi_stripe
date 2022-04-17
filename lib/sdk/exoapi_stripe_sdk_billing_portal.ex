defmodule ExOAPI.Stripe.SDK.BillingPortal do
  @doc """
  **description**: <p>Updates a configuration that describes the functionality of the customer portal.</p>

  """

  @spec post_billing_portal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          body :: map(),
          configuration :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_billing_portal_configurations_configuration(
        %ExOAPI.Client{} = client,
        body,
        configuration
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations/{configuration}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a configuration that describes the functionality of the customer portal.</p>

  """
  @type get_billing_portal_configurations_configuration_opts :: {:expand, String.t()}
  @spec get_billing_portal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          configuration :: String.t(),
          list(get_billing_portal_configurations_configuration_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_billing_portal_configurations_configuration(
        %ExOAPI.Client{} = client,
        configuration,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations/{configuration}")
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a configuration that describes the functionality and behavior of a PortalSession</p>

  """

  @spec post_billing_portal_configurations(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_billing_portal_configurations(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of configurations that describe the functionality of the customer portal.</p>

  """
  @type get_billing_portal_configurations_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:is_default, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:active, String.t()}
  @spec get_billing_portal_configurations(
          client :: ExOAPI.Client.t(),
          list(get_billing_portal_configurations_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_billing_portal_configurations(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:is_default, "is_default", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a session of the customer portal.</p>

  """

  @spec post_billing_portal_sessions(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_billing_portal_sessions(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/sessions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end