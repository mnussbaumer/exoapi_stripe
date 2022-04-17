defmodule ExOAPI.Stripe.SDK.PaymentIntents do
  @doc """
  **description**: <p>Manually reconcile the remaining amount for a customer_balance PaymentIntent.</p>

  <p>This can be used when the cash balance for <a href="docs/payments/customer-balance/reconciliation#cash-manual-reconciliation">a customer in manual reconciliation mode</a> received funds.</p>

  """

  @spec post_payment_intents_intent_apply_customer_balance(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent_apply_customer_balance(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/apply_customer_balance")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for PaymentIntents you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_payment_intents_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_payment_intents_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_payment_intents_search_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payment_intents_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Verifies microdeposits on a PaymentIntent object.</p>

  """

  @spec post_payment_intents_intent_verify_microdeposits(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent_verify_microdeposits(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/verify_microdeposits")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A PaymentIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_capture</code>, <code>requires_confirmation</code>, <code>requires_action</code>, or <code>processing</code>. </p>

  <p>Once canceled, no additional charges will be made by the PaymentIntent and any operations on the PaymentIntent will fail with an error. For PaymentIntents with <code>status=’requires_capture’</code>, the remaining <code>amount_capturable</code> will automatically be refunded. </p>

  <p>You cannot cancel the PaymentIntent for a Checkout Session. <a href="/docs/api/checkout/sessions/expire">Expire the Checkout Session</a> instead</p>

  """

  @spec post_payment_intents_intent_cancel(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent_cancel(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a PaymentIntent object.</p>

  <p>After the PaymentIntent is created, attach a payment method and <a href="/docs/api/payment_intents/confirm">confirm</a>
  to continue the payment. You can read more about the different payment flows
  available via the Payment Intents API <a href="/docs/payments/payment-intents">here</a>.</p>

  <p>When <code>confirm=true</code> is used during creation, it is equivalent to creating
  and confirming the PaymentIntent in the same call. You may use any parameters
  available in the <a href="/docs/api/payment_intents/confirm">confirm API</a> when <code>confirm=true</code>
  is supplied.</p>

  """

  @spec post_payment_intents(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_payment_intents(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of PaymentIntents.</p>

  """
  @type get_payment_intents_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
  @spec get_payment_intents(client :: ExOAPI.Client.t(), list(get_payment_intents_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_payment_intents(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates properties on a PaymentIntent object without confirming.</p>

  <p>Depending on which properties you update, you may need to confirm the
  PaymentIntent again. For example, updating the <code>payment_method</code> will
  always require you to confirm the PaymentIntent again. If you prefer to
  update and confirm at the same time, we recommend updating properties via
  the <a href="/docs/api/payment_intents/confirm">confirm API</a> instead.</p>

  """

  @spec post_payment_intents_intent(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of a PaymentIntent that has previously been created. </p>

  <p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string. </p>

  <p>When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#payment_intent_object">payment intent</a> object reference for more details.</p>

  """
  @type get_payment_intents_intent_opts :: {:expand, String.t()} | {:client_secret, String.t()}
  @spec get_payment_intents_intent(
          client :: ExOAPI.Client.t(),
          intent :: String.t(),
          list(get_payment_intents_intent_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payment_intents_intent(%ExOAPI.Client{} = client, intent, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}")
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true},
      {:client_secret, "client_secret", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Perform an incremental authorization on an eligible
  <a href="/docs/api/payment_intents/object">PaymentIntent</a>. To be eligible, the
  PaymentIntent’s status must be <code>requires_capture</code> and
  <a href="/docs/api/charges/object#charge_object-payment_method_details-card_present-incremental_authorization_supported">incremental_authorization_supported</a>
  must be <code>true</code>.</p>

  <p>Incremental authorizations attempt to increase the authorized amount on
  your customer’s card to the new, higher <code>amount</code> provided. As with the
  initial authorization, incremental authorizations may be declined. A
  single PaymentIntent can call this endpoint multiple times to further
  increase the authorized amount.</p>

  <p>If the incremental authorization succeeds, the PaymentIntent object is
  returned with the updated
  <a href="/docs/api/payment_intents/object#payment_intent_object-amount">amount</a>.
  If the incremental authorization fails, a
  <a href="/docs/error-codes#card-declined">card_declined</a> error is returned, and no
  fields on the PaymentIntent or Charge are updated. The PaymentIntent
  object remains capturable for the previously authorized amount.</p>

  <p>Each PaymentIntent can have a maximum of 10 incremental authorization attempts, including declines.
  Once captured, a PaymentIntent can no longer be incremented.</p>

  <p>Learn more about <a href="/docs/terminal/features/incremental-authorizations">incremental authorizations</a>.</p>

  """

  @spec post_payment_intents_intent_increment_authorization(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent_increment_authorization(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/increment_authorization")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Capture the funds of an existing uncaptured PaymentIntent when its status is <code>requires_capture</code>.</p>

  <p>Uncaptured PaymentIntents will be canceled a set number of days after they are created (7 by default).</p>

  <p>Learn more about <a href="/docs/payments/capture-later">separate authorization and capture</a>.</p>

  """

  @spec post_payment_intents_intent_capture(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent_capture(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/capture")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Confirm that your customer intends to pay with current or provided
  payment method. Upon confirmation, the PaymentIntent will attempt to initiate
  a payment.</p>

  <p>If the selected payment method requires additional authentication steps, the
  PaymentIntent will transition to the <code>requires_action</code> status and
  suggest additional actions via <code>next_action</code>. If payment fails,
  the PaymentIntent will transition to the <code>requires_payment_method</code> status. If
  payment succeeds, the PaymentIntent will transition to the <code>succeeded</code>
  status (or <code>requires_capture</code>, if <code>capture_method</code> is set to <code>manual</code>).</p>

  <p>If the <code>confirmation_method</code> is <code>automatic</code>, payment may be attempted
  using our <a href="/docs/stripe-js/reference#stripe-handle-card-payment">client SDKs</a>
  and the PaymentIntent’s <a href="#payment_intent_object-client_secret">client_secret</a>.
  After <code>next_action</code>s are handled by the client, no additional
  confirmation is required to complete the payment.</p>

  <p>If the <code>confirmation_method</code> is <code>manual</code>, all payment attempts must be
  initiated using a secret key.
  If any actions are required for the payment, the PaymentIntent will
  return to the <code>requires_confirmation</code> state
  after those actions are completed. Your server needs to then
  explicitly re-confirm the PaymentIntent to initiate the next payment
  attempt. Read the <a href="/docs/payments/payment-intents/web-manual">expanded documentation</a>
  to learn more about manual confirmation.</p>

  """

  @spec post_payment_intents_intent_confirm(
          client :: ExOAPI.Client.t(),
          body :: map(),
          intent :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_intents_intent_confirm(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/confirm")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end
end