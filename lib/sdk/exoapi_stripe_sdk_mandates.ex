defmodule ExOAPI.Stripe.SDK.Mandates do
  @doc """
  **description**: <p>Retrieves a Mandate object.</p>

  """
  @type get_mandates_mandate_opts :: {:expand, String.t()}
  @spec get_mandates_mandate(
          client :: ExOAPI.Client.t(),
          mandate :: String.t(),
          list(get_mandates_mandate_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_mandates_mandate(%ExOAPI.Client{} = client, mandate, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/mandates/{mandate}")
    |> ExOAPI.Client.replace_in_path("mandate", mandate)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end