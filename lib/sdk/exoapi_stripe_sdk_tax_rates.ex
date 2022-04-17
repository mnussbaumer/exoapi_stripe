defmodule ExOAPI.Stripe.SDK.TaxRates do
  @doc """
  **description**: <p>Updates an existing tax rate.</p>

  """

  @spec post_tax_rates_tax_rate(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :tax_type =>
                String.t() | :gst | :hst | :jct | :pst | :qst | :rst | :sales_tax | :vat,
              :state => String.t(),
              :metadata => String.t() | map(),
              :jurisdiction => String.t(),
              :expand => [String.t()],
              :display_name => String.t(),
              :description => String.t(),
              :country => String.t(),
              :active => boolean()
            }
            | map(),
          tax_rate :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_tax_rates_tax_rate(%ExOAPI.Client{} = client, body, tax_rate) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tax_rates/{tax_rate}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("tax_rate", tax_rate)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a tax rate with the given ID</p>

  """
  @type get_tax_rates_tax_rate_opts :: {:expand, String.t()}
  @spec get_tax_rates_tax_rate(
          client :: ExOAPI.Client.t(),
          tax_rate :: String.t(),
          list(get_tax_rates_tax_rate_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_tax_rates_tax_rate(%ExOAPI.Client{} = client, tax_rate, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tax_rates/{tax_rate}")
    |> ExOAPI.Client.replace_in_path("tax_rate", tax_rate)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new tax rate.</p>

  """

  @spec post_tax_rates(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :tax_type =>
                String.t() | :gst | :hst | :jct | :pst | :qst | :rst | :sales_tax | :vat,
              :state => String.t(),
              :percentage => number(),
              :metadata => map(),
              :jurisdiction => String.t(),
              :inclusive => boolean(),
              :expand => [String.t()],
              :display_name => String.t(),
              :description => String.t(),
              :country => String.t(),
              :active => boolean()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_tax_rates(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tax_rates")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the most recently created tax rates appearing first.</p>

  """
  @type get_tax_rates_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:inclusive, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:active, String.t()}
  @spec get_tax_rates(client :: ExOAPI.Client.t(), list(get_tax_rates_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_tax_rates(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tax_rates")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:inclusive, "inclusive", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end