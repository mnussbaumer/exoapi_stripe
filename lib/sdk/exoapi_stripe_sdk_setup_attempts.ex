defmodule ExOAPI.Stripe.SDK.SetupAttempts do
  @doc """
  **description**: <p>Returns a list of SetupAttempts associated with a provided SetupIntent.</p>

  """
  @type get_setup_attempts_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_setup_attempts(
          client :: ExOAPI.Client.t(),
          setup_intent :: String.t(),
          list(get_setup_attempts_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_setup_attempts(%ExOAPI.Client{} = client, setup_intent, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/setup_attempts")
    |> ExOAPI.Client.add_query("setup_intent", setup_intent)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end