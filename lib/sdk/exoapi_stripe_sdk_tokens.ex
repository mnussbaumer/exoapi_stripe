defmodule ExOAPI.Stripe.SDK.Tokens do
  @doc """
  **description**: <p>Retrieves the token with the given ID.</p>

  """
  @type get_tokens_token_opts :: {:expand, String.t()}
  @spec get_tokens_token(
          client :: ExOAPI.Client.t(),
          token :: String.t(),
          list(get_tokens_token_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_tokens_token(%ExOAPI.Client{} = client, token, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tokens/{token}")
    |> ExOAPI.Client.replace_in_path("token", token)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a single-use token that represents a bank account’s details.
  This token can be used with any API method in place of a bank account dictionary. This token can be used only once, by attaching it to a <a href="#accounts">Custom account</a>.</p>

  """

  @spec post_tokens(client :: ExOAPI.Client.t(), body :: map()) :: {:ok, any()} | {:error, any()}
  def post_tokens(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tokens")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end