defmodule ExOAPI.Stripe.Schemas.Person do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This is an object representing a person associated with a Stripe account.

  A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account.
  See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.

  Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).

  **:account** :: *ExOAPI.Stripe.Schemas.Account*

  The account the person is associated with.


  **:address** :: *ExOAPI.Stripe.Schemas.Address*


  **:address_kana** :: *ExOAPI.Stripe.Schemas.LegalEntityJapanAddress*


  **:address_kanji** :: *ExOAPI.Stripe.Schemas.LegalEntityJapanAddress*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:dob** :: *ExOAPI.Stripe.Schemas.LegalEntityDob*


  **:email** :: *:string*

  The person's email address.


  **:first_name** :: *:string*

  The person's first name.


  **:first_name_kana** :: *:string*

  The Kana variation of the person's first name (Japan only).


  **:first_name_kanji** :: *:string*

  The Kanji variation of the person's first name (Japan only).


  **::full_name_aliases** :: *:string*


  **:future_requirements** :: *ExOAPI.Stripe.Schemas.PersonFutureRequirements*


  **:gender** :: *:string*

  The person's gender (International regulations require either "male" or "female").


  **:id** :: *:string*

  Unique identifier for the object.


  **:id_number_provided** :: *:boolean*

  Whether the person's `id_number` was provided.


  **:last_name** :: *:string*

  The person's last name.


  **:last_name_kana** :: *:string*

  The Kana variation of the person's last name (Japan only).


  **:last_name_kanji** :: *:string*

  The Kanji variation of the person's last name (Japan only).


  **:maiden_name** :: *:string*

  The person's maiden name.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:nationality** :: *:string*

  The country where the person is a national.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:phone** :: *:string*

  The person's phone number.


  **:political_exposure** :: *:string*

  Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.


  **:relationship** :: *ExOAPI.Stripe.Schemas.PersonRelationship*


  **:requirements** :: *ExOAPI.Stripe.Schemas.PersonRequirements*


  **:ssn_last_4_provided** :: *:boolean*

  Whether the last four digits of the person's Social Security number have been provided (U.S. only).


  **:verification** :: *ExOAPI.Stripe.Schemas.LegalEntityPersonVerification*


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, :string)

    embeds_one(:address, ExOAPI.Stripe.Schemas.Address)

    field(:address_kana, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityJapanAddress]
    )

    field(:address_kanji, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityJapanAddress]
    )

    field(:created, :integer)

    embeds_one(:dob, ExOAPI.Stripe.Schemas.LegalEntityDob)

    field(:email, :string)

    field(:first_name, :string)

    field(:first_name_kana, :string)

    field(:first_name_kanji, :string)

    field(:full_name_aliases, {:array, :string})

    field(:future_requirements, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PersonFutureRequirements]
    )

    field(:gender, :string)

    field(:id, :string)

    field(:id_number_provided, :boolean)

    field(:last_name, :string)

    field(:last_name_kana, :string)

    field(:last_name_kanji, :string)

    field(:maiden_name, :string)

    field(:metadata, :map)

    field(:nationality, :string)

    field(:object, Ecto.Enum, values: [:person])

    field(:phone, :string)

    field(:political_exposure, Ecto.Enum, values: [:none, :existing])

    embeds_one(:relationship, ExOAPI.Stripe.Schemas.PersonRelationship)

    field(:requirements, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.PersonRequirements])

    field(:ssn_last_4_provided, :boolean)

    embeds_one(:verification, ExOAPI.Stripe.Schemas.LegalEntityPersonVerification)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :ssn_last_4_provided,
      :requirements,
      :political_exposure,
      :phone,
      :object,
      :nationality,
      :metadata,
      :maiden_name,
      :last_name_kanji,
      :last_name_kana,
      :last_name,
      :id_number_provided,
      :id,
      :gender,
      :future_requirements,
      :full_name_aliases,
      :first_name_kanji,
      :first_name_kana,
      :first_name,
      :email,
      :created,
      :address_kanji,
      :address_kana,
      :account
    ])
    |> validate_required([:object, :id, :created, :account])
    |> cast_embed(:verification)
    |> cast_embed(:relationship)
    |> cast_embed(:dob)
    |> cast_embed(:address)
  end
end