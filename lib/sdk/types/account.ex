defmodule ExOAPI.Stripe.Schemas.Account do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This is an object representing a Stripe account. You can retrieve it to see
  properties on the account like its current e-mail address or if the account is
  enabled yet to make live charges.

  Some properties, marked below, are available only to platforms that want to
  [create and manage Express or Custom accounts](https://stripe.com/docs/connect/accounts).

  **:business_profile** :: *ExOAPI.Stripe.Schemas.AccountBusinessProfile*

  Business information about the account.


  **:business_type** :: *:string*

  The business type.


  **:capabilities** :: *ExOAPI.Stripe.Schemas.AccountCapabilities*


  **:charges_enabled** :: *:boolean*

  Whether the account can create live charges.


  **:company** :: *ExOAPI.Stripe.Schemas.LegalEntityCompany*


  **:controller** :: *ExOAPI.Stripe.Schemas.AccountUnificationAccountController*


  **:country** :: *:string*

  The account's country.


  **:created** :: *:integer*

  Time at which the account was connected. Measured in seconds since the Unix epoch.


  **:default_currency** :: *:string*

  Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts).


  **:details_submitted** :: *:boolean*

  Whether account details have been submitted. Standard accounts cannot receive payouts before this is true.


  **:email** :: *:string*

  An email address associated with the account. You can treat this as metadata: it is not used for authentication or messaging account holders.


  **::data** :: *ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BankAccount*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:future_requirements** :: *ExOAPI.Stripe.Schemas.AccountFutureRequirements*


  **:id** :: *:string*

  Unique identifier for the object.


  **:individual** :: *ExOAPI.Stripe.Schemas.Person*


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:payouts_enabled** :: *:boolean*

  Whether Stripe can send payouts to this account.


  **:requirements** :: *ExOAPI.Stripe.Schemas.AccountRequirements*


  **:settings** :: *ExOAPI.Stripe.Schemas.AccountSettings*

  Options for customizing how the account functions within Stripe.


  **:tos_acceptance** :: *ExOAPI.Stripe.Schemas.AccountTosAcceptance*


  **:type** :: *:string*

  The Stripe account type. Can be `standard`, `express`, or `custom`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:business_profile, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.AccountBusinessProfile]
    )

    field(:business_type, Ecto.Enum,
      values: [:non_profit, :individual, :government_entity, :company]
    )

    embeds_one(:capabilities, ExOAPI.Stripe.Schemas.AccountCapabilities)

    field(:charges_enabled, :boolean)

    embeds_one(:company, ExOAPI.Stripe.Schemas.LegalEntityCompany)

    embeds_one(:controller, ExOAPI.Stripe.Schemas.AccountUnificationAccountController)

    field(:country, :string)

    field(:created, :integer)

    field(:default_currency, :string)

    field(:details_submitted, :boolean)

    field(:email, :string)

    field(:external_accounts, :map)

    embeds_one(:future_requirements, ExOAPI.Stripe.Schemas.AccountFutureRequirements)

    field(:id, :string)

    embeds_one(:individual, ExOAPI.Stripe.Schemas.Person)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:account])

    field(:payouts_enabled, :boolean)

    embeds_one(:requirements, ExOAPI.Stripe.Schemas.AccountRequirements)

    field(:settings, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.AccountSettings])

    embeds_one(:tos_acceptance, ExOAPI.Stripe.Schemas.AccountTosAcceptance)

    field(:type, Ecto.Enum, values: [:standard, :express, :custom])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :settings,
      :payouts_enabled,
      :object,
      :metadata,
      :id,
      :external_accounts,
      :email,
      :details_submitted,
      :default_currency,
      :created,
      :country,
      :charges_enabled,
      :business_type,
      :business_profile
    ])
    |> validate_required([:object, :id])
    |> cast_embed(:tos_acceptance)
    |> cast_embed(:requirements)
    |> cast_embed(:individual)
    |> cast_embed(:future_requirements)
    |> cast_embed(:controller)
    |> cast_embed(:company)
    |> cast_embed(:capabilities)
  end
end