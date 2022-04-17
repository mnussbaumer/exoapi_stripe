defmodule ExOAPI.Stripe.SDK.Refunds do
  @doc """
  **description**: <p>Cancels a refund with a status of <code>requires_action</code>.</p>

  <p>Refunds in other states cannot be canceled, and only refunds for payment methods that require customer action will enter the <code>requires_action</code> state.</p>

  """

  @spec post_refunds_refund_cancel(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          refund :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_refunds_refund_cancel(%ExOAPI.Client{} = client, body, refund) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/refunds/{refund}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("refund", refund)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  <p>This request only accepts <code>metadata</code> as an argument.</p>

  """

  @spec post_refunds_refund(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          refund :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_refunds_refund(%ExOAPI.Client{} = client, body, refund) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/refunds/{refund}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("refund", refund)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing refund.</p>

  """
  @type get_refunds_refund_opts :: {:expand, String.t()}
  @spec get_refunds_refund(
          client :: ExOAPI.Client.t(),
          refund :: String.t(),
          list(get_refunds_refund_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_refunds_refund(%ExOAPI.Client{} = client, refund, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/refunds/{refund}")
    |> ExOAPI.Client.replace_in_path("refund", refund)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Create a refund.</p>

  """

  @spec post_refunds(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :reverse_transfer => boolean(),
              :refund_application_fee => boolean(),
              :reason => String.t() | :duplicate | :fraudulent | :requested_by_customer,
              :payment_intent => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :charge => String.t(),
              :amount => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_refunds(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/refunds")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of all refunds you’ve previously created. The refunds are returned in sorted order, with the most recent refunds appearing first. For convenience, the 10 most recent refunds are always available by default on the charge object.</p>

  """
  @type get_refunds_opts ::
          {:starting_after, String.t()}
          | {:payment_intent, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:charge, String.t()}
  @spec get_refunds(client :: ExOAPI.Client.t(), list(get_refunds_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_refunds(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/refunds")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:payment_intent, "payment_intent", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:charge, "charge", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end