defmodule ExOAPI.Stripe.SDK.Recipients do
  @doc """
  **description**: <p>Permanently deletes a recipient. It cannot be undone.</p>

  **deprecated**: true

  """

  @spec delete_recipients_id(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def delete_recipients_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/recipients/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified recipient by setting the values of the parameters passed.
  Any parameters not provided will be left unchanged.</p>

  <p>If you update the name or tax ID, the identity verification will automatically be rerun.
  If you update the bank account, the bank account validation will automatically be rerun.</p>

  **deprecated**: true

  """

  @spec post_recipients_id(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_recipients_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/recipients/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing recipient. You need only supply the unique recipient identifier that was returned upon recipient creation.</p>

  **deprecated**: true

  """
  @type get_recipients_id_opts :: {:expand, String.t()}
  @spec get_recipients_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_recipients_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_recipients_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/recipients/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>Recipient</code> object and verifies the recipient’s identity.
  Also verifies the recipient’s bank account information or debit card, if either is provided.</p>

  **deprecated**: true

  """

  @spec post_recipients(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_recipients(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/recipients")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your recipients. The recipients are returned sorted by creation date, with the most recently created recipients appearing first.</p>

  **deprecated**: true

  """
  @type get_recipients_opts ::
          {:verified, String.t()}
          | {:type, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_recipients(client :: ExOAPI.Client.t(), list(get_recipients_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_recipients(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/recipients")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:verified, "verified", "form", true},
      {:type, "type", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end