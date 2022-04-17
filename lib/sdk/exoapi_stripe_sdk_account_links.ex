defmodule ExOAPI.Stripe.SDK.AccountLinks do
  @doc """
  **description**: <p>Creates an AccountLink object that includes a single-use Stripe URL that the platform can redirect their user to in order to take them through the Connect Onboarding flow.</p>

  """

  @spec post_account_links(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_account_links(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account_links")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end