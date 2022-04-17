defmodule ExOAPI.Stripe.SDK.Checkout do
  @doc """
  **description**: <p>A Session can be expired when it is in one of these statuses: <code>open</code> </p>

  <p>After it expires, a customer can’t complete a Session and customers loading the Session see a message saying the Session is expired.</p>

  """

  @spec post_checkout_sessions_session_expire(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          session :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Checkout_session.t() | map()}
          | {:error, any()}
  def post_checkout_sessions_session_expire(%ExOAPI.Client{} = client, body, session) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions/{session}/expire")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving a Checkout Session, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_checkout_sessions_session_line_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_checkout_sessions_session_line_items(
          client :: ExOAPI.Client.t(),
          session :: String.t(),
          list(get_checkout_sessions_session_line_items_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Item.t()]
             }
           | map()}
          | {:error, any()}
  def get_checkout_sessions_session_line_items(%ExOAPI.Client{} = client, session, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions/{session}/line_items")
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a Session object.</p>

  """

  @spec post_checkout_sessions(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :tax_id_collection => %{:enabled => boolean()},
              :success_url => String.t(),
              :subscription_data => %{
                :trial_period_days => integer(),
                :trial_end => integer(),
                :transfer_data => %{:destination => String.t(), :amount_percent => number()},
                :metadata => map(),
                :items => [
                  %{:tax_rates => [String.t()], :quantity => integer(), :plan => String.t()}
                ],
                :default_tax_rates => [String.t()],
                :application_fee_percent => number()
              },
              :submit_type => String.t() | :auto | :book | :donate | :pay,
              :shipping_options => [
                %{
                  :shipping_rate_data => %{
                    :type => String.t() | :fixed_amount,
                    :tax_code => String.t(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :metadata => map(),
                    :fixed_amount => %{:currency => String.t(), :amount => integer()},
                    :display_name => String.t(),
                    :delivery_estimate => %{
                      :minimum => %{
                        :value => integer(),
                        :unit => String.t() | :business_day | :day | :hour | :month | :week
                      },
                      :maximum => %{
                        :value => integer(),
                        :unit => String.t() | :business_day | :day | :hour | :month | :week
                      }
                    }
                  },
                  :shipping_rate => String.t()
                }
              ],
              :shipping_address_collection => %{
                :allowed_countries => [
                  String.t()
                  | :AC
                  | :AD
                  | :AE
                  | :AF
                  | :AG
                  | :AI
                  | :AL
                  | :AM
                  | :AO
                  | :AQ
                  | :AR
                  | :AT
                  | :AU
                  | :AW
                  | :AX
                  | :AZ
                  | :BA
                  | :BB
                  | :BD
                  | :BE
                  | :BF
                  | :BG
                  | :BH
                  | :BI
                  | :BJ
                  | :BL
                  | :BM
                  | :BN
                  | :BO
                  | :BQ
                  | :BR
                  | :BS
                  | :BT
                  | :BV
                  | :BW
                  | :BY
                  | :BZ
                  | :CA
                  | :CD
                  | :CF
                  | :CG
                  | :CH
                  | :CI
                  | :CK
                  | :CL
                  | :CM
                  | :CN
                  | :CO
                  | :CR
                  | :CV
                  | :CW
                  | :CY
                  | :CZ
                  | :DE
                  | :DJ
                  | :DK
                  | :DM
                  | :DO
                  | :DZ
                  | :EC
                  | :EE
                  | :EG
                  | :EH
                  | :ER
                  | :ES
                  | :ET
                  | :FI
                  | :FJ
                  | :FK
                  | :FO
                  | :FR
                  | :GA
                  | :GB
                  | :GD
                  | :GE
                  | :GF
                  | :GG
                  | :GH
                  | :GI
                  | :GL
                  | :GM
                  | :GN
                  | :GP
                  | :GQ
                  | :GR
                  | :GS
                  | :GT
                  | :GU
                  | :GW
                  | :GY
                  | :HK
                  | :HN
                  | :HR
                  | :HT
                  | :HU
                  | :ID
                  | :IE
                  | :IL
                  | :IM
                  | :IN
                  | :IO
                  | :IQ
                  | :IS
                  | :IT
                  | :JE
                  | :JM
                  | :JO
                  | :JP
                  | :KE
                  | :KG
                  | :KH
                  | :KI
                  | :KM
                  | :KN
                  | :KR
                  | :KW
                  | :KY
                  | :KZ
                  | :LA
                  | :LB
                  | :LC
                  | :LI
                  | :LK
                  | :LR
                  | :LS
                  | :LT
                  | :LU
                  | :LV
                  | :LY
                  | :MA
                  | :MC
                  | :MD
                  | :ME
                  | :MF
                  | :MG
                  | :MK
                  | :ML
                  | :MM
                  | :MN
                  | :MO
                  | :MQ
                  | :MR
                  | :MS
                  | :MT
                  | :MU
                  | :MV
                  | :MW
                  | :MX
                  | :MY
                  | :MZ
                  | :NA
                  | :NC
                  | :NE
                  | :NG
                  | :NI
                  | :NL
                  | :NO
                  | :NP
                  | :NR
                  | :NU
                  | :NZ
                  | :OM
                  | :PA
                  | :PE
                  | :PF
                  | :PG
                  | :PH
                  | :PK
                  | :PL
                  | :PM
                  | :PN
                  | :PR
                  | :PS
                  | :PT
                  | :PY
                  | :QA
                  | :RE
                  | :RO
                  | :RS
                  | :RU
                  | :RW
                  | :SA
                  | :SB
                  | :SC
                  | :SE
                  | :SG
                  | :SH
                  | :SI
                  | :SJ
                  | :SK
                  | :SL
                  | :SM
                  | :SN
                  | :SO
                  | :SR
                  | :SS
                  | :ST
                  | :SV
                  | :SX
                  | :SZ
                  | :TA
                  | :TC
                  | :TD
                  | :TF
                  | :TG
                  | :TH
                  | :TJ
                  | :TK
                  | :TL
                  | :TM
                  | :TN
                  | :TO
                  | :TR
                  | :TT
                  | :TV
                  | :TW
                  | :TZ
                  | :UA
                  | :UG
                  | :US
                  | :UY
                  | :UZ
                  | :VA
                  | :VC
                  | :VE
                  | :VG
                  | :VN
                  | :VU
                  | :WF
                  | :WS
                  | :XK
                  | :YE
                  | :YT
                  | :ZA
                  | :ZM
                  | :ZW
                  | :ZZ
                ]
              },
              :setup_intent_data => %{
                :on_behalf_of => String.t(),
                :metadata => map(),
                :description => String.t()
              },
              :phone_number_collection => %{:enabled => boolean()},
              :payment_method_types => [
                String.t()
                | :acss_debit
                | :afterpay_clearpay
                | :alipay
                | :au_becs_debit
                | :bacs_debit
                | :bancontact
                | :boleto
                | :card
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
                | :wechat_pay
              ],
              :payment_method_options => %{
                :wechat_pay => %{
                  :client => String.t() | :android | :ios | :web,
                  :app_id => String.t()
                },
                :us_bank_account => %{:verification_method => String.t() | :automatic | :instant},
                :oxxo => %{:expires_after_days => integer()},
                :konbini => %{:expires_after_days => String.t() | integer()},
                :boleto => %{:expires_after_days => integer()},
                :acss_debit => %{
                  :verification_method => String.t() | :automatic | :instant | :microdeposits,
                  :mandate_options => %{
                    :transaction_type => String.t() | :business | :personal,
                    :payment_schedule => String.t() | :combined | :interval | :sporadic,
                    :interval_description => String.t(),
                    :default_for => [String.t() | :invoice | :subscription],
                    :custom_mandate_url => String.t()
                  },
                  :currency => String.t() | :cad | :usd
                }
              },
              :payment_intent_data => %{
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
                :receipt_email => String.t(),
                :on_behalf_of => String.t(),
                :metadata => map(),
                :description => String.t(),
                :capture_method => String.t() | :automatic | :manual,
                :application_fee_amount => integer()
              },
              :mode => String.t() | :payment | :setup | :subscription,
              :metadata => map(),
              :locale =>
                String.t()
                | :auto
                | :bg
                | :cs
                | :da
                | :de
                | :el
                | :en
                | :"en-GB"
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
              :line_items => [
                %{
                  :tax_rates => [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :recurring => %{
                      :interval_count => integer(),
                      :interval => String.t() | :day | :month | :week | :year
                    },
                    :product_data => %{
                      :tax_code => String.t(),
                      :name => String.t(),
                      :metadata => map(),
                      :images => [String.t()],
                      :description => String.t()
                    },
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t(),
                  :dynamic_tax_rates => [String.t()],
                  :adjustable_quantity => %{
                    :minimum => integer(),
                    :maximum => integer(),
                    :enabled => boolean()
                  }
                }
              ],
              :expires_at => integer(),
              :expand => [String.t()],
              :discounts => [%{:promotion_code => String.t(), :coupon => String.t()}],
              :customer_update => %{
                :shipping => String.t() | :auto | :never,
                :name => String.t() | :auto | :never,
                :address => String.t() | :auto | :never
              },
              :customer_email => String.t(),
              :customer_creation => String.t() | :always | :if_required,
              :customer => String.t(),
              :consent_collection => %{:promotions => String.t() | :auto},
              :client_reference_id => String.t(),
              :cancel_url => String.t(),
              :billing_address_collection => String.t() | :auto | :required,
              :automatic_tax => %{:enabled => boolean()},
              :allow_promotion_codes => boolean(),
              :after_expiration => %{
                :recovery => %{:enabled => boolean(), :allow_promotion_codes => boolean()}
              }
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Checkout_session.t() | map()}
          | {:error, any()}
  def post_checkout_sessions(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Checkout Sessions.</p>

  """
  @type get_checkout_sessions_opts ::
          {:subscription, String.t()}
          | {:starting_after, String.t()}
          | {:payment_intent, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_checkout_sessions(client :: ExOAPI.Client.t(), list(get_checkout_sessions_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Checkout_session.t()]
             }
           | map()}
          | {:error, any()}
  def get_checkout_sessions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:subscription, "subscription", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:payment_intent, "payment_intent", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a Session object.</p>

  """
  @type get_checkout_sessions_session_opts :: {:expand, String.t()}
  @spec get_checkout_sessions_session(
          client :: ExOAPI.Client.t(),
          session :: String.t(),
          list(get_checkout_sessions_session_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Checkout_session.t() | map()}
          | {:error, any()}
  def get_checkout_sessions_session(%ExOAPI.Client{} = client, session, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/checkout/sessions/{session}")
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end