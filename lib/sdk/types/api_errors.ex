defmodule ExOAPI.Stripe.Schemas.ApiErrors do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:charge** :: *ExOAPI.Stripe.Schemas.Charge*

  For card errors, the ID of the failed charge.


  **:code** :: *:string*

  For some errors that could be handled programmatically, a short string indicating the [error code](https://stripe.com/docs/error-codes) reported.


  **:decline_code** :: *:string*

  For card errors resulting from a card issuer decline, a short string indicating the [card issuer's reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they provide one.


  **:doc_url** :: *:string*

  A URL to more information about the [error code](https://stripe.com/docs/error-codes) reported.


  **:message** :: *:string*

  A human-readable message providing more details about the error. For card errors, these messages can be shown to your users.


  **:param** :: *:string*

  If the error is parameter-specific, the parameter related to the error. For example, you can use this to display a message near the correct form field.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent*


  **:payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod*


  **:payment_method_type** :: *:string*

  If the error is specific to the type of payment method, the payment method type that had a problem. This field is only populated for invoice-related errors.


  **:setup_intent** :: *ExOAPI.Stripe.Schemas.SetupIntent*


  **:source** :: *ExOAPI.Stripe.Schemas.Source | ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BankAccount*

  The source object for errors returned on a request involving a source.


  **:type** :: *:string*

  The type of error returned. One of `api_error`, `card_error`, `idempotency_error`, or `invalid_request_error`


  """

  @primary_key false
  typed_embedded_schema do
    field(:charge, :string)

    field(:code, :string)

    field(:decline_code, :string)

    field(:doc_url, :string)

    field(:message, :string)

    field(:param, :string)

    embeds_one(:payment_intent, ExOAPI.Stripe.Schemas.PaymentIntent)

    embeds_one(:payment_method, ExOAPI.Stripe.Schemas.PaymentMethod)

    field(:payment_method_type, :string)

    embeds_one(:setup_intent, ExOAPI.Stripe.Schemas.SetupIntent)

    field(:source, ExOAPI.EctoTypes.AnyOf,
      types: [
        ExOAPI.Stripe.Schemas.BankAccount,
        ExOAPI.Stripe.Schemas.Card,
        ExOAPI.Stripe.Schemas.Source
      ]
    )

    field(:type, Ecto.Enum,
      values: [:invalid_request_error, :idempotency_error, :card_error, :api_error]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :source,
      :payment_method_type,
      :param,
      :message,
      :doc_url,
      :decline_code,
      :code,
      :charge
    ])
    |> validate_required([:type])
    |> cast_embed(:setup_intent)
    |> cast_embed(:payment_method)
    |> cast_embed(:payment_intent)
  end
end