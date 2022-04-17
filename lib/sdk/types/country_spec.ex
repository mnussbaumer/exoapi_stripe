defmodule ExOAPI.Stripe.Schemas.CountrySpec do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Stripe needs to collect certain pieces of information about each account
  created. These requirements can differ depending on the account's country. The
  Country Specs API makes these rules available to your integration.

  You can also view the information from this API call as [an online
  guide](/docs/connect/required-verification-information).

  **:default_currency** :: *:string*

  The default currency for this country. This applies to both payment methods and bank accounts.


  **:id** :: *:string*

  Unique identifier for the object. Represented as the ISO country code for this country.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:supported_bank_account_currencies** :: *:map*

  Currencies that can be accepted in the specific country (for transfers).


  **::supported_payment_currencies** :: *:string*


  **::supported_payment_methods** :: *:string*


  **::supported_transfer_countries** :: *:string*


  **:verification_fields** :: *ExOAPI.Stripe.Schemas.CountrySpecVerificationFields*


  """

  @primary_key false
  typed_embedded_schema do
    field(:default_currency, :string)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:country_spec])

    field(:supported_bank_account_currencies, :map)

    field(:supported_payment_currencies, {:array, :string})

    field(:supported_payment_methods, {:array, :string})

    field(:supported_transfer_countries, {:array, :string})

    embeds_one(:verification_fields, ExOAPI.Stripe.Schemas.CountrySpecVerificationFields)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :supported_transfer_countries,
      :supported_payment_methods,
      :supported_payment_currencies,
      :supported_bank_account_currencies,
      :object,
      :id,
      :default_currency
    ])
    |> validate_required([:supported_bank_account_currencies, :object, :id, :default_currency])
    |> cast_embed(:verification_fields, required: true)
  end
end