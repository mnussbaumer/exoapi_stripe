defmodule ExOAPI.Stripe.SDK.CountrySpecs do
  @doc """
  **description**: <p>Lists all Country Spec objects available in the API.</p>

  """
  @type get_country_specs_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_country_specs(client :: ExOAPI.Client.t(), list(get_country_specs_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.CountrySpec.t()]
             }
           | map()}
          | {:error, any()}
  def get_country_specs(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/country_specs")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a Country Spec for a given Country code.</p>

  """
  @type get_country_specs_country_opts :: {:expand, String.t()}
  @spec get_country_specs_country(
          client :: ExOAPI.Client.t(),
          country :: String.t(),
          list(get_country_specs_country_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.CountrySpec.t() | map()}
          | {:error, any()}
  def get_country_specs_country(%ExOAPI.Client{} = client, country, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/country_specs/{country}")
    |> ExOAPI.Client.replace_in_path("country", country)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end