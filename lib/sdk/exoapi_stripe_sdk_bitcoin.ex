defmodule ExOAPI.Stripe.SDK.Bitcoin do
  @doc """
  **description**: <p>Retrieves the Bitcoin receiver with the given ID.</p>

  **deprecated**: true

  """
  @type get_bitcoin_receivers_id_opts :: {:expand, String.t()}
  @spec get_bitcoin_receivers_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_bitcoin_receivers_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_bitcoin_receivers_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/bitcoin/receivers/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List bitcoin transacitons for a given receiver.</p>

  **deprecated**: true

  """
  @type get_bitcoin_receivers_receiver_transactions_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
  @spec get_bitcoin_receivers_receiver_transactions(
          client :: ExOAPI.Client.t(),
          receiver :: String.t(),
          list(get_bitcoin_receivers_receiver_transactions_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_bitcoin_receivers_receiver_transactions(%ExOAPI.Client{} = client, receiver, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/bitcoin/receivers/{receiver}/transactions")
    |> ExOAPI.Client.replace_in_path("receiver", receiver)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your receivers. Receivers are returned sorted by creation date, with the most recently created receivers appearing first.</p>

  **deprecated**: true

  """
  @type get_bitcoin_receivers_opts ::
          {:uncaptured_funds, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:filled, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:active, String.t()}
  @spec get_bitcoin_receivers(client :: ExOAPI.Client.t(), list(get_bitcoin_receivers_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_bitcoin_receivers(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/bitcoin/receivers")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:uncaptured_funds, "uncaptured_funds", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:filled, "filled", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List bitcoin transacitons for a given receiver.</p>

  **deprecated**: true

  """
  @type get_bitcoin_transactions_opts ::
          {:starting_after, String.t()}
          | {:receiver, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
  @spec get_bitcoin_transactions(
          client :: ExOAPI.Client.t(),
          list(get_bitcoin_transactions_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_bitcoin_transactions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/bitcoin/transactions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:receiver, "receiver", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end