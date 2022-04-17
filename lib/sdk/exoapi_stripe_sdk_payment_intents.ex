defmodule ExOAPI.Stripe.SDK.PaymentIntents do
  @doc """
  **description**: <p>Manually reconcile the remaining amount for a customer_balance PaymentIntent.</p>

  <p>This can be used when the cash balance for <a href="docs/payments/customer-balance/reconciliation#cash-manual-reconciliation">a customer in manual reconciliation mode</a> received funds.</p>

  """

  @spec post_payment_intents_intent_apply_customer_balance(
          client :: ExOAPI.Client.t(),
          body ::
            %{:expand => [String.t()], :currency => String.t(), :amount => integer()} | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent_apply_customer_balance(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/apply_customer_balance")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for PaymentIntents you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_payment_intents_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_payment_intents_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_payment_intents_search_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :total_count => integer(),
               :object => String.t() | :search_result,
               :next_page => String.t(),
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.PaymentIntent.t()]
             }
           | map()}
          | {:error, any()}
  def get_payment_intents_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Verifies microdeposits on a PaymentIntent object.</p>

  """

  @spec post_payment_intents_intent_verify_microdeposits(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :expand => [String.t()],
              :descriptor_code => String.t(),
              :client_secret => String.t(),
              :amounts => [integer()]
            }
            | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent_verify_microdeposits(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/verify_microdeposits")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A PaymentIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_capture</code>, <code>requires_confirmation</code>, <code>requires_action</code>, or <code>processing</code>. </p>

  <p>Once canceled, no additional charges will be made by the PaymentIntent and any operations on the PaymentIntent will fail with an error. For PaymentIntents with <code>status=’requires_capture’</code>, the remaining <code>amount_capturable</code> will automatically be refunded. </p>

  <p>You cannot cancel the PaymentIntent for a Checkout Session. <a href="/docs/api/checkout/sessions/expire">Expire the Checkout Session</a> instead</p>

  """

  @spec post_payment_intents_intent_cancel(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :expand => [String.t()],
              :cancellation_reason =>
                String.t() | :abandoned | :duplicate | :fraudulent | :requested_by_customer
            }
            | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent_cancel(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a PaymentIntent object.</p>

  <p>After the PaymentIntent is created, attach a payment method and <a href="/docs/api/payment_intents/confirm">confirm</a>
  to continue the payment. You can read more about the different payment flows
  available via the Payment Intents API <a href="/docs/payments/payment-intents">here</a>.</p>

  <p>When <code>confirm=true</code> is used during creation, it is equivalent to creating
  and confirming the PaymentIntent in the same call. You may use any parameters
  available in the <a href="/docs/api/payment_intents/confirm">confirm API</a> when <code>confirm=true</code>
  is supplied.</p>

  """

  @spec post_payment_intents(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :use_stripe_sdk => boolean(),
              :transfer_group => String.t(),
              :transfer_data => %{:destination => String.t(), :amount => integer()},
              :statement_descriptor_suffix => String.t(),
              :statement_descriptor => String.t(),
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
              :setup_future_usage => String.t() | :off_session | :on_session,
              :return_url => String.t(),
              :receipt_email => String.t(),
              :payment_method_types => [String.t()],
              :payment_method_options => %{
                :wechat_pay =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :client => String.t() | :android | :ios | :web,
                      :app_id => String.t()
                    },
                :us_bank_account =>
                  String.t()
                  | %{
                      :verification_method => String.t() | :automatic | :instant | :microdeposits,
                      :setup_future_usage => String.t() | :none | :off_session | :on_session
                    },
                :sofort =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session,
                      :preferred_language => String.t() | :de | :en | :es | :fr | :it | :nl | :pl
                    },
                :sepa_debit =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :mandate_options => %{}
                    },
                :paynow => String.t() | %{:setup_future_usage => String.t() | :none},
                :p24 =>
                  String.t()
                  | %{
                      :tos_shown_and_accepted => boolean(),
                      :setup_future_usage => String.t() | :none
                    },
                :oxxo =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none, :expires_after_days => integer()},
                :konbini =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :product_description => String.t(),
                      :expires_at => String.t() | integer(),
                      :expires_after_days => String.t() | integer(),
                      :confirmation_number => String.t()
                    },
                :klarna =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :preferred_locale =>
                        String.t()
                        | :"da-DK"
                        | :"de-AT"
                        | :"de-DE"
                        | :"en-AT"
                        | :"en-BE"
                        | :"en-DE"
                        | :"en-DK"
                        | :"en-ES"
                        | :"en-FI"
                        | :"en-FR"
                        | :"en-GB"
                        | :"en-IE"
                        | :"en-IT"
                        | :"en-NL"
                        | :"en-NO"
                        | :"en-SE"
                        | :"en-US"
                        | :"es-ES"
                        | :"es-US"
                        | :"fi-FI"
                        | :"fr-BE"
                        | :"fr-FR"
                        | :"it-IT"
                        | :"nb-NO"
                        | :"nl-BE"
                        | :"nl-NL"
                        | :"sv-FI"
                        | :"sv-SE",
                      :capture_method => String.t() | :manual
                    },
                :interac_present => String.t() | %{},
                :ideal =>
                  String.t() | %{:setup_future_usage => String.t() | :none | :off_session},
                :grabpay => String.t() | %{:setup_future_usage => String.t() | :none},
                :giropay => String.t() | %{:setup_future_usage => String.t() | :none},
                :fpx => String.t() | %{:setup_future_usage => String.t() | :none},
                :eps => String.t() | %{:setup_future_usage => String.t() | :none},
                :customer_balance =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :funding_type => String.t() | :bank_transfer,
                      :bank_transfer => %{
                        :type => String.t() | :jp_bank_transfer,
                        :requested_address_types => [String.t() | :zengin]
                      }
                    },
                :card_present =>
                  String.t()
                  | %{
                      :request_incremental_authorization_support => boolean(),
                      :request_extended_authorization => boolean()
                    },
                :card =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :request_three_d_secure => String.t() | :any | :automatic,
                      :network =>
                        String.t()
                        | :amex
                        | :cartes_bancaires
                        | :diners
                        | :discover
                        | :interac
                        | :jcb
                        | :mastercard
                        | :unionpay
                        | :unknown
                        | :visa,
                      :mandate_options => %{
                        :supported_types => [String.t() | :india],
                        :start_date => integer(),
                        :reference => String.t(),
                        :interval_count => integer(),
                        :interval => String.t() | :day | :month | :sporadic | :week | :year,
                        :end_date => integer(),
                        :description => String.t(),
                        :amount_type => String.t() | :fixed | :maximum,
                        :amount => integer()
                      },
                      :installments => %{
                        :plan =>
                          String.t()
                          | %{
                              :type => String.t() | :fixed_count,
                              :interval => String.t() | :month,
                              :count => integer()
                            },
                        :enabled => boolean()
                      },
                      :cvc_token => String.t(),
                      :capture_method => String.t() | :manual
                    },
                :boleto =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :expires_after_days => integer()
                    },
                :bancontact =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session,
                      :preferred_language => String.t() | :de | :en | :fr | :nl
                    },
                :bacs_debit =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none | :off_session | :on_session},
                :au_becs_debit =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none | :off_session | :on_session},
                :alipay =>
                  String.t() | %{:setup_future_usage => String.t() | :none | :off_session},
                :afterpay_clearpay =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :reference => String.t(),
                      :capture_method => String.t() | :manual
                    },
                :acss_debit =>
                  String.t()
                  | %{
                      :verification_method => String.t() | :automatic | :instant | :microdeposits,
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :mandate_options => %{
                        :transaction_type => String.t() | :business | :personal,
                        :payment_schedule => String.t() | :combined | :interval | :sporadic,
                        :interval_description => String.t(),
                        :custom_mandate_url => String.t()
                      }
                    }
              },
              :payment_method_data => %{
                :wechat_pay => %{},
                :us_bank_account => %{
                  :routing_number => String.t(),
                  :account_type => String.t() | :checking | :savings,
                  :account_number => String.t(),
                  :account_holder_type => String.t() | :company | :individual
                },
                :type =>
                  String.t()
                  | :acss_debit
                  | :afterpay_clearpay
                  | :alipay
                  | :au_becs_debit
                  | :bacs_debit
                  | :bancontact
                  | :boleto
                  | :customer_balance
                  | :eps
                  | :fpx
                  | :giropay
                  | :grabpay
                  | :ideal
                  | :klarna
                  | :konbini
                  | :oxxo
                  | :p24
                  | :paynow
                  | :sepa_debit
                  | :sofort
                  | :us_bank_account
                  | :wechat_pay,
                :sofort => %{:country => String.t() | :AT | :BE | :DE | :ES | :IT | :NL},
                :sepa_debit => %{:iban => String.t()},
                :paynow => %{},
                :p24 => %{
                  :bank =>
                    String.t()
                    | :alior_bank
                    | :bank_millennium
                    | :bank_nowy_bfg_sa
                    | :bank_pekao_sa
                    | :banki_spbdzielcze
                    | :blik
                    | :bnp_paribas
                    | :boz
                    | :citi_handlowy
                    | :credit_agricole
                    | :envelobank
                    | :etransfer_pocztowy24
                    | :getin_bank
                    | :ideabank
                    | :ing
                    | :inteligo
                    | :mbank_mtransfer
                    | :nest_przelew
                    | :noble_pay
                    | :pbac_z_ipko
                    | :plus_bank
                    | :santander_przelew24
                    | :tmobile_usbugi_bankowe
                    | :toyota_bank
                    | :volkswagen_bank
                },
                :oxxo => %{},
                :metadata => map(),
                :konbini => %{},
                :klarna => %{
                  :dob => %{:year => integer(), :month => integer(), :day => integer()}
                },
                :interac_present => %{},
                :ideal => %{
                  :bank =>
                    String.t()
                    | :abn_amro
                    | :asn_bank
                    | :bunq
                    | :handelsbanken
                    | :ing
                    | :knab
                    | :moneyou
                    | :rabobank
                    | :regiobank
                    | :revolut
                    | :sns_bank
                    | :triodos_bank
                    | :van_lanschot
                },
                :grabpay => %{},
                :giropay => %{},
                :fpx => %{
                  :bank =>
                    String.t()
                    | :affin_bank
                    | :agrobank
                    | :alliance_bank
                    | :ambank
                    | :bank_islam
                    | :bank_muamalat
                    | :bank_rakyat
                    | :bsn
                    | :cimb
                    | :deutsche_bank
                    | :hong_leong_bank
                    | :hsbc
                    | :kfh
                    | :maybank2e
                    | :maybank2u
                    | :ocbc
                    | :pb_enterprise
                    | :public_bank
                    | :rhb
                    | :standard_chartered
                    | :uob
                },
                :eps => %{
                  :bank =>
                    String.t()
                    | :arzte_und_apotheker_bank
                    | :austrian_anadi_bank_ag
                    | :bank_austria
                    | :bankhaus_carl_spangler
                    | :bankhaus_schelhammer_und_schattera_ag
                    | :bawag_psk_ag
                    | :bks_bank_ag
                    | :brull_kallmus_bank_ag
                    | :btv_vier_lander_bank
                    | :capital_bank_grawe_gruppe_ag
                    | :dolomitenbank
                    | :easybank_ag
                    | :erste_bank_und_sparkassen
                    | :hypo_alpeadriabank_international_ag
                    | :hypo_bank_burgenland_aktiengesellschaft
                    | :hypo_noe_lb_fur_niederosterreich_u_wien
                    | :hypo_oberosterreich_salzburg_steiermark
                    | :hypo_tirol_bank_ag
                    | :hypo_vorarlberg_bank_ag
                    | :marchfelder_bank
                    | :oberbank_ag
                    | :raiffeisen_bankengruppe_osterreich
                    | :schoellerbank_ag
                    | :sparda_bank_wien
                    | :volksbank_gruppe
                    | :volkskreditbank_ag
                    | :vr_bank_braunau
                },
                :customer_balance => %{},
                :boleto => %{:tax_id => String.t()},
                :billing_details => %{
                  :phone => String.t(),
                  :name => String.t(),
                  :email => String.t(),
                  :address =>
                    String.t()
                    | %{
                        :state => String.t(),
                        :postal_code => String.t(),
                        :line2 => String.t(),
                        :line1 => String.t(),
                        :country => String.t(),
                        :city => String.t()
                      }
                },
                :bancontact => %{},
                :bacs_debit => %{:sort_code => String.t(), :account_number => String.t()},
                :au_becs_debit => %{:bsb_number => String.t(), :account_number => String.t()},
                :alipay => %{},
                :afterpay_clearpay => %{},
                :acss_debit => %{
                  :transit_number => String.t(),
                  :institution_number => String.t(),
                  :account_number => String.t()
                }
              },
              :payment_method => String.t(),
              :on_behalf_of => String.t(),
              :off_session => String.t() | :one_off | :recurring | boolean(),
              :metadata => map(),
              :mandate_data => %{
                :customer_acceptance => %{
                  :type => String.t() | :offline | :online,
                  :online => %{:user_agent => String.t(), :ip_address => String.t()},
                  :offline => %{},
                  :accepted_at => integer()
                }
              },
              :mandate => String.t(),
              :expand => [String.t()],
              :error_on_requires_action => boolean(),
              :description => String.t(),
              :customer => String.t(),
              :currency => String.t(),
              :confirmation_method => String.t() | :automatic | :manual,
              :confirm => boolean(),
              :capture_method => String.t() | :automatic | :manual,
              :automatic_payment_methods => %{:enabled => boolean()},
              :application_fee_amount => integer(),
              :amount => integer()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of PaymentIntents.</p>

  """
  @type get_payment_intents_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
  @spec get_payment_intents(client :: ExOAPI.Client.t(), list(get_payment_intents_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.PaymentIntent.t()]
             }
           | map()}
          | {:error, any()}
  def get_payment_intents(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates properties on a PaymentIntent object without confirming.</p>

  <p>Depending on which properties you update, you may need to confirm the
  PaymentIntent again. For example, updating the <code>payment_method</code> will
  always require you to confirm the PaymentIntent again. If you prefer to
  update and confirm at the same time, we recommend updating properties via
  the <a href="/docs/api/payment_intents/confirm">confirm API</a> instead.</p>

  """

  @spec post_payment_intents_intent(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_group => String.t(),
              :transfer_data => %{:amount => integer()},
              :statement_descriptor_suffix => String.t(),
              :statement_descriptor => String.t(),
              :shipping =>
                String.t()
                | %{
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
              :setup_future_usage => String.t() | :off_session | :on_session,
              :receipt_email => String.t(),
              :payment_method_types => [String.t()],
              :payment_method_options => %{
                :wechat_pay =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :client => String.t() | :android | :ios | :web,
                      :app_id => String.t()
                    },
                :us_bank_account =>
                  String.t()
                  | %{
                      :verification_method => String.t() | :automatic | :instant | :microdeposits,
                      :setup_future_usage => String.t() | :none | :off_session | :on_session
                    },
                :sofort =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session,
                      :preferred_language => String.t() | :de | :en | :es | :fr | :it | :nl | :pl
                    },
                :sepa_debit =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :mandate_options => %{}
                    },
                :paynow => String.t() | %{:setup_future_usage => String.t() | :none},
                :p24 =>
                  String.t()
                  | %{
                      :tos_shown_and_accepted => boolean(),
                      :setup_future_usage => String.t() | :none
                    },
                :oxxo =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none, :expires_after_days => integer()},
                :konbini =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :product_description => String.t(),
                      :expires_at => String.t() | integer(),
                      :expires_after_days => String.t() | integer(),
                      :confirmation_number => String.t()
                    },
                :klarna =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :preferred_locale =>
                        String.t()
                        | :"da-DK"
                        | :"de-AT"
                        | :"de-DE"
                        | :"en-AT"
                        | :"en-BE"
                        | :"en-DE"
                        | :"en-DK"
                        | :"en-ES"
                        | :"en-FI"
                        | :"en-FR"
                        | :"en-GB"
                        | :"en-IE"
                        | :"en-IT"
                        | :"en-NL"
                        | :"en-NO"
                        | :"en-SE"
                        | :"en-US"
                        | :"es-ES"
                        | :"es-US"
                        | :"fi-FI"
                        | :"fr-BE"
                        | :"fr-FR"
                        | :"it-IT"
                        | :"nb-NO"
                        | :"nl-BE"
                        | :"nl-NL"
                        | :"sv-FI"
                        | :"sv-SE",
                      :capture_method => String.t() | :manual
                    },
                :interac_present => String.t() | %{},
                :ideal =>
                  String.t() | %{:setup_future_usage => String.t() | :none | :off_session},
                :grabpay => String.t() | %{:setup_future_usage => String.t() | :none},
                :giropay => String.t() | %{:setup_future_usage => String.t() | :none},
                :fpx => String.t() | %{:setup_future_usage => String.t() | :none},
                :eps => String.t() | %{:setup_future_usage => String.t() | :none},
                :customer_balance =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :funding_type => String.t() | :bank_transfer,
                      :bank_transfer => %{
                        :type => String.t() | :jp_bank_transfer,
                        :requested_address_types => [String.t() | :zengin]
                      }
                    },
                :card_present =>
                  String.t()
                  | %{
                      :request_incremental_authorization_support => boolean(),
                      :request_extended_authorization => boolean()
                    },
                :card =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :request_three_d_secure => String.t() | :any | :automatic,
                      :network =>
                        String.t()
                        | :amex
                        | :cartes_bancaires
                        | :diners
                        | :discover
                        | :interac
                        | :jcb
                        | :mastercard
                        | :unionpay
                        | :unknown
                        | :visa,
                      :mandate_options => %{
                        :supported_types => [String.t() | :india],
                        :start_date => integer(),
                        :reference => String.t(),
                        :interval_count => integer(),
                        :interval => String.t() | :day | :month | :sporadic | :week | :year,
                        :end_date => integer(),
                        :description => String.t(),
                        :amount_type => String.t() | :fixed | :maximum,
                        :amount => integer()
                      },
                      :installments => %{
                        :plan =>
                          String.t()
                          | %{
                              :type => String.t() | :fixed_count,
                              :interval => String.t() | :month,
                              :count => integer()
                            },
                        :enabled => boolean()
                      },
                      :cvc_token => String.t(),
                      :capture_method => String.t() | :manual
                    },
                :boleto =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :expires_after_days => integer()
                    },
                :bancontact =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session,
                      :preferred_language => String.t() | :de | :en | :fr | :nl
                    },
                :bacs_debit =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none | :off_session | :on_session},
                :au_becs_debit =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none | :off_session | :on_session},
                :alipay =>
                  String.t() | %{:setup_future_usage => String.t() | :none | :off_session},
                :afterpay_clearpay =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :reference => String.t(),
                      :capture_method => String.t() | :manual
                    },
                :acss_debit =>
                  String.t()
                  | %{
                      :verification_method => String.t() | :automatic | :instant | :microdeposits,
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :mandate_options => %{
                        :transaction_type => String.t() | :business | :personal,
                        :payment_schedule => String.t() | :combined | :interval | :sporadic,
                        :interval_description => String.t(),
                        :custom_mandate_url => String.t()
                      }
                    }
              },
              :payment_method_data => %{
                :wechat_pay => %{},
                :us_bank_account => %{
                  :routing_number => String.t(),
                  :account_type => String.t() | :checking | :savings,
                  :account_number => String.t(),
                  :account_holder_type => String.t() | :company | :individual
                },
                :type =>
                  String.t()
                  | :acss_debit
                  | :afterpay_clearpay
                  | :alipay
                  | :au_becs_debit
                  | :bacs_debit
                  | :bancontact
                  | :boleto
                  | :customer_balance
                  | :eps
                  | :fpx
                  | :giropay
                  | :grabpay
                  | :ideal
                  | :klarna
                  | :konbini
                  | :oxxo
                  | :p24
                  | :paynow
                  | :sepa_debit
                  | :sofort
                  | :us_bank_account
                  | :wechat_pay,
                :sofort => %{:country => String.t() | :AT | :BE | :DE | :ES | :IT | :NL},
                :sepa_debit => %{:iban => String.t()},
                :paynow => %{},
                :p24 => %{
                  :bank =>
                    String.t()
                    | :alior_bank
                    | :bank_millennium
                    | :bank_nowy_bfg_sa
                    | :bank_pekao_sa
                    | :banki_spbdzielcze
                    | :blik
                    | :bnp_paribas
                    | :boz
                    | :citi_handlowy
                    | :credit_agricole
                    | :envelobank
                    | :etransfer_pocztowy24
                    | :getin_bank
                    | :ideabank
                    | :ing
                    | :inteligo
                    | :mbank_mtransfer
                    | :nest_przelew
                    | :noble_pay
                    | :pbac_z_ipko
                    | :plus_bank
                    | :santander_przelew24
                    | :tmobile_usbugi_bankowe
                    | :toyota_bank
                    | :volkswagen_bank
                },
                :oxxo => %{},
                :metadata => map(),
                :konbini => %{},
                :klarna => %{
                  :dob => %{:year => integer(), :month => integer(), :day => integer()}
                },
                :interac_present => %{},
                :ideal => %{
                  :bank =>
                    String.t()
                    | :abn_amro
                    | :asn_bank
                    | :bunq
                    | :handelsbanken
                    | :ing
                    | :knab
                    | :moneyou
                    | :rabobank
                    | :regiobank
                    | :revolut
                    | :sns_bank
                    | :triodos_bank
                    | :van_lanschot
                },
                :grabpay => %{},
                :giropay => %{},
                :fpx => %{
                  :bank =>
                    String.t()
                    | :affin_bank
                    | :agrobank
                    | :alliance_bank
                    | :ambank
                    | :bank_islam
                    | :bank_muamalat
                    | :bank_rakyat
                    | :bsn
                    | :cimb
                    | :deutsche_bank
                    | :hong_leong_bank
                    | :hsbc
                    | :kfh
                    | :maybank2e
                    | :maybank2u
                    | :ocbc
                    | :pb_enterprise
                    | :public_bank
                    | :rhb
                    | :standard_chartered
                    | :uob
                },
                :eps => %{
                  :bank =>
                    String.t()
                    | :arzte_und_apotheker_bank
                    | :austrian_anadi_bank_ag
                    | :bank_austria
                    | :bankhaus_carl_spangler
                    | :bankhaus_schelhammer_und_schattera_ag
                    | :bawag_psk_ag
                    | :bks_bank_ag
                    | :brull_kallmus_bank_ag
                    | :btv_vier_lander_bank
                    | :capital_bank_grawe_gruppe_ag
                    | :dolomitenbank
                    | :easybank_ag
                    | :erste_bank_und_sparkassen
                    | :hypo_alpeadriabank_international_ag
                    | :hypo_bank_burgenland_aktiengesellschaft
                    | :hypo_noe_lb_fur_niederosterreich_u_wien
                    | :hypo_oberosterreich_salzburg_steiermark
                    | :hypo_tirol_bank_ag
                    | :hypo_vorarlberg_bank_ag
                    | :marchfelder_bank
                    | :oberbank_ag
                    | :raiffeisen_bankengruppe_osterreich
                    | :schoellerbank_ag
                    | :sparda_bank_wien
                    | :volksbank_gruppe
                    | :volkskreditbank_ag
                    | :vr_bank_braunau
                },
                :customer_balance => %{},
                :boleto => %{:tax_id => String.t()},
                :billing_details => %{
                  :phone => String.t(),
                  :name => String.t(),
                  :email => String.t(),
                  :address =>
                    String.t()
                    | %{
                        :state => String.t(),
                        :postal_code => String.t(),
                        :line2 => String.t(),
                        :line1 => String.t(),
                        :country => String.t(),
                        :city => String.t()
                      }
                },
                :bancontact => %{},
                :bacs_debit => %{:sort_code => String.t(), :account_number => String.t()},
                :au_becs_debit => %{:bsb_number => String.t(), :account_number => String.t()},
                :alipay => %{},
                :afterpay_clearpay => %{},
                :acss_debit => %{
                  :transit_number => String.t(),
                  :institution_number => String.t(),
                  :account_number => String.t()
                }
              },
              :payment_method => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :description => String.t(),
              :customer => String.t(),
              :currency => String.t(),
              :application_fee_amount => String.t() | integer(),
              :amount => integer()
            }
            | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of a PaymentIntent that has previously been created. </p>

  <p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string. </p>

  <p>When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#payment_intent_object">payment intent</a> object reference for more details.</p>

  """
  @type get_payment_intents_intent_opts :: {:expand, String.t()} | {:client_secret, String.t()}
  @spec get_payment_intents_intent(
          client :: ExOAPI.Client.t(),
          intent :: String.t(),
          list(get_payment_intents_intent_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def get_payment_intents_intent(%ExOAPI.Client{} = client, intent, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}")
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true},
      {:client_secret, "client_secret", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Perform an incremental authorization on an eligible
  <a href="/docs/api/payment_intents/object">PaymentIntent</a>. To be eligible, the
  PaymentIntent’s status must be <code>requires_capture</code> and
  <a href="/docs/api/charges/object#charge_object-payment_method_details-card_present-incremental_authorization_supported">incremental_authorization_supported</a>
  must be <code>true</code>.</p>

  <p>Incremental authorizations attempt to increase the authorized amount on
  your customer’s card to the new, higher <code>amount</code> provided. As with the
  initial authorization, incremental authorizations may be declined. A
  single PaymentIntent can call this endpoint multiple times to further
  increase the authorized amount.</p>

  <p>If the incremental authorization succeeds, the PaymentIntent object is
  returned with the updated
  <a href="/docs/api/payment_intents/object#payment_intent_object-amount">amount</a>.
  If the incremental authorization fails, a
  <a href="/docs/error-codes#card-declined">card_declined</a> error is returned, and no
  fields on the PaymentIntent or Charge are updated. The PaymentIntent
  object remains capturable for the previously authorized amount.</p>

  <p>Each PaymentIntent can have a maximum of 10 incremental authorization attempts, including declines.
  Once captured, a PaymentIntent can no longer be incremented.</p>

  <p>Learn more about <a href="/docs/terminal/features/incremental-authorizations">incremental authorizations</a>.</p>

  """

  @spec post_payment_intents_intent_increment_authorization(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data => %{:amount => integer()},
              :metadata => map(),
              :expand => [String.t()],
              :description => String.t(),
              :application_fee_amount => integer(),
              :amount => integer()
            }
            | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent_increment_authorization(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/increment_authorization")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Capture the funds of an existing uncaptured PaymentIntent when its status is <code>requires_capture</code>.</p>

  <p>Uncaptured PaymentIntents will be canceled a set number of days after they are created (7 by default).</p>

  <p>Learn more about <a href="/docs/payments/capture-later">separate authorization and capture</a>.</p>

  """

  @spec post_payment_intents_intent_capture(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data => %{:amount => integer()},
              :statement_descriptor_suffix => String.t(),
              :statement_descriptor => String.t(),
              :expand => [String.t()],
              :application_fee_amount => integer(),
              :amount_to_capture => integer()
            }
            | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent_capture(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/capture")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Confirm that your customer intends to pay with current or provided
  payment method. Upon confirmation, the PaymentIntent will attempt to initiate
  a payment.</p>

  <p>If the selected payment method requires additional authentication steps, the
  PaymentIntent will transition to the <code>requires_action</code> status and
  suggest additional actions via <code>next_action</code>. If payment fails,
  the PaymentIntent will transition to the <code>requires_payment_method</code> status. If
  payment succeeds, the PaymentIntent will transition to the <code>succeeded</code>
  status (or <code>requires_capture</code>, if <code>capture_method</code> is set to <code>manual</code>).</p>

  <p>If the <code>confirmation_method</code> is <code>automatic</code>, payment may be attempted
  using our <a href="/docs/stripe-js/reference#stripe-handle-card-payment">client SDKs</a>
  and the PaymentIntent’s <a href="#payment_intent_object-client_secret">client_secret</a>.
  After <code>next_action</code>s are handled by the client, no additional
  confirmation is required to complete the payment.</p>

  <p>If the <code>confirmation_method</code> is <code>manual</code>, all payment attempts must be
  initiated using a secret key.
  If any actions are required for the payment, the PaymentIntent will
  return to the <code>requires_confirmation</code> state
  after those actions are completed. Your server needs to then
  explicitly re-confirm the PaymentIntent to initiate the next payment
  attempt. Read the <a href="/docs/payments/payment-intents/web-manual">expanded documentation</a>
  to learn more about manual confirmation.</p>

  """

  @spec post_payment_intents_intent_confirm(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :use_stripe_sdk => boolean(),
              :shipping =>
                String.t()
                | %{
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
              :setup_future_usage => String.t() | :off_session | :on_session,
              :return_url => String.t(),
              :receipt_email => String.t(),
              :payment_method_types => [String.t()],
              :payment_method_options => %{
                :wechat_pay =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :client => String.t() | :android | :ios | :web,
                      :app_id => String.t()
                    },
                :us_bank_account =>
                  String.t()
                  | %{
                      :verification_method => String.t() | :automatic | :instant | :microdeposits,
                      :setup_future_usage => String.t() | :none | :off_session | :on_session
                    },
                :sofort =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session,
                      :preferred_language => String.t() | :de | :en | :es | :fr | :it | :nl | :pl
                    },
                :sepa_debit =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :mandate_options => %{}
                    },
                :paynow => String.t() | %{:setup_future_usage => String.t() | :none},
                :p24 =>
                  String.t()
                  | %{
                      :tos_shown_and_accepted => boolean(),
                      :setup_future_usage => String.t() | :none
                    },
                :oxxo =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none, :expires_after_days => integer()},
                :konbini =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :product_description => String.t(),
                      :expires_at => String.t() | integer(),
                      :expires_after_days => String.t() | integer(),
                      :confirmation_number => String.t()
                    },
                :klarna =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :preferred_locale =>
                        String.t()
                        | :"da-DK"
                        | :"de-AT"
                        | :"de-DE"
                        | :"en-AT"
                        | :"en-BE"
                        | :"en-DE"
                        | :"en-DK"
                        | :"en-ES"
                        | :"en-FI"
                        | :"en-FR"
                        | :"en-GB"
                        | :"en-IE"
                        | :"en-IT"
                        | :"en-NL"
                        | :"en-NO"
                        | :"en-SE"
                        | :"en-US"
                        | :"es-ES"
                        | :"es-US"
                        | :"fi-FI"
                        | :"fr-BE"
                        | :"fr-FR"
                        | :"it-IT"
                        | :"nb-NO"
                        | :"nl-BE"
                        | :"nl-NL"
                        | :"sv-FI"
                        | :"sv-SE",
                      :capture_method => String.t() | :manual
                    },
                :interac_present => String.t() | %{},
                :ideal =>
                  String.t() | %{:setup_future_usage => String.t() | :none | :off_session},
                :grabpay => String.t() | %{:setup_future_usage => String.t() | :none},
                :giropay => String.t() | %{:setup_future_usage => String.t() | :none},
                :fpx => String.t() | %{:setup_future_usage => String.t() | :none},
                :eps => String.t() | %{:setup_future_usage => String.t() | :none},
                :customer_balance =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :funding_type => String.t() | :bank_transfer,
                      :bank_transfer => %{
                        :type => String.t() | :jp_bank_transfer,
                        :requested_address_types => [String.t() | :zengin]
                      }
                    },
                :card_present =>
                  String.t()
                  | %{
                      :request_incremental_authorization_support => boolean(),
                      :request_extended_authorization => boolean()
                    },
                :card =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :request_three_d_secure => String.t() | :any | :automatic,
                      :network =>
                        String.t()
                        | :amex
                        | :cartes_bancaires
                        | :diners
                        | :discover
                        | :interac
                        | :jcb
                        | :mastercard
                        | :unionpay
                        | :unknown
                        | :visa,
                      :mandate_options => %{
                        :supported_types => [String.t() | :india],
                        :start_date => integer(),
                        :reference => String.t(),
                        :interval_count => integer(),
                        :interval => String.t() | :day | :month | :sporadic | :week | :year,
                        :end_date => integer(),
                        :description => String.t(),
                        :amount_type => String.t() | :fixed | :maximum,
                        :amount => integer()
                      },
                      :installments => %{
                        :plan =>
                          String.t()
                          | %{
                              :type => String.t() | :fixed_count,
                              :interval => String.t() | :month,
                              :count => integer()
                            },
                        :enabled => boolean()
                      },
                      :cvc_token => String.t(),
                      :capture_method => String.t() | :manual
                    },
                :boleto =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :expires_after_days => integer()
                    },
                :bancontact =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none | :off_session,
                      :preferred_language => String.t() | :de | :en | :fr | :nl
                    },
                :bacs_debit =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none | :off_session | :on_session},
                :au_becs_debit =>
                  String.t()
                  | %{:setup_future_usage => String.t() | :none | :off_session | :on_session},
                :alipay =>
                  String.t() | %{:setup_future_usage => String.t() | :none | :off_session},
                :afterpay_clearpay =>
                  String.t()
                  | %{
                      :setup_future_usage => String.t() | :none,
                      :reference => String.t(),
                      :capture_method => String.t() | :manual
                    },
                :acss_debit =>
                  String.t()
                  | %{
                      :verification_method => String.t() | :automatic | :instant | :microdeposits,
                      :setup_future_usage => String.t() | :none | :off_session | :on_session,
                      :mandate_options => %{
                        :transaction_type => String.t() | :business | :personal,
                        :payment_schedule => String.t() | :combined | :interval | :sporadic,
                        :interval_description => String.t(),
                        :custom_mandate_url => String.t()
                      }
                    }
              },
              :payment_method_data => %{
                :wechat_pay => %{},
                :us_bank_account => %{
                  :routing_number => String.t(),
                  :account_type => String.t() | :checking | :savings,
                  :account_number => String.t(),
                  :account_holder_type => String.t() | :company | :individual
                },
                :type =>
                  String.t()
                  | :acss_debit
                  | :afterpay_clearpay
                  | :alipay
                  | :au_becs_debit
                  | :bacs_debit
                  | :bancontact
                  | :boleto
                  | :customer_balance
                  | :eps
                  | :fpx
                  | :giropay
                  | :grabpay
                  | :ideal
                  | :klarna
                  | :konbini
                  | :oxxo
                  | :p24
                  | :paynow
                  | :sepa_debit
                  | :sofort
                  | :us_bank_account
                  | :wechat_pay,
                :sofort => %{:country => String.t() | :AT | :BE | :DE | :ES | :IT | :NL},
                :sepa_debit => %{:iban => String.t()},
                :paynow => %{},
                :p24 => %{
                  :bank =>
                    String.t()
                    | :alior_bank
                    | :bank_millennium
                    | :bank_nowy_bfg_sa
                    | :bank_pekao_sa
                    | :banki_spbdzielcze
                    | :blik
                    | :bnp_paribas
                    | :boz
                    | :citi_handlowy
                    | :credit_agricole
                    | :envelobank
                    | :etransfer_pocztowy24
                    | :getin_bank
                    | :ideabank
                    | :ing
                    | :inteligo
                    | :mbank_mtransfer
                    | :nest_przelew
                    | :noble_pay
                    | :pbac_z_ipko
                    | :plus_bank
                    | :santander_przelew24
                    | :tmobile_usbugi_bankowe
                    | :toyota_bank
                    | :volkswagen_bank
                },
                :oxxo => %{},
                :metadata => map(),
                :konbini => %{},
                :klarna => %{
                  :dob => %{:year => integer(), :month => integer(), :day => integer()}
                },
                :interac_present => %{},
                :ideal => %{
                  :bank =>
                    String.t()
                    | :abn_amro
                    | :asn_bank
                    | :bunq
                    | :handelsbanken
                    | :ing
                    | :knab
                    | :moneyou
                    | :rabobank
                    | :regiobank
                    | :revolut
                    | :sns_bank
                    | :triodos_bank
                    | :van_lanschot
                },
                :grabpay => %{},
                :giropay => %{},
                :fpx => %{
                  :bank =>
                    String.t()
                    | :affin_bank
                    | :agrobank
                    | :alliance_bank
                    | :ambank
                    | :bank_islam
                    | :bank_muamalat
                    | :bank_rakyat
                    | :bsn
                    | :cimb
                    | :deutsche_bank
                    | :hong_leong_bank
                    | :hsbc
                    | :kfh
                    | :maybank2e
                    | :maybank2u
                    | :ocbc
                    | :pb_enterprise
                    | :public_bank
                    | :rhb
                    | :standard_chartered
                    | :uob
                },
                :eps => %{
                  :bank =>
                    String.t()
                    | :arzte_und_apotheker_bank
                    | :austrian_anadi_bank_ag
                    | :bank_austria
                    | :bankhaus_carl_spangler
                    | :bankhaus_schelhammer_und_schattera_ag
                    | :bawag_psk_ag
                    | :bks_bank_ag
                    | :brull_kallmus_bank_ag
                    | :btv_vier_lander_bank
                    | :capital_bank_grawe_gruppe_ag
                    | :dolomitenbank
                    | :easybank_ag
                    | :erste_bank_und_sparkassen
                    | :hypo_alpeadriabank_international_ag
                    | :hypo_bank_burgenland_aktiengesellschaft
                    | :hypo_noe_lb_fur_niederosterreich_u_wien
                    | :hypo_oberosterreich_salzburg_steiermark
                    | :hypo_tirol_bank_ag
                    | :hypo_vorarlberg_bank_ag
                    | :marchfelder_bank
                    | :oberbank_ag
                    | :raiffeisen_bankengruppe_osterreich
                    | :schoellerbank_ag
                    | :sparda_bank_wien
                    | :volksbank_gruppe
                    | :volkskreditbank_ag
                    | :vr_bank_braunau
                },
                :customer_balance => %{},
                :boleto => %{:tax_id => String.t()},
                :billing_details => %{
                  :phone => String.t(),
                  :name => String.t(),
                  :email => String.t(),
                  :address =>
                    String.t()
                    | %{
                        :state => String.t(),
                        :postal_code => String.t(),
                        :line2 => String.t(),
                        :line1 => String.t(),
                        :country => String.t(),
                        :city => String.t()
                      }
                },
                :bancontact => %{},
                :bacs_debit => %{:sort_code => String.t(), :account_number => String.t()},
                :au_becs_debit => %{:bsb_number => String.t(), :account_number => String.t()},
                :alipay => %{},
                :afterpay_clearpay => %{},
                :acss_debit => %{
                  :transit_number => String.t(),
                  :institution_number => String.t(),
                  :account_number => String.t()
                }
              },
              :payment_method => String.t(),
              :off_session => String.t() | :one_off | :recurring | boolean(),
              :mandate_data =>
                %{
                  :customer_acceptance => %{
                    :type => String.t() | :online,
                    :online => %{:user_agent => String.t(), :ip_address => String.t()}
                  }
                }
                | %{
                    :customer_acceptance => %{
                      :type => String.t() | :offline | :online,
                      :online => %{:user_agent => String.t(), :ip_address => String.t()},
                      :offline => %{},
                      :accepted_at => integer()
                    }
                  },
              :mandate => String.t(),
              :expand => [String.t()],
              :error_on_requires_action => boolean(),
              :client_secret => String.t()
            }
            | map(),
          intent :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentIntent.t() | map()}
          | {:error, any()}
  def post_payment_intents_intent_confirm(%ExOAPI.Client{} = client, body, intent) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_intents/{intent}/confirm")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("intent", intent)
    |> ExOAPI.Client.request()
  end
end