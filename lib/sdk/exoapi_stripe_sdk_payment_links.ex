defmodule ExOAPI.Stripe.SDK.PaymentLinks do
  @doc """
  **description**: <p>When retrieving a payment link, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_payment_links_payment_link_line_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_payment_links_payment_link_line_items(
          client :: ExOAPI.Client.t(),
          payment_link :: String.t(),
          list(get_payment_links_payment_link_line_items_opts())
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
  def get_payment_links_payment_link_line_items(
        %ExOAPI.Client{} = client,
        payment_link,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links/{payment_link}/line_items")
    |> ExOAPI.Client.replace_in_path("payment_link", payment_link)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a payment link.</p>

  """

  @spec post_payment_links(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data => %{:destination => String.t(), :amount => integer()},
              :subscription_data => %{:trial_period_days => integer()},
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
              :phone_number_collection => %{:enabled => boolean()},
              :payment_method_types => [String.t() | :card],
              :on_behalf_of => String.t(),
              :metadata => map(),
              :line_items => [
                %{
                  :quantity => integer(),
                  :price => String.t(),
                  :adjustable_quantity => %{
                    :minimum => integer(),
                    :maximum => integer(),
                    :enabled => boolean()
                  }
                }
              ],
              :expand => [String.t()],
              :billing_address_collection => String.t() | :auto | :required,
              :automatic_tax => %{:enabled => boolean()},
              :application_fee_percent => number(),
              :application_fee_amount => integer(),
              :allow_promotion_codes => boolean(),
              :after_completion => %{
                :type => String.t() | :hosted_confirmation | :redirect,
                :redirect => %{:url => String.t()},
                :hosted_confirmation => %{:custom_message => String.t()}
              }
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentLink.t() | map()}
          | {:error, any()}
  def post_payment_links(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your payment links.</p>

  """
  @type get_payment_links_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:active, String.t()}
  @spec get_payment_links(client :: ExOAPI.Client.t(), list(get_payment_links_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.PaymentLink.t()]
             }
           | map()}
          | {:error, any()}
  def get_payment_links(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:active, "active", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a payment link.</p>

  """

  @spec post_payment_links_payment_link(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :shipping_address_collection =>
                String.t()
                | %{
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
              :payment_method_types => String.t() | [String.t() | :card],
              :metadata => map(),
              :line_items => [
                %{
                  :quantity => integer(),
                  :id => String.t(),
                  :adjustable_quantity => %{
                    :minimum => integer(),
                    :maximum => integer(),
                    :enabled => boolean()
                  }
                }
              ],
              :expand => [String.t()],
              :billing_address_collection => String.t() | :auto | :required,
              :automatic_tax => %{:enabled => boolean()},
              :allow_promotion_codes => boolean(),
              :after_completion => %{
                :type => String.t() | :hosted_confirmation | :redirect,
                :redirect => %{:url => String.t()},
                :hosted_confirmation => %{:custom_message => String.t()}
              },
              :active => boolean()
            }
            | map(),
          payment_link :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentLink.t() | map()}
          | {:error, any()}
  def post_payment_links_payment_link(%ExOAPI.Client{} = client, body, payment_link) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links/{payment_link}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("payment_link", payment_link)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a payment link.</p>

  """
  @type get_payment_links_payment_link_opts :: {:expand, String.t()}
  @spec get_payment_links_payment_link(
          client :: ExOAPI.Client.t(),
          payment_link :: String.t(),
          list(get_payment_links_payment_link_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.PaymentLink.t() | map()}
          | {:error, any()}
  def get_payment_links_payment_link(%ExOAPI.Client{} = client, payment_link, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/payment_links/{payment_link}")
    |> ExOAPI.Client.replace_in_path("payment_link", payment_link)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end