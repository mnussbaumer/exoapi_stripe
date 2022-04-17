defmodule ExOAPI.Stripe.SDK.Terminal do
  @doc """
  **description**: <p>Initiates a payment flow on a Reader.</p>

  """

  @spec post_terminal_readers_reader_process_payment_intent(
          client :: ExOAPI.Client.t(),
          body :: map(),
          reader :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_readers_reader_process_payment_intent(%ExOAPI.Client{} = client, body, reader) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}/process_payment_intent")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes a <code>Reader</code> object.</p>

  """

  @spec delete_terminal_readers_reader(
          client :: ExOAPI.Client.t(),
          body :: map(),
          reader :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_terminal_readers_reader(%ExOAPI.Client{} = client, body, reader) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a <code>Reader</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_terminal_readers_reader(
          client :: ExOAPI.Client.t(),
          body :: map(),
          reader :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_readers_reader(%ExOAPI.Client{} = client, body, reader) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a <code>Reader</code> object.</p>

  """
  @type get_terminal_readers_reader_opts :: {:expand, String.t()}
  @spec get_terminal_readers_reader(
          client :: ExOAPI.Client.t(),
          reader :: String.t(),
          list(get_terminal_readers_reader_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_terminal_readers_reader(%ExOAPI.Client{} = client, reader, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}")
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Initiates a setup intent flow on a Reader.</p>

  """

  @spec post_terminal_readers_reader_process_setup_intent(
          client :: ExOAPI.Client.t(),
          body :: map(),
          reader :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_readers_reader_process_setup_intent(%ExOAPI.Client{} = client, body, reader) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}/process_setup_intent")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>Reader</code> object.</p>

  """

  @spec post_terminal_readers(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_terminal_readers(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of <code>Reader</code> objects.</p>

  """
  @type get_terminal_readers_opts ::
          {:status, String.t()}
          | {:starting_after, String.t()}
          | {:location, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:device_type, String.t()}
  @spec get_terminal_readers(client :: ExOAPI.Client.t(), list(get_terminal_readers_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_terminal_readers(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:location, "location", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:device_type, "device_type", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Cancels the current reader action.</p>

  """

  @spec post_terminal_readers_reader_cancel_action(
          client :: ExOAPI.Client.t(),
          body :: map(),
          reader :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_readers_reader_cancel_action(%ExOAPI.Client{} = client, body, reader) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}/cancel_action")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>To connect to a reader the Stripe Terminal SDK needs to retrieve a short-lived connection token from Stripe, proxied through your server. On your backend, add an endpoint that creates and returns a connection token.</p>

  """

  @spec post_terminal_connection_tokens(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_terminal_connection_tokens(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/connection_tokens")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes a <code>Configuration</code> object.</p>

  """

  @spec delete_terminal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          body :: map(),
          configuration :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_terminal_configurations_configuration(%ExOAPI.Client{} = client, body, configuration) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/configurations/{configuration}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a new <code>Configuration</code> object.</p>

  """

  @spec post_terminal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          body :: map(),
          configuration :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_configurations_configuration(%ExOAPI.Client{} = client, body, configuration) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/configurations/{configuration}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a <code>Configuration</code> object.</p>

  """
  @type get_terminal_configurations_configuration_opts :: {:expand, String.t()}
  @spec get_terminal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          configuration :: String.t(),
          list(get_terminal_configurations_configuration_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_terminal_configurations_configuration(
        %ExOAPI.Client{} = client,
        configuration,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/configurations/{configuration}")
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes a <code>Location</code> object.</p>

  """

  @spec delete_terminal_locations_location(
          client :: ExOAPI.Client.t(),
          body :: map(),
          location :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_terminal_locations_location(%ExOAPI.Client{} = client, body, location) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/locations/{location}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("location", location)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a <code>Location</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_terminal_locations_location(
          client :: ExOAPI.Client.t(),
          body :: map(),
          location :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_locations_location(%ExOAPI.Client{} = client, body, location) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/locations/{location}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("location", location)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a <code>Location</code> object.</p>

  """
  @type get_terminal_locations_location_opts :: {:expand, String.t()}
  @spec get_terminal_locations_location(
          client :: ExOAPI.Client.t(),
          location :: String.t(),
          list(get_terminal_locations_location_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_terminal_locations_location(%ExOAPI.Client{} = client, location, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/locations/{location}")
    |> ExOAPI.Client.replace_in_path("location", location)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>Location</code> object.
  For further details, including which address fields are required in each country, see the <a href="/docs/terminal/fleet/locations">Manage locations</a> guide.</p>

  """

  @spec post_terminal_locations(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_terminal_locations(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/locations")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of <code>Location</code> objects.</p>

  """
  @type get_terminal_locations_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_terminal_locations(client :: ExOAPI.Client.t(), list(get_terminal_locations_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_terminal_locations(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/locations")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>Configuration</code> object.</p>

  """

  @spec post_terminal_configurations(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_terminal_configurations(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/configurations")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of <code>Configuration</code> objects.</p>

  """
  @type get_terminal_configurations_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:is_account_default, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_terminal_configurations(
          client :: ExOAPI.Client.t(),
          list(get_terminal_configurations_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_terminal_configurations(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/configurations")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:is_account_default, "is_account_default", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Sets reader display to show cart details.</p>

  """

  @spec post_terminal_readers_reader_set_reader_display(
          client :: ExOAPI.Client.t(),
          body :: map(),
          reader :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_terminal_readers_reader_set_reader_display(%ExOAPI.Client{} = client, body, reader) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/terminal/readers/{reader}/set_reader_display")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end
end