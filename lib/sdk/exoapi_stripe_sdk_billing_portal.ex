defmodule ExOAPI.Stripe.SDK.BillingPortal do
  @doc """
  **description**: <p>Updates a configuration that describes the functionality of the customer portal.</p>

  """

  @spec post_billing_portal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :features => %{
                :subscription_update => %{
                  :proration_behavior =>
                    String.t() | :always_invoice | :create_prorations | :none,
                  :products => String.t() | [%{:product => String.t(), :prices => [String.t()]}],
                  :enabled => boolean(),
                  :default_allowed_updates =>
                    String.t() | [String.t() | :price | :promotion_code | :quantity]
                },
                :subscription_pause => %{:enabled => boolean()},
                :subscription_cancel => %{
                  :proration_behavior =>
                    String.t() | :always_invoice | :create_prorations | :none,
                  :mode => String.t() | :at_period_end | :immediately,
                  :enabled => boolean(),
                  :cancellation_reason => %{
                    :options =>
                      String.t()
                      | [
                          String.t()
                          | :customer_service
                          | :low_quality
                          | :missing_features
                          | :other
                          | :switched_service
                          | :too_complex
                          | :too_expensive
                          | :unused
                        ],
                    :enabled => boolean()
                  }
                },
                :payment_method_update => %{:enabled => boolean()},
                :invoice_history => %{:enabled => boolean()},
                :customer_update => %{
                  :enabled => boolean(),
                  :allowed_updates =>
                    String.t() | [String.t() | :address | :email | :phone | :shipping | :tax_id]
                }
              },
              :expand => [String.t()],
              :default_return_url => String.t(),
              :business_profile => %{
                :terms_of_service_url => String.t(),
                :privacy_policy_url => String.t(),
                :headline => String.t()
              },
              :active => boolean()
            }
            | map(),
          configuration :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.BillingPortal_configuration.t()
           | map()}
          | {:error, any()}
  def post_billing_portal_configurations_configuration(
        %ExOAPI.Client{} = client,
        body,
        configuration
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations/{configuration}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a configuration that describes the functionality of the customer portal.</p>

  """
  @type get_billing_portal_configurations_configuration_opts :: {:expand, String.t()}
  @spec get_billing_portal_configurations_configuration(
          client :: ExOAPI.Client.t(),
          configuration :: String.t(),
          list(get_billing_portal_configurations_configuration_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.BillingPortal_configuration.t()
           | map()}
          | {:error, any()}
  def get_billing_portal_configurations_configuration(
        %ExOAPI.Client{} = client,
        configuration,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations/{configuration}")
    |> ExOAPI.Client.replace_in_path("configuration", configuration)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a configuration that describes the functionality and behavior of a PortalSession</p>

  """

  @spec post_billing_portal_configurations(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => map(),
              :features => %{
                :subscription_update => %{
                  :proration_behavior =>
                    String.t() | :always_invoice | :create_prorations | :none,
                  :products => String.t() | [%{:product => String.t(), :prices => [String.t()]}],
                  :enabled => boolean(),
                  :default_allowed_updates =>
                    String.t() | [String.t() | :price | :promotion_code | :quantity]
                },
                :subscription_pause => %{:enabled => boolean()},
                :subscription_cancel => %{
                  :proration_behavior =>
                    String.t() | :always_invoice | :create_prorations | :none,
                  :mode => String.t() | :at_period_end | :immediately,
                  :enabled => boolean(),
                  :cancellation_reason => %{
                    :options =>
                      String.t()
                      | [
                          String.t()
                          | :customer_service
                          | :low_quality
                          | :missing_features
                          | :other
                          | :switched_service
                          | :too_complex
                          | :too_expensive
                          | :unused
                        ],
                    :enabled => boolean()
                  }
                },
                :payment_method_update => %{:enabled => boolean()},
                :invoice_history => %{:enabled => boolean()},
                :customer_update => %{
                  :enabled => boolean(),
                  :allowed_updates =>
                    String.t() | [String.t() | :address | :email | :phone | :shipping | :tax_id]
                }
              },
              :expand => [String.t()],
              :default_return_url => String.t(),
              :business_profile => %{
                :terms_of_service_url => String.t(),
                :privacy_policy_url => String.t(),
                :headline => String.t()
              }
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.BillingPortal_configuration.t()
           | map()}
          | {:error, any()}
  def post_billing_portal_configurations(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of configurations that describe the functionality of the customer portal.</p>

  """
  @type get_billing_portal_configurations_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:is_default, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:active, String.t()}
  @spec get_billing_portal_configurations(
          client :: ExOAPI.Client.t(),
          list(get_billing_portal_configurations_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.BillingPortal_configuration.t()]
             }
           | map()}
          | {:error, any()}
  def get_billing_portal_configurations(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/configurations")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:is_default, "is_default", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a session of the customer portal.</p>

  """

  @spec post_billing_portal_sessions(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :return_url => String.t(),
              :on_behalf_of => String.t(),
              :locale =>
                String.t()
                | :auto
                | :bg
                | :cs
                | :da
                | :de
                | :el
                | :en
                | :"en-AU"
                | :"en-CA"
                | :"en-GB"
                | :"en-IE"
                | :"en-IN"
                | :"en-NZ"
                | :"en-SG"
                | :es
                | :"es-419"
                | :et
                | :fi
                | :fil
                | :fr
                | :"fr-CA"
                | :hr
                | :hu
                | :id
                | :it
                | :ja
                | :ko
                | :lt
                | :lv
                | :ms
                | :mt
                | :nb
                | :nl
                | :pl
                | :pt
                | :"pt-BR"
                | :ro
                | :ru
                | :sk
                | :sl
                | :sv
                | :th
                | :tr
                | :vi
                | :zh
                | :"zh-HK"
                | :"zh-TW",
              :expand => [String.t()],
              :customer => String.t(),
              :configuration => String.t()
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.BillingPortal_session.t()
           | map()}
          | {:error, any()}
  def post_billing_portal_sessions(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/billing_portal/sessions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end