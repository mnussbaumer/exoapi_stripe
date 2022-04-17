defmodule ExOAPI.Stripe.Schemas.SourceMandateNotification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Source mandate notifications should be created when a notification related to
  a source mandate must be sent to the payer. They will trigger a webhook or
  deliver an email to the customer.

  **:acss_debit** :: *ExOAPI.Stripe.Schemas.SourceMandateNotificationAcssDebitData*


  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount associated with the mandate notification. The amount is expressed in the currency of the underlying source. Required if the notification type is `debit_initiated`.


  **:bacs_debit** :: *ExOAPI.Stripe.Schemas.SourceMandateNotificationBacsDebitData*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:reason** :: *:string*

  The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`.


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.SourceMandateNotificationSepaDebitData*


  **:source** :: *ExOAPI.Stripe.Schemas.Source*


  **:status** :: *:string*

  The status of the mandate notification. Valid statuses are `pending` or `submitted`.


  **:type** :: *:string*

  The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:acss_debit, ExOAPI.Stripe.Schemas.SourceMandateNotificationAcssDebitData)

    field(:amount, :integer)

    embeds_one(:bacs_debit, ExOAPI.Stripe.Schemas.SourceMandateNotificationBacsDebitData)

    field(:created, :integer)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:source_mandate_notification])

    field(:reason, :string)

    embeds_one(:sepa_debit, ExOAPI.Stripe.Schemas.SourceMandateNotificationSepaDebitData)

    embeds_one(:source, ExOAPI.Stripe.Schemas.Source)

    field(:status, :string)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :status, :reason, :object, :livemode, :id, :created, :amount])
    |> validate_required([:type, :status, :reason, :object, :livemode, :id, :created])
    |> cast_embed(:source, required: true)
    |> cast_embed(:sepa_debit)
    |> cast_embed(:bacs_debit)
    |> cast_embed(:acss_debit)
  end
end