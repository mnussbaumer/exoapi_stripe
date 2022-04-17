defmodule ExOAPI.Stripe.SDK.Tokens do
  @doc """
  **description**: <p>Retrieves the token with the given ID.</p>

  """
  @type get_tokens_token_opts :: {:expand, String.t()}
  @spec get_tokens_token(
          client :: ExOAPI.Client.t(),
          token :: String.t(),
          list(get_tokens_token_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_tokens_token(%ExOAPI.Client{} = client, token, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tokens/{token}")
    |> ExOAPI.Client.replace_in_path("token", token)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a single-use token that represents a bank account’s details.
  This token can be used with any API method in place of a bank account dictionary. This token can be used only once, by attaching it to a <a href="#accounts">Custom account</a>.</p>

  """

  @spec post_tokens(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :pii => %{:id_number => String.t()},
              :person => %{
                :verification => %{
                  :document => %{:front => String.t(), :back => String.t()},
                  :additional_document => %{:front => String.t(), :back => String.t()}
                },
                :ssn_last_4 => String.t(),
                :relationship => %{
                  :title => String.t(),
                  :representative => boolean(),
                  :percent_ownership => String.t() | number(),
                  :owner => boolean(),
                  :executive => boolean(),
                  :director => boolean()
                },
                :political_exposure => String.t(),
                :phone => String.t(),
                :nationality => String.t(),
                :metadata => String.t() | map(),
                :maiden_name => String.t(),
                :last_name_kanji => String.t(),
                :last_name_kana => String.t(),
                :last_name => String.t(),
                :id_number => String.t(),
                :gender => String.t(),
                :full_name_aliases => String.t() | [String.t()],
                :first_name_kanji => String.t(),
                :first_name_kana => String.t(),
                :first_name => String.t(),
                :email => String.t(),
                :documents => %{
                  :visa => %{:files => [String.t()]},
                  :passport => %{:files => [String.t()]},
                  :company_authorization => %{:files => [String.t()]}
                },
                :dob =>
                  String.t() | %{:year => integer(), :month => integer(), :day => integer()},
                :address_kanji => %{
                  :town => String.t(),
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :address_kana => %{
                  :town => String.t(),
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :expand => [String.t()],
              :cvc_update => %{:cvc => String.t()},
              :customer => String.t(),
              :card =>
                String.t()
                | %{
                    :number => String.t(),
                    :name => String.t(),
                    :exp_year => String.t(),
                    :exp_month => String.t(),
                    :cvc => String.t(),
                    :currency => String.t(),
                    :address_zip => String.t(),
                    :address_state => String.t(),
                    :address_line2 => String.t(),
                    :address_line1 => String.t(),
                    :address_country => String.t(),
                    :address_city => String.t()
                  },
              :bank_account => %{
                :routing_number => String.t(),
                :currency => String.t(),
                :country => String.t(),
                :account_type => String.t() | :checking | :futsu | :savings | :toza,
                :account_number => String.t(),
                :account_holder_type => String.t() | :company | :individual,
                :account_holder_name => String.t()
              },
              :account => %{
                :tos_shown_and_accepted => boolean(),
                :individual => %{
                  :verification => %{
                    :document => %{:front => String.t(), :back => String.t()},
                    :additional_document => %{:front => String.t(), :back => String.t()}
                  },
                  :ssn_last_4 => String.t(),
                  :political_exposure => String.t() | :existing | :none,
                  :phone => String.t(),
                  :metadata => String.t() | map(),
                  :maiden_name => String.t(),
                  :last_name_kanji => String.t(),
                  :last_name_kana => String.t(),
                  :last_name => String.t(),
                  :id_number => String.t(),
                  :gender => String.t(),
                  :full_name_aliases => String.t() | [String.t()],
                  :first_name_kanji => String.t(),
                  :first_name_kana => String.t(),
                  :first_name => String.t(),
                  :email => String.t(),
                  :dob =>
                    String.t() | %{:year => integer(), :month => integer(), :day => integer()},
                  :address_kanji => %{
                    :town => String.t(),
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  },
                  :address_kana => %{
                    :town => String.t(),
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  },
                  :address => %{
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  }
                },
                :company => %{
                  :verification => %{:document => %{:front => String.t(), :back => String.t()}},
                  :vat_id => String.t(),
                  :tax_id_registrar => String.t(),
                  :tax_id => String.t(),
                  :structure =>
                    String.t()
                    | :free_zone_establishment
                    | :free_zone_llc
                    | :government_instrumentality
                    | :governmental_unit
                    | :incorporated_non_profit
                    | :limited_liability_partnership
                    | :llc
                    | :multi_member_llc
                    | :private_company
                    | :private_corporation
                    | :private_partnership
                    | :public_company
                    | :public_corporation
                    | :public_partnership
                    | :single_member_llc
                    | :sole_establishment
                    | :sole_proprietorship
                    | :tax_exempt_government_instrumentality
                    | :unincorporated_association
                    | :unincorporated_non_profit,
                  :registration_number => String.t(),
                  :phone => String.t(),
                  :ownership_declaration_shown_and_signed => boolean(),
                  :ownership_declaration => %{
                    :user_agent => String.t(),
                    :ip => String.t(),
                    :date => integer()
                  },
                  :owners_provided => boolean(),
                  :name_kanji => String.t(),
                  :name_kana => String.t(),
                  :name => String.t(),
                  :executives_provided => boolean(),
                  :directors_provided => boolean(),
                  :address_kanji => %{
                    :town => String.t(),
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  },
                  :address_kana => %{
                    :town => String.t(),
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  },
                  :address => %{
                    :state => String.t(),
                    :postal_code => String.t(),
                    :line2 => String.t(),
                    :line1 => String.t(),
                    :country => String.t(),
                    :city => String.t()
                  }
                },
                :business_type =>
                  String.t() | :company | :government_entity | :individual | :non_profit
              }
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_tokens(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/tokens")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end