defmodule ExOAPI.Stripe.SDK.EphemeralKeys do
  @doc """
  **description**: <p>Invalidates a short-lived API key for a given resource.</p>

  """

  @spec delete_ephemeral_keys_key(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          key :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_ephemeral_keys_key(%ExOAPI.Client{} = client, body, key) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/ephemeral_keys/{key}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("key", key)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a short-lived API key for a given resource.</p>

  """

  @spec post_ephemeral_keys(
          client :: ExOAPI.Client.t(),
          body ::
            %{:issuing_card => String.t(), :expand => [String.t()], :customer => String.t()}
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_ephemeral_keys(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/ephemeral_keys")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end