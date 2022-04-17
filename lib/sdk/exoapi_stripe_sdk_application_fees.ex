defmodule ExOAPI.Stripe.SDK.ApplicationFees do
  @doc """
  **description**: <p>Updates the specified application fee refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  <p>This request only accepts metadata as an argument.</p>

  """

  @spec post_application_fees_fee_refunds_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t(),
          fee :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_application_fees_fee_refunds_id(%ExOAPI.Client{} = client, body, id, fee) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees/{fee}/refunds/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("fee", fee)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>By default, you can see the 10 most recent refunds stored directly on the application fee object, but you can also retrieve details about a specific refund stored on the application fee.</p>

  """
  @type get_application_fees_fee_refunds_id_opts :: {:expand, String.t()}
  @spec get_application_fees_fee_refunds_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          fee :: String.t(),
          list(get_application_fees_fee_refunds_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_application_fees_fee_refunds_id(%ExOAPI.Client{} = client, id, fee, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees/{fee}/refunds/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("fee", fee)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Refunds an application fee that has previously been collected but not yet refunded.
  Funds will be refunded to the Stripe account from which the fee was originally collected.</p>

  <p>You can optionally refund only part of an application fee.
  You can do so multiple times, until the entire fee has been refunded.</p>

  <p>Once entirely refunded, an application fee can’t be refunded again.
  This method will raise an error when called on an already-refunded application fee,
  or when trying to refund more money than is left on an application fee.</p>

  """

  @spec post_application_fees_id_refunds(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_application_fees_id_refunds(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees/{id}/refunds")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can see a list of the refunds belonging to a specific application fee. Note that the 10 most recent refunds are always available by default on the application fee object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.</p>

  """
  @type get_application_fees_id_refunds_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_application_fees_id_refunds(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_application_fees_id_refunds_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_application_fees_id_refunds(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees/{id}/refunds")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @spec post_application_fees_id_refund(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_application_fees_id_refund(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees/{id}/refund")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of application fees you’ve previously collected. The application fees are returned in sorted order, with the most recent fees appearing first.</p>

  """
  @type get_application_fees_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:charge, String.t()}
  @spec get_application_fees(client :: ExOAPI.Client.t(), list(get_application_fees_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_application_fees(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:charge, "charge", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an application fee that your account has collected. The same information is returned when refunding the application fee.</p>

  """
  @type get_application_fees_id_opts :: {:expand, String.t()}
  @spec get_application_fees_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_application_fees_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_application_fees_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/application_fees/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end