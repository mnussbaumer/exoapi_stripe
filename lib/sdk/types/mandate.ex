defmodule ExOAPI.Stripe.Schemas.Mandate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Mandate is a record of the permission a customer has given you to debit their payment method.

  **:customer_acceptance** :: *ExOAPI.Stripe.Schemas.CustomerAcceptance*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:multi_use** :: *list(:map)*


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the payment method associated with this mandate.


  **:payment_method_details** :: *ExOAPI.Stripe.Schemas.MandatePaymentMethodDetails*


  **:single_use** :: *ExOAPI.Stripe.Schemas.MandateSingleUse*


  **:status** :: *:string*

  The status of the mandate, which indicates whether it can be used to initiate a payment.


  **:type** :: *:string*

  The type of the mandate.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:customer_acceptance, ExOAPI.Stripe.Schemas.CustomerAcceptance)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:multi_use, {:array, :map})

    field(:object, Ecto.Enum, values: [:mandate])

    field(:payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    embeds_one(:payment_method_details, ExOAPI.Stripe.Schemas.MandatePaymentMethodDetails)

    embeds_one(:single_use, ExOAPI.Stripe.Schemas.MandateSingleUse)

    field(:status, Ecto.Enum, values: [:pending, :inactive, :active])

    field(:type, Ecto.Enum, values: [:single_use, :multi_use])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :status, :payment_method, :object, :multi_use, :livemode, :id])
    |> validate_required([:type, :status, :payment_method, :object, :livemode, :id])
    |> cast_embed(:single_use)
    |> cast_embed(:payment_method_details, required: true)
    |> cast_embed(:customer_acceptance, required: true)
  end
end