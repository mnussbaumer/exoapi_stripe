defmodule ExOAPI.Stripe.Schemas.Issuing_card do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.

  **:brand** :: *:string*

  The brand of the card.


  **:cancellation_reason** :: *:string*

  The reason why the card was canceled.


  **:cardholder** :: *ExOAPI.Stripe.Schemas.Issuing_cardholder*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:cvc** :: *:string*

  The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.


  **:exp_month** :: *:integer*

  The expiration month of the card.


  **:exp_year** :: *:integer*

  The expiration year of the card.


  **:id** :: *:string*

  Unique identifier for the object.


  **:last4** :: *:string*

  The last 4 digits of the card number.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:number** :: *:string*

  The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:replaced_by** :: *ExOAPI.Stripe.Schemas.Issuing_card | :string*

  The latest card that replaces this card, if any.


  **:replacement_for** :: *ExOAPI.Stripe.Schemas.Issuing_card | :string*

  The card this card replaces, if any.


  **:replacement_reason** :: *:string*

  The reason why the previous card needed to be replaced.


  **:shipping** :: *ExOAPI.Stripe.Schemas.IssuingCardShipping*

  Where and how the card will be shipped.


  **:spending_controls** :: *ExOAPI.Stripe.Schemas.IssuingCardAuthorizationControls*


  **:status** :: *:string*

  Whether authorizations can be approved on this card.


  **:type** :: *:string*

  The type of the card.


  **:wallets** :: *ExOAPI.Stripe.Schemas.IssuingCardWallets*

  Information relating to digital wallets (like Apple Pay and Google Pay).


  """

  @primary_key false
  typed_embedded_schema do
    field(:brand, :string)

    field(:cancellation_reason, Ecto.Enum, values: [:stolen, :lost])

    embeds_one(:cardholder, ExOAPI.Stripe.Schemas.Issuing_cardholder)

    field(:created, :integer)

    field(:currency, :string)

    field(:cvc, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:id, :string)

    field(:last4, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:number, :string)

    field(:object, Ecto.Enum, values: [:"issuing.card"])

    field(:replaced_by, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_card]
    )

    field(:replacement_for, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_card]
    )

    field(:replacement_reason, Ecto.Enum, values: [:stolen, :lost, :expired, :damaged])

    field(:shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.IssuingCardShipping])

    embeds_one(:spending_controls, ExOAPI.Stripe.Schemas.IssuingCardAuthorizationControls)

    field(:status, Ecto.Enum, values: [:inactive, :canceled, :active])

    field(:type, Ecto.Enum, values: [:virtual, :physical])

    field(:wallets, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.IssuingCardWallets])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :wallets,
      :type,
      :status,
      :shipping,
      :replacement_reason,
      :replacement_for,
      :replaced_by,
      :object,
      :number,
      :metadata,
      :livemode,
      :last4,
      :id,
      :exp_year,
      :exp_month,
      :cvc,
      :currency,
      :created,
      :cancellation_reason,
      :brand
    ])
    |> validate_required([
      :type,
      :status,
      :object,
      :metadata,
      :livemode,
      :last4,
      :id,
      :exp_year,
      :exp_month,
      :currency,
      :created,
      :brand
    ])
    |> cast_embed(:spending_controls, required: true)
    |> cast_embed(:cardholder, required: true)
  end
end