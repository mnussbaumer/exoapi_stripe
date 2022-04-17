defmodule ExOAPI.Stripe.SDK.IssuerFraudRecords do
  @doc """
  **description**: <p>Retrieves the details of an issuer fraud record that has previously been created. </p>

  <p>Please refer to the <a href="#issuer_fraud_record_object">issuer fraud record</a> object reference for more details.</p>

  **deprecated**: true

  """
  @type get_issuer_fraud_records_issuer_fraud_record_opts :: {:expand, String.t()}
  @spec get_issuer_fraud_records_issuer_fraud_record(
          client :: ExOAPI.Client.t(),
          issuer_fraud_record :: String.t(),
          list(get_issuer_fraud_records_issuer_fraud_record_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuer_fraud_records_issuer_fraud_record(
        %ExOAPI.Client{} = client,
        issuer_fraud_record,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuer_fraud_records/{issuer_fraud_record}")
    |> ExOAPI.Client.replace_in_path("issuer_fraud_record", issuer_fraud_record)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of issuer fraud records.</p>

  **deprecated**: true

  """
  @type get_issuer_fraud_records_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:charge, String.t()}
  @spec get_issuer_fraud_records(
          client :: ExOAPI.Client.t(),
          list(get_issuer_fraud_records_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuer_fraud_records(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuer_fraud_records")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:charge, "charge", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end