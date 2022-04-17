defmodule ExOAPI.Stripe.SDK.Sources do
  @doc """
  **description**: <p>Verify a given source.</p>

  """

  @spec post_sources_source_verify(
          client :: ExOAPI.Client.t(),
          body :: %{:values => [String.t()], :expand => [String.t()]} | map(),
          source :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_sources_source_verify(%ExOAPI.Client{} = client, body, source) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources/{source}/verify")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("source", source)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a new Source MandateNotification.</p>

  """
  @type get_sources_source_mandate_notifications_mandate_notification_opts ::
          {:expand, String.t()}
  @spec get_sources_source_mandate_notifications_mandate_notification(
          client :: ExOAPI.Client.t(),
          source :: String.t(),
          mandate_notification :: String.t(),
          list(get_sources_source_mandate_notifications_mandate_notification_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_sources_source_mandate_notifications_mandate_notification(
        %ExOAPI.Client{} = client,
        source,
        mandate_notification,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources/{source}/mandate_notifications/{mandate_notification}")
    |> ExOAPI.Client.replace_in_path("source", source)
    |> ExOAPI.Client.replace_in_path("mandate_notification", mandate_notification)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified source by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  <p>This request accepts the <code>metadata</code> and <code>owner</code> as arguments. It is also possible to update type specific information for selected payment methods. Please refer to our <a href="/docs/sources">payment method guides</a> for more detail.</p>

  """

  @spec post_sources_source(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :source_order => %{
                :shipping => %{
                  :tracking_number => String.t(),
                  :phone => String.t(),
                  :name => String.t(),
                  :carrier => String.t(),
                  :address => %{
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  }
                },
                :items => [
                  %{
                    :type => String.t() | :discount | :shipping | :sku | :tax,
                    :quantity => integer(),
                    :parent => String.t(),
                    :description => String.t(),
                    :currency => String.t(),
                    :amount => integer()
                  }
                ]
              },
              :owner => %{
                :phone => String.t(),
                :name => String.t(),
                :email => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :metadata => String.t() | map(),
              :mandate => %{
                :notification_method =>
                  String.t() | :deprecated_none | :email | :manual | :none | :stripe_email,
                :interval => String.t() | :one_time | :scheduled | :variable,
                :currency => String.t(),
                :amount => String.t() | integer(),
                :acceptance => %{
                  :user_agent => String.t(),
                  :type => String.t() | :offline | :online,
                  :status => String.t() | :accepted | :pending | :refused | :revoked,
                  :online => %{:user_agent => String.t(), :ip => String.t(), :date => integer()},
                  :offline => %{:contact_email => String.t()},
                  :ip => String.t(),
                  :date => integer()
                }
              },
              :expand => [String.t()],
              :amount => integer()
            }
            | map(),
          source :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_sources_source(%ExOAPI.Client{} = client, body, source) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources/{source}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("source", source)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an existing source object. Supply the unique source ID from a source creation request and Stripe will return the corresponding up-to-date source object information.</p>

  """
  @type get_sources_source_opts :: {:expand, String.t()} | {:client_secret, String.t()}
  @spec get_sources_source(
          client :: ExOAPI.Client.t(),
          source :: String.t(),
          list(get_sources_source_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_sources_source(%ExOAPI.Client{} = client, source, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources/{source}")
    |> ExOAPI.Client.replace_in_path("source", source)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true},
      {:client_secret, "client_secret", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new source object.</p>

  """

  @spec post_sources(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :usage => String.t() | :reusable | :single_use,
              :type => String.t(),
              :token => String.t(),
              :statement_descriptor => String.t(),
              :source_order => %{
                :shipping => %{
                  :tracking_number => String.t(),
                  :phone => String.t(),
                  :name => String.t(),
                  :carrier => String.t(),
                  :address => %{
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  }
                },
                :items => [
                  %{
                    :type => String.t() | :discount | :shipping | :sku | :tax,
                    :quantity => integer(),
                    :parent => String.t(),
                    :description => String.t(),
                    :currency => String.t(),
                    :amount => integer()
                  }
                ]
              },
              :redirect => %{:return_url => String.t()},
              :receiver => %{:refund_attributes_method => String.t() | :email | :manual | :none},
              :owner => %{
                :phone => String.t(),
                :name => String.t(),
                :email => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :original_source => String.t(),
              :metadata => map(),
              :mandate => %{
                :notification_method =>
                  String.t() | :deprecated_none | :email | :manual | :none | :stripe_email,
                :interval => String.t() | :one_time | :scheduled | :variable,
                :currency => String.t(),
                :amount => String.t() | integer(),
                :acceptance => %{
                  :user_agent => String.t(),
                  :type => String.t() | :offline | :online,
                  :status => String.t() | :accepted | :pending | :refused | :revoked,
                  :online => %{:user_agent => String.t(), :ip => String.t(), :date => integer()},
                  :offline => %{:contact_email => String.t()},
                  :ip => String.t(),
                  :date => integer()
                }
              },
              :flow => String.t() | :code_verification | :none | :receiver | :redirect,
              :expand => [String.t()],
              :customer => String.t(),
              :currency => String.t(),
              :amount => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_sources(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List source transactions for a given source.</p>

  """
  @type get_sources_source_source_transactions_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_sources_source_source_transactions(
          client :: ExOAPI.Client.t(),
          source :: String.t(),
          list(get_sources_source_source_transactions_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_sources_source_source_transactions(%ExOAPI.Client{} = client, source, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources/{source}/source_transactions")
    |> ExOAPI.Client.replace_in_path("source", source)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve an existing source transaction object. Supply the unique source ID from a source creation request and the source transaction ID and Stripe will return the corresponding up-to-date source object information.</p>

  """
  @type get_sources_source_source_transactions_source_transaction_opts :: {:expand, String.t()}
  @spec get_sources_source_source_transactions_source_transaction(
          client :: ExOAPI.Client.t(),
          source_transaction :: String.t(),
          source :: String.t(),
          list(get_sources_source_source_transactions_source_transaction_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_sources_source_source_transactions_source_transaction(
        %ExOAPI.Client{} = client,
        source_transaction,
        source,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sources/{source}/source_transactions/{source_transaction}")
    |> ExOAPI.Client.replace_in_path("source_transaction", source_transaction)
    |> ExOAPI.Client.replace_in_path("source", source)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end