defmodule ExOAPI.Stripe.Schemas.LegalEntityCompany do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*


  **:address_kana** :: *ExOAPI.Stripe.Schemas.LegalEntityJapanAddress*

  The Kana variation of the company's primary address (Japan only).


  **:address_kanji** :: *ExOAPI.Stripe.Schemas.LegalEntityJapanAddress*

  The Kanji variation of the company's primary address (Japan only).


  **:directors_provided** :: *:boolean*

  Whether the company's directors have been provided. This Boolean will be `true` if you've manually indicated that all directors are provided via [the `directors_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-directors_provided).


  **:executives_provided** :: *:boolean*

  Whether the company's executives have been provided. This Boolean will be `true` if you've manually indicated that all executives are provided via [the `executives_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-executives_provided), or if Stripe determined that sufficient executives were provided.


  **:name** :: *:string*

  The company's legal name.


  **:name_kana** :: *:string*

  The Kana variation of the company's legal name (Japan only).


  **:name_kanji** :: *:string*

  The Kanji variation of the company's legal name (Japan only).


  **:owners_provided** :: *:boolean*

  Whether the company's owners have been provided. This Boolean will be `true` if you've manually indicated that all owners are provided via [the `owners_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-owners_provided), or if Stripe determined that sufficient owners were provided. Stripe determines ownership requirements using both the number of owners provided and their total percent ownership (calculated by adding the `percent_ownership` of each owner together).


  **:ownership_declaration** :: *ExOAPI.Stripe.Schemas.LegalEntityUboDeclaration*

  This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct.


  **:phone** :: *:string*

  The company's phone number (used for verification).


  **:structure** :: *:string*

  The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/docs/connect/identity-verification#business-structure) for more details.


  **:tax_id_provided** :: *:boolean*

  Whether the company's business ID number was provided.


  **:tax_id_registrar** :: *:string*

  The jurisdiction in which the `tax_id` is registered (Germany-based companies only).


  **:vat_id_provided** :: *:boolean*

  Whether the company's business VAT number was provided.


  **:verification** :: *ExOAPI.Stripe.Schemas.LegalEntityCompanyVerification*

  Information on the verification state of the company.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:address, ExOAPI.Stripe.Schemas.Address)

    field(:address_kana, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityJapanAddress]
    )

    field(:address_kanji, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityJapanAddress]
    )

    field(:directors_provided, :boolean)

    field(:executives_provided, :boolean)

    field(:name, :string)

    field(:name_kana, :string)

    field(:name_kanji, :string)

    field(:owners_provided, :boolean)

    field(:ownership_declaration, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityUboDeclaration]
    )

    field(:phone, :string)

    field(:structure, Ecto.Enum,
      values: [
        :unincorporated_non_profit,
        :unincorporated_association,
        :tax_exempt_government_instrumentality,
        :sole_proprietorship,
        :sole_establishment,
        :single_member_llc,
        :public_partnership,
        :public_corporation,
        :public_company,
        :private_partnership,
        :private_corporation,
        :private_company,
        :multi_member_llc,
        :llc,
        :limited_liability_partnership,
        :incorporated_non_profit,
        :governmental_unit,
        :government_instrumentality,
        :free_zone_llc,
        :free_zone_establishment
      ]
    )

    field(:tax_id_provided, :boolean)

    field(:tax_id_registrar, :string)

    field(:vat_id_provided, :boolean)

    field(:verification, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityCompanyVerification]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :verification,
      :vat_id_provided,
      :tax_id_registrar,
      :tax_id_provided,
      :structure,
      :phone,
      :ownership_declaration,
      :owners_provided,
      :name_kanji,
      :name_kana,
      :name,
      :executives_provided,
      :directors_provided,
      :address_kanji,
      :address_kana
    ])
    |> cast_embed(:address)
  end
end