defmodule ExOAPI.Stripe.SDK.Prices do
  @doc """
  **description**: <p>Updates the specified price by setting the values of the parameters passed. Any parameters not provided are left unchanged.</p>

  """

  @spec post_prices_price(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_lookup_key => boolean(),
              :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
              :nickname => String.t(),
              :metadata => String.t() | map(),
              :lookup_key => String.t(),
              :expand => [String.t()],
              :active => boolean()
            }
            | map(),
          price :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Price.t() | map()}
          | {:error, any()}
  def post_prices_price(%ExOAPI.Client{} = client, body, price) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/prices/{price}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("price", price)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the price with the given ID.</p>

  """
  @type get_prices_price_opts :: {:expand, String.t()}
  @spec get_prices_price(
          client :: ExOAPI.Client.t(),
          price :: String.t(),
          list(get_prices_price_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Price.t() | map()}
          | {:error, any()}
  def get_prices_price(%ExOAPI.Client{} = client, price, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/prices/{price}")
    |> ExOAPI.Client.replace_in_path("price", price)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new price for an existing product. The price can be recurring or one-time.</p>

  """

  @spec post_prices(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :unit_amount_decimal => String.t(),
              :unit_amount => integer(),
              :transform_quantity => %{
                :round => String.t() | :down | :up,
                :divide_by => integer()
              },
              :transfer_lookup_key => boolean(),
              :tiers_mode => String.t() | :graduated | :volume,
              :tiers => [
                %{
                  :up_to => integer() | String.t() | :inf,
                  :unit_amount_decimal => String.t(),
                  :unit_amount => integer(),
                  :flat_amount_decimal => String.t(),
                  :flat_amount => integer()
                }
              ],
              :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
              :recurring => %{
                :usage_type => String.t() | :licensed | :metered,
                :interval_count => integer(),
                :interval => String.t() | :day | :month | :week | :year,
                :aggregate_usage => String.t() | :last_during_period | :last_ever | :max | :sum
              },
              :product_data => %{
                :unit_label => String.t(),
                :tax_code => String.t(),
                :statement_descriptor => String.t(),
                :name => String.t(),
                :metadata => map(),
                :id => String.t(),
                :active => boolean()
              },
              :product => String.t(),
              :nickname => String.t(),
              :metadata => map(),
              :lookup_key => String.t(),
              :expand => [String.t()],
              :currency => String.t(),
              :billing_scheme => String.t() | :per_unit | :tiered,
              :active => boolean()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Price.t() | map()}
          | {:error, any()}
  def post_prices(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/prices")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your prices.</p>

  """
  @type get_prices_opts ::
          {:type, String.t()}
          | {:starting_after, String.t()}
          | {:recurring, String.t()}
          | {:product, String.t()}
          | {:lookup_keys, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:currency, String.t()}
          | {:created, String.t()}
          | {:active, String.t()}
  @spec get_prices(client :: ExOAPI.Client.t(), list(get_prices_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Price.t()]
             }
           | map()}
          | {:error, any()}
  def get_prices(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/prices")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:recurring, "recurring", "deepObject", true},
      {:product, "product", "form", true},
      {:lookup_keys, "lookup_keys", "deepObject", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:currency, "currency", "form", true},
      {:created, "created", "deepObject", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for prices you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_prices_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_prices_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_prices_search_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :total_count => integer(),
               :object => String.t() | :search_result,
               :next_page => String.t(),
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Price.t()]
             }
           | map()}
          | {:error, any()}
  def get_prices_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/prices/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end