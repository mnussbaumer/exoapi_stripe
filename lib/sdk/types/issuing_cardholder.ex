defmodule ExOAPI.Stripe.Schemas.Issuing_cardholder do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.

  Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)

  **:billing** :: *ExOAPI.Stripe.Schemas.IssuingCardholderAddress*


  **:company** :: *ExOAPI.Stripe.Schemas.IssuingCardholderCompany*

  Additional information about a `company` cardholder.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:email** :: *:string*

  The cardholder's email address.


  **:id** :: *:string*

  Unique identifier for the object.


  **:individual** :: *ExOAPI.Stripe.Schemas.IssuingCardholderIndividual*

  Additional information about an `individual` cardholder.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:name** :: *:string*

  The cardholder's name. This will be printed on cards issued to them.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:phone_number** :: *:string*

  The cardholder's phone number. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://stripe.com/docs/issuing/3d-secure#when-is-3d-secure-applied) for more details.


  **:requirements** :: *ExOAPI.Stripe.Schemas.IssuingCardholderRequirements*


  **:spending_controls** :: *ExOAPI.Stripe.Schemas.IssuingCardholderAuthorizationControls*

  Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.


  **:status** :: *:string*

  Specifies whether to permit authorizations on this cardholder's cards.


  **:type** :: *:string*

  One of `individual` or `company`.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:billing, ExOAPI.Stripe.Schemas.IssuingCardholderAddress)

    field(:company, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingCardholderCompany]
    )

    field(:created, :integer)

    field(:email, :string)

    field(:id, :string)

    field(:individual, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingCardholderIndividual]
    )

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:"issuing.cardholder"])

    field(:phone_number, :string)

    embeds_one(:requirements, ExOAPI.Stripe.Schemas.IssuingCardholderRequirements)

    field(:spending_controls, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingCardholderAuthorizationControls]
    )

    field(:status, Ecto.Enum, values: [:inactive, :blocked, :active])

    field(:type, Ecto.Enum, values: [:individual, :company])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :status,
      :spending_controls,
      :phone_number,
      :object,
      :name,
      :metadata,
      :livemode,
      :individual,
      :id,
      :email,
      :created,
      :company
    ])
    |> validate_required([:type, :status, :object, :name, :metadata, :livemode, :id, :created])
    |> cast_embed(:requirements, required: true)
    |> cast_embed(:billing, required: true)
  end
end