defmodule ExOAPI.Stripe.SDK.Topups do
  @doc """
  **description**: <p>Updates the metadata of a top-up. Other top-up details are not editable by design.</p>

  """

  @spec post_topups_topup(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t()
            }
            | map(),
          topup :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_topups_topup(%ExOAPI.Client{} = client, body, topup) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/topups/{topup}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("topup", topup)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of a top-up that has previously been created. Supply the unique top-up ID that was returned from your previous request, and Stripe will return the corresponding top-up information.</p>

  """
  @type get_topups_topup_opts :: {:expand, String.t()}
  @spec get_topups_topup(
          client :: ExOAPI.Client.t(),
          topup :: String.t(),
          list(get_topups_topup_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_topups_topup(%ExOAPI.Client{} = client, topup, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/topups/{topup}")
    |> ExOAPI.Client.replace_in_path("topup", topup)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Top up the balance of an account</p>

  """

  @spec post_topups(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_group => String.t(),
              :statement_descriptor => String.t(),
              :source => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t(),
              :currency => String.t(),
              :amount => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_topups(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/topups")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of top-ups.</p>

  """
  @type get_topups_opts ::
          {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:amount, String.t()}
  @spec get_topups(client :: ExOAPI.Client.t(), list(get_topups_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_topups(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/topups")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:amount, "amount", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Cancels a top-up. Only pending top-ups can be canceled.</p>

  """

  @spec post_topups_topup_cancel(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          topup :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_topups_topup_cancel(%ExOAPI.Client{} = client, body, topup) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/topups/{topup}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("topup", topup)
    |> ExOAPI.Client.request()
  end
end