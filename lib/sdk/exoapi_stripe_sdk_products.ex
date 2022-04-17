defmodule ExOAPI.Stripe.SDK.Products do
  @doc """
  **description**: <p>Search for products you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_products_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_products_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_products_search_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_products_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/products/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new product object.</p>

  """

  @spec post_products(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :url => String.t(),
              :unit_label => String.t(),
              :tax_code => String.t(),
              :statement_descriptor => String.t(),
              :shippable => boolean(),
              :package_dimensions => %{
                :width => number(),
                :weight => number(),
                :length => number(),
                :height => number()
              },
              :name => String.t(),
              :metadata => map(),
              :images => [String.t()],
              :id => String.t(),
              :expand => [String.t()],
              :description => String.t(),
              :active => boolean()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_products(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/products")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your products. The products are returned sorted by creation date, with the most recently created products appearing first.</p>

  """
  @type get_products_opts ::
          {:url, String.t()}
          | {:starting_after, String.t()}
          | {:shippable, String.t()}
          | {:limit, String.t()}
          | {:ids, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:active, String.t()}
  @spec get_products(client :: ExOAPI.Client.t(), list(get_products_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_products(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/products")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:url, "url", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:shippable, "shippable", "form", true},
      {:limit, "limit", "form", true},
      {:ids, "ids", "deepObject", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a product. Deleting a product is only possible if it has no prices associated with it. Additionally, deleting a product with <code>type=good</code> is only possible if it has no SKUs associated with it.</p>

  """

  @spec delete_products_id(client :: ExOAPI.Client.t(), body :: %{} | map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def delete_products_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/products/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_products_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :url => String.t(),
              :unit_label => String.t(),
              :tax_code => String.t(),
              :statement_descriptor => String.t(),
              :shippable => boolean(),
              :package_dimensions =>
                String.t()
                | %{
                    :width => number(),
                    :weight => number(),
                    :length => number(),
                    :height => number()
                  },
              :name => String.t(),
              :metadata => String.t() | map(),
              :images => String.t() | [String.t()],
              :expand => [String.t()],
              :description => String.t(),
              :active => boolean()
            }
            | map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_products_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/products/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing product. Supply the unique product ID from either a product creation request or the product list, and Stripe will return the corresponding product information.</p>

  """
  @type get_products_id_opts :: {:expand, String.t()}
  @spec get_products_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_products_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_products_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/products/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end