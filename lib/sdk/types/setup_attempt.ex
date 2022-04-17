defmodule ExOAPI.Stripe.Schemas.SetupAttempt do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A SetupAttempt describes one attempted confirmation of a SetupIntent,
  whether that confirmation was successful or unsuccessful. You can use
  SetupAttempts to inspect details of a specific attempt at setting up a
  payment method using a SetupIntent.

  **:application** :: *ExOAPI.Stripe.Schemas.Application | :string*

  The value of [application](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The value of [customer](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:on_behalf_of** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The value of [on_behalf_of](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation.


  **:payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the payment method used with this SetupAttempt.


  **:payment_method_details** :: *ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetails*


  **:setup_error** :: *ExOAPI.Stripe.Schemas.ApiErrors*

  The error encountered during this attempt to confirm the SetupIntent, if any.


  **:setup_intent** :: *ExOAPI.Stripe.Schemas.SetupIntent | :string*

  ID of the SetupIntent that this attempt belongs to.


  **:status** :: *:string*

  Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`.


  **:usage** :: *:string*

  The value of [usage](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:application, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Application]
    )

    field(:created, :integer)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:setup_attempt])

    field(:on_behalf_of, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    embeds_one(:payment_method_details, ExOAPI.Stripe.Schemas.SetupAttemptPaymentMethodDetails)

    field(:setup_error, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.ApiErrors])

    field(:setup_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SetupIntent]
    )

    field(:status, :string)

    field(:usage, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :usage,
      :status,
      :setup_intent,
      :setup_error,
      :payment_method,
      :on_behalf_of,
      :object,
      :livemode,
      :id,
      :customer,
      :created,
      :application
    ])
    |> validate_required([
      :usage,
      :status,
      :setup_intent,
      :payment_method,
      :object,
      :livemode,
      :id,
      :created
    ])
    |> cast_embed(:payment_method_details, required: true)
  end
end