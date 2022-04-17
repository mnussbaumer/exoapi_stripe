defmodule ExOAPI.Stripe.SDK.PaymentMethods do
  @doc """
  **description**: <p>Creates a PaymentMethod object. Read the <a href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn how to create PaymentMethods via Stripe.js.</p>

  <p>Instead of creating a PaymentMethod directly, we recommend using the <a href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method details ahead of a future payment.</p>

  """

  @spec post_payment_methods(
          client :: ExOAPI.Client.t(),
          body ::
            %{
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
                | :card
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
              :payment_method => String.t(),
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
              :klarna => %{:dob => %{:year => integer(), :month => integer(), :day => integer()}},
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
              :expand => [String.t()],
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
              :customer => String.t(),
              :card =>
                %{:token => String.t()}
                | %{
                    :number => String.t(),
                    :exp_year => integer(),
                    :exp_month => integer(),
                    :cvc => String.t()
                  },
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
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentMethod.t() | map()}
          | {:error, any()}
  def post_payment_methods(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of PaymentMethods. For listing a customer’s payment methods, you should use <a href="/docs/api/payment_methods/customer_list">List a Customer’s PaymentMethods</a></p>

  """
  @type get_payment_methods_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
  @spec get_payment_methods(
          client :: ExOAPI.Client.t(),
          type :: String.t(),
          list(get_payment_methods_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.PaymentMethod.t()]
             }
           | map()}
          | {:error, any()}
  def get_payment_methods(%ExOAPI.Client{} = client, type, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods")
    |> ExOAPI.Client.add_query("type", type)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Attaches a PaymentMethod object to a Customer.</p>

  <p>To attach a new PaymentMethod to a customer for future payments, we recommend you use a <a href="/docs/api/setup_intents">SetupIntent</a>
  or a PaymentIntent with <a href="/docs/api/payment_intents/create#create_payment_intent-setup_future_usage">setup_future_usage</a>.
  These approaches will perform any necessary steps to ensure that the PaymentMethod can be used in a future payment. Using the
  <code>/v1/payment_methods/:id/attach</code> endpoint does not ensure that future payments can be made with the attached PaymentMethod.
  See <a href="/docs/payments/payment-intents#future-usage">Optimizing cards for future payments</a> for more information about setting up future payments.</p>

  <p>To use this PaymentMethod as the default for invoice or subscription payments,
  set <a href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code>invoice_settings.default_payment_method</code></a>,
  on the Customer to the PaymentMethod’s ID.</p>

  """

  @spec post_payment_methods_payment_method_attach(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()], :customer => String.t()} | map(),
          payment_method :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentMethod.t() | map()}
          | {:error, any()}
  def post_payment_methods_payment_method_attach(%ExOAPI.Client{} = client, body, payment_method) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}/attach")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.</p>

  """

  @spec post_payment_methods_payment_method(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :us_bank_account => %{:account_holder_type => String.t() | :company | :individual},
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :card => %{:exp_year => integer(), :exp_month => integer()},
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
              }
            }
            | map(),
          payment_method :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentMethod.t() | map()}
          | {:error, any()}
  def post_payment_methods_payment_method(%ExOAPI.Client{} = client, body, payment_method) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a PaymentMethod object.</p>

  """
  @type get_payment_methods_payment_method_opts :: {:expand, String.t()}
  @spec get_payment_methods_payment_method(
          client :: ExOAPI.Client.t(),
          payment_method :: String.t(),
          list(get_payment_methods_payment_method_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentMethod.t() | map()}
          | {:error, any()}
  def get_payment_methods_payment_method(%ExOAPI.Client{} = client, payment_method, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}")
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Detaches a PaymentMethod object from a Customer. After a PaymentMethod is detached, it can no longer be used for a payment or re-attached to a Customer.</p>

  """

  @spec post_payment_methods_payment_method_detach(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          payment_method :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentMethod.t() | map()}
          | {:error, any()}
  def post_payment_methods_payment_method_detach(%ExOAPI.Client{} = client, body, payment_method) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_methods/{payment_method}/detach")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_method", payment_method)
    |> ExOAPI.Client.request()
  end
end