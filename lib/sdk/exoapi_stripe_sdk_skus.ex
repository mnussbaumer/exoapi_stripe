defmodule ExOAPI.Stripe.SDK.Skus do
  @doc """
  **description**: <p>Creates a new SKU associated with a product.</p>

  """

  @spec post_skus(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :product => String.t(),
              :price => integer(),
              :package_dimensions => %{
                :width => number(),
                :weight => number(),
                :length => number(),
                :height => number()
              },
              :metadata => map(),
              :inventory => %{
                :value => String.t() | :in_stock | :limited | :out_of_stock,
                :type => String.t() | :bucket | :finite | :infinite,
                :quantity => integer()
              },
              :image => String.t(),
              :id => String.t(),
              :expand => [String.t()],
              :currency => String.t(),
              :attributes => map(),
              :active => boolean()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_skus(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/skus")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your SKUs. The SKUs are returned sorted by creation date, with the most recently created SKUs appearing first.</p>

  """
  @type get_skus_opts ::
          {:starting_after, String.t()}
          | {:product, String.t()}
          | {:limit, String.t()}
          | {:in_stock, String.t()}
          | {:ids, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:attributes, String.t()}
          | {:active, String.t()}
  @spec get_skus(client :: ExOAPI.Client.t(), list(get_skus_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_skus(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/skus")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:product, "product", "form", true},
      {:limit, "limit", "form", true},
      {:in_stock, "in_stock", "form", true},
      {:ids, "ids", "deepObject", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:attributes, "attributes", "deepObject", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a SKU. Deleting a SKU is only possible until it has been used in an order.</p>

  """

  @spec delete_skus_id(client :: ExOAPI.Client.t(), body :: %{} | map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def delete_skus_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/skus/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specific SKU by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  <p>Note that a SKU’s <code>attributes</code> are not editable. Instead, you would need to deactivate the existing SKU and create a new one with the new attribute values.</p>

  """

  @spec post_skus_id(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :product => String.t(),
              :price => integer(),
              :package_dimensions =>
                String.t()
                | %{
                    :width => number(),
                    :weight => number(),
                    :length => number(),
                    :height => number()
                  },
              :metadata => String.t() | map(),
              :inventory => %{
                :value => String.t() | :in_stock | :limited | :out_of_stock,
                :type => String.t() | :bucket | :finite | :infinite,
                :quantity => integer()
              },
              :image => String.t(),
              :expand => [String.t()],
              :currency => String.t(),
              :attributes => map(),
              :active => boolean()
            }
            | map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_skus_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/skus/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing SKU. Supply the unique SKU identifier from either a SKU creation request or from the product, and Stripe will return the corresponding SKU information.</p>

  """
  @type get_skus_id_opts :: {:expand, String.t()}
  @spec get_skus_id(client :: ExOAPI.Client.t(), id :: String.t(), list(get_skus_id_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_skus_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/skus/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end