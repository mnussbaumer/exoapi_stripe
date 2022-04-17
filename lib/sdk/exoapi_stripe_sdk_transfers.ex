defmodule ExOAPI.Stripe.SDK.Transfers do
  @doc """
  **description**: <p>When you create a new reversal, you must specify a transfer to create it on.</p>

  <p>When reversing transfers, you can optionally reverse part of the transfer. You can do so as many times as you wish until the entire transfer has been reversed.</p>

  <p>Once entirely reversed, a transfer can’t be reversed again. This method will return an error when called on an already-reversed transfer, or when trying to reverse more money than is left on a transfer.</p>

  """

  @spec post_transfers_id_reversals(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :refund_application_fee => boolean(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t(),
              :amount => integer()
            }
            | map(),
          id :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.TransferReversal.t() | map()}
          | {:error, any()}
  def post_transfers_id_reversals(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers/{id}/reversals")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can see a list of the reversals belonging to a specific transfer. Note that the 10 most recent reversals are always available by default on the transfer object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional reversals.</p>

  """
  @type get_transfers_id_reversals_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_transfers_id_reversals(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_transfers_id_reversals_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.TransferReversal.t()]
             }
           | map()}
          | {:error, any()}
  def get_transfers_id_reversals(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers/{id}/reversals")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>To send funds from your Stripe account to a connected account, you create a new transfer object. Your <a href="#balance">Stripe balance</a> must be able to cover the transfer amount, or you’ll receive an “Insufficient Funds” error.</p>

  """

  @spec post_transfers(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_group => String.t(),
              :source_type => String.t() | :bank_account | :card | :fpx,
              :source_transaction => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :destination => String.t(),
              :description => String.t(),
              :currency => String.t(),
              :amount => integer()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Transfer.t() | map()}
          | {:error, any()}
  def post_transfers(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of existing transfers sent to connected accounts. The transfers are returned in sorted order, with the most recently created transfers appearing first.</p>

  """
  @type get_transfers_opts ::
          {:transfer_group, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:destination, String.t()}
          | {:created, String.t()}
  @spec get_transfers(client :: ExOAPI.Client.t(), list(get_transfers_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Transfer.t()]
             }
           | map()}
          | {:error, any()}
  def get_transfers(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:transfer_group, "transfer_group", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:destination, "destination", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified reversal by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  <p>This request only accepts metadata and description as arguments.</p>

  """

  @spec post_transfers_transfer_reversals_id(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          transfer :: String.t(),
          id :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.TransferReversal.t() | map()}
          | {:error, any()}
  def post_transfers_transfer_reversals_id(%ExOAPI.Client{} = client, body, transfer, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers/{transfer}/reversals/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("transfer", transfer)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>By default, you can see the 10 most recent reversals stored directly on the transfer object, but you can also retrieve details about a specific reversal stored on the transfer.</p>

  """
  @type get_transfers_transfer_reversals_id_opts :: {:expand, String.t()}
  @spec get_transfers_transfer_reversals_id(
          client :: ExOAPI.Client.t(),
          transfer :: String.t(),
          id :: String.t(),
          list(get_transfers_transfer_reversals_id_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.TransferReversal.t() | map()}
          | {:error, any()}
  def get_transfers_transfer_reversals_id(%ExOAPI.Client{} = client, transfer, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers/{transfer}/reversals/{id}")
    |> ExOAPI.Client.replace_in_path("transfer", transfer)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified transfer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  <p>This request accepts only metadata as an argument.</p>

  """

  @spec post_transfers_transfer(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t()
            }
            | map(),
          transfer :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Transfer.t() | map()}
          | {:error, any()}
  def post_transfers_transfer(%ExOAPI.Client{} = client, body, transfer) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers/{transfer}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("transfer", transfer)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing transfer. Supply the unique transfer ID from either a transfer creation request or the transfer list, and Stripe will return the corresponding transfer information.</p>

  """
  @type get_transfers_transfer_opts :: {:expand, String.t()}
  @spec get_transfers_transfer(
          client :: ExOAPI.Client.t(),
          transfer :: String.t(),
          list(get_transfers_transfer_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Transfer.t() | map()}
          | {:error, any()}
  def get_transfers_transfer(%ExOAPI.Client{} = client, transfer, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/transfers/{transfer}")
    |> ExOAPI.Client.replace_in_path("transfer", transfer)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end