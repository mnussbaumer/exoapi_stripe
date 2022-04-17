defmodule ExOAPI.Stripe.SDK.PaymentMethods do
  @doc """
  **description**: <p>Creates a PaymentMethod object. Read the <a href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn how to create PaymentMethods via Stripe.js.</p>

  <p>Instead of creating a PaymentMethod directly, we recommend using the <a href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method details ahead of a future payment.</p>

  """

  @spec post_payment_methods(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_payment_methods(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of PaymentMethods. For listing a customer’s payment methods, you should use <a href="/docs/api/payment_methods/customer_list">List a Customer’s PaymentMethods</a></p>

  """
  @type get_payment_methods_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
  @spec get_payment_methods(
          client :: ExOAPI.Client.t(),
          type :: String.t(),
          list(get_payment_methods_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payment_methods(%ExOAPI.Client{} = client, type, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods")
    |> ExOAPI.Client.add_query("type", type)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Attaches a PaymentMethod object to a Customer.</p>

  <p>To attach a new PaymentMethod to a customer for future payments, we recommend you use a <a href="/docs/api/setup_intents">SetupIntent</a>
  or a PaymentIntent with <a href="/docs/api/payment_intents/create#create_payment_intent-setup_future_usage">setup_future_usage</a>.
  These approaches will perform any necessary steps to ensure that the PaymentMethod can be used in a future payment. Using the
  <code>/v1/payment_methods/:id/attach</code> endpoint does not ensure that future payments can be made with the attached PaymentMethod.
  See <a href="/docs/payments/payment-intents#future-usage">Optimizing cards for future payments</a> for more information about setting up future payments.</p>

  <p>To use this PaymentMethod as the default for invoice or subscription payments,
  set <a href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code>invoice_settings.default_payment_method</code></a>,
  on the Customer to the PaymentMethod’s ID.</p>

  """

  @spec post_payment_methods_payment_method_attach(
          client :: ExOAPI.Client.t(),
          body :: map(),
          payment_method :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_methods_payment_method_attach(%ExOAPI.Client{} = client, body, payment_method) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}/attach")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.</p>

  """

  @spec post_payment_methods_payment_method(
          client :: ExOAPI.Client.t(),
          body :: map(),
          payment_method :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_methods_payment_method(%ExOAPI.Client{} = client, body, payment_method) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a PaymentMethod object.</p>

  """
  @type get_payment_methods_payment_method_opts :: {:expand, String.t()}
  @spec get_payment_methods_payment_method(
          client :: ExOAPI.Client.t(),
          payment_method :: String.t(),
          list(get_payment_methods_payment_method_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_payment_methods_payment_method(%ExOAPI.Client{} = client, payment_method, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}")
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Detaches a PaymentMethod object from a Customer. After a PaymentMethod is detached, it can no longer be used for a payment or re-attached to a Customer.</p>

  """

  @spec post_payment_methods_payment_method_detach(
          client :: ExOAPI.Client.t(),
          body :: map(),
          payment_method :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_payment_methods_payment_method_detach(%ExOAPI.Client{} = client, body, payment_method) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}/detach")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.request()
  end
end