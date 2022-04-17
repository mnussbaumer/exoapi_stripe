defmodule ExOAPI.Stripe.SDK.Stripe3dSecure do
  @doc """
  **description**: <p>Retrieves a 3D Secure object.</p>

  """
  @type get3d_secure_three_d_secure_opts :: {:expand, String.t()}
  @spec get3d_secure_three_d_secure(
          client :: ExOAPI.Client.t(),
          three_d_secure :: String.t(),
          list(get3d_secure_three_d_secure_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get3d_secure_three_d_secure(%ExOAPI.Client{} = client, three_d_secure, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/3d_secure/{three_d_secure}")
    |> ExOAPI.Client.replace_in_path("three_d_secure", three_d_secure)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Initiate 3D Secure authentication.</p>

  """

  @spec post3d_secure(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post3d_secure(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/3d_secure")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end