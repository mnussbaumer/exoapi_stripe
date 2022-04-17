defmodule ExOAPI.Stripe.SDK.SetupIntents do
  @doc """
  **description**: <p>Updates a SetupIntent object.</p>

  """

  @spec post_setup_intents_intent(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_setup_intents_intent(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents/{intent}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of a SetupIntent that has previously been created. </p>

  <p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string. </p>

  <p>When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#setup_intent_object">SetupIntent</a> object reference for more details.</p>

  """
  @type get_setup_intents_intent_opts :: {:expand, String.t()} | {:client_secret, String.t()}
  @spec get_setup_intents_intent(
          client :: ExOAPI.Client.t(),
          intent :: String.t(),
          list(get_setup_intents_intent_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_setup_intents_intent(%ExOAPI.Client{} = client, intent, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents/{intent}")
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true},
      {:client_secret, "client_secret", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Confirm that your customer intends to set up the current or
  provided payment method. For example, you would confirm a SetupIntent
  when a customer hits the “Save” button on a payment method management
  page on your website.</p>

  <p>If the selected payment method does not require any additional
  steps from the customer, the SetupIntent will transition to the
  <code>succeeded</code> status.</p>

  <p>Otherwise, it will transition to the <code>requires_action</code> status and
  suggest additional actions via <code>next_action</code>. If setup fails,
  the SetupIntent will transition to the
  <code>requires_payment_method</code> status.</p>

  """

  @spec post_setup_intents_intent_confirm(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_setup_intents_intent_confirm(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents/{intent}/confirm")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Verifies microdeposits on a SetupIntent object.</p>

  """

  @spec post_setup_intents_intent_verify_microdeposits(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_setup_intents_intent_verify_microdeposits(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents/{intent}/verify_microdeposits")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A SetupIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_confirmation</code>, or <code>requires_action</code>. </p>

  <p>Once canceled, setup is abandoned and any operations on the SetupIntent will fail with an error.</p>

  """

  @spec post_setup_intents_intent_cancel(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_setup_intents_intent_cancel(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents/{intent}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a SetupIntent object.</p>

  <p>After the SetupIntent is created, attach a payment method and <a href="/docs/api/setup_intents/confirm">confirm</a>
  to collect any required permissions to charge the payment method later.</p>

  """

  @spec post_setup_intents(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_setup_intents(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of SetupIntents.</p>

  """
  @type get_setup_intents_opts ::
          {:starting_after, String.t()}
          | {:payment_method, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
  @spec get_setup_intents(client :: ExOAPI.Client.t(), list(get_setup_intents_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_setup_intents(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_intents")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:payment_method, "payment_method", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end