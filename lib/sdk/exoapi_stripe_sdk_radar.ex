defmodule ExOAPI.Stripe.SDK.Radar do
  @doc """
  **description**: <p>Returns a list of early fraud warnings.</p>

  """
  @type get_radar_early_fraud_warnings_opts ::
          {:starting_after, String.t()}
          | {:payment_intent, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:charge, String.t()}
  @spec get_radar_early_fraud_warnings(
          client :: ExOAPI.Client.t(),
          list(get_radar_early_fraud_warnings_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_radar_early_fraud_warnings(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/early_fraud_warnings")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:payment_intent, "payment_intent", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:charge, "charge", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes a <code>ValueList</code> object, also deleting any items contained within the value list. To be deleted, a value list must not be referenced in any rules.</p>

  """

  @spec delete_radar_value_lists_value_list(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          value_list :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_radar_value_lists_value_list(%ExOAPI.Client{} = client, body, value_list) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_lists/{value_list}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("value_list", value_list)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a <code>ValueList</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Note that <code>item_type</code> is immutable.</p>

  """

  @spec post_radar_value_lists_value_list(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :name => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :alias => String.t()
            }
            | map(),
          value_list :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_radar_value_lists_value_list(%ExOAPI.Client{} = client, body, value_list) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_lists/{value_list}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("value_list", value_list)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a <code>ValueList</code> object.</p>

  """
  @type get_radar_value_lists_value_list_opts :: {:expand, String.t()}
  @spec get_radar_value_lists_value_list(
          client :: ExOAPI.Client.t(),
          value_list :: String.t(),
          list(get_radar_value_lists_value_list_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_radar_value_lists_value_list(%ExOAPI.Client{} = client, value_list, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_lists/{value_list}")
    |> ExOAPI.Client.replace_in_path("value_list", value_list)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>ValueListItem</code> object, which is added to the specified parent value list.</p>

  """

  @spec post_radar_value_list_items(
          client :: ExOAPI.Client.t(),
          body ::
            %{:value_list => String.t(), :value => String.t(), :expand => [String.t()]} | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_radar_value_list_items(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_list_items")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of <code>ValueListItem</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_radar_value_list_items_opts ::
          {:value, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_radar_value_list_items(
          client :: ExOAPI.Client.t(),
          value_list :: String.t(),
          list(get_radar_value_list_items_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_radar_value_list_items(%ExOAPI.Client{} = client, value_list, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_list_items")
    |> ExOAPI.Client.add_query("value_list", value_list)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:value, "value", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an early fraud warning that has previously been created. </p>

  <p>Please refer to the <a href="#early_fraud_warning_object">early fraud warning</a> object reference for more details.</p>

  """
  @type get_radar_early_fraud_warnings_early_fraud_warning_opts :: {:expand, String.t()}
  @spec get_radar_early_fraud_warnings_early_fraud_warning(
          client :: ExOAPI.Client.t(),
          early_fraud_warning :: String.t(),
          list(get_radar_early_fraud_warnings_early_fraud_warning_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_radar_early_fraud_warnings_early_fraud_warning(
        %ExOAPI.Client{} = client,
        early_fraud_warning,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/early_fraud_warnings/{early_fraud_warning}")
    |> ExOAPI.Client.replace_in_path("early_fraud_warning", early_fraud_warning)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new <code>ValueList</code> object, which can then be referenced in rules.</p>

  """

  @spec post_radar_value_lists(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :name => String.t(),
              :metadata => map(),
              :item_type =>
                String.t()
                | :card_bin
                | :card_fingerprint
                | :case_sensitive_string
                | :country
                | :customer_id
                | :email
                | :ip_address
                | :string,
              :expand => [String.t()],
              :alias => String.t()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_radar_value_lists(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_lists")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of <code>ValueList</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_radar_value_lists_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:contains, String.t()}
          | {:alias, String.t()}
  @spec get_radar_value_lists(client :: ExOAPI.Client.t(), list(get_radar_value_lists_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_radar_value_lists(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_lists")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:contains, "contains", "form", true},
      {:alias, "alias", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes a <code>ValueListItem</code> object, removing it from its parent value list.</p>

  """

  @spec delete_radar_value_list_items_item(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          item :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_radar_value_list_items_item(%ExOAPI.Client{} = client, body, item) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_list_items/{item}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("item", item)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a <code>ValueListItem</code> object.</p>

  """
  @type get_radar_value_list_items_item_opts :: {:expand, String.t()}
  @spec get_radar_value_list_items_item(
          client :: ExOAPI.Client.t(),
          item :: String.t(),
          list(get_radar_value_list_items_item_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_radar_value_list_items_item(%ExOAPI.Client{} = client, item, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/radar/value_list_items/{item}")
    |> ExOAPI.Client.replace_in_path("item", item)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end