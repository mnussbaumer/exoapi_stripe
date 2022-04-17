defmodule ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceReaderAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Represents an action performed by the reader

  **:failure_code** :: *:string*

  Failure code, only set if status is `failed`.


  **:failure_message** :: *:string*

  Detailed failure message, only set if status is `failed`.


  **:process_payment_intent** :: *ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceProcessPaymentIntentAction*


  **:process_setup_intent** :: *ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceProcessSetupIntentAction*


  **:set_reader_display** :: *ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceSetReaderDisplayAction*


  **:status** :: *:string*

  Status of the action performed by the reader.


  **:type** :: *:string*

  Type of action performed by the reader.


  """

  @primary_key false
  typed_embedded_schema do
    field(:failure_code, :string)

    field(:failure_message, :string)

    embeds_one(
      :process_payment_intent,
      ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceProcessPaymentIntentAction
    )

    embeds_one(
      :process_setup_intent,
      ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceProcessSetupIntentAction
    )

    embeds_one(
      :set_reader_display,
      ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceSetReaderDisplayAction
    )

    field(:status, Ecto.Enum, values: [:succeeded, :in_progress, :failed])

    field(:type, Ecto.Enum,
      values: [:set_reader_display, :process_setup_intent, :process_payment_intent]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :status, :failure_message, :failure_code])
    |> validate_required([:type, :status])
    |> cast_embed(:set_reader_display)
    |> cast_embed(:process_setup_intent)
    |> cast_embed(:process_payment_intent)
  end
end