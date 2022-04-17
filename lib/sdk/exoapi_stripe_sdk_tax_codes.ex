defmodule ExOAPI.Stripe.SDK.TaxCodes do
  @doc """
  **description**: <p>A list of <a href="https://stripe.com/docs/tax/tax-codes">all tax codes available</a> to add to Products in order to allow specific tax calculations.</p>

  """
  @type get_tax_codes_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_tax_codes(client :: ExOAPI.Client.t(), list(get_tax_codes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_tax_codes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tax_codes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing tax code. Supply the unique tax code ID and Stripe will return the corresponding tax code information.</p>

  """
  @type get_tax_codes_id_opts :: {:expand, String.t()}
  @spec get_tax_codes_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_tax_codes_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_tax_codes_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tax_codes/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end