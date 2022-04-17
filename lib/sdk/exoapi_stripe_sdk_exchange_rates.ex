defmodule ExOAPI.Stripe.SDK.ExchangeRates do
  @doc """
  **description**: <p>Returns a list of objects that contain the rates at which foreign currencies are converted to one another. Only shows the currencies for which Stripe supports.</p>

  """
  @type get_exchange_rates_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_exchange_rates(client :: ExOAPI.Client.t(), list(get_exchange_rates_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_exchange_rates(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/exchange_rates")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the exchange rates from the given currency to every supported currency.</p>

  """
  @type get_exchange_rates_rate_id_opts :: {:expand, String.t()}
  @spec get_exchange_rates_rate_id(
          client :: ExOAPI.Client.t(),
          rate_id :: String.t(),
          list(get_exchange_rates_rate_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_exchange_rates_rate_id(%ExOAPI.Client{} = client, rate_id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/exchange_rates/{rate_id}")
    |> ExOAPI.Client.replace_in_path("rate_id", rate_id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end