defmodule ExOAPI.Stripe.Schemas.TransferReversal do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: [Stripe Connect](https://stripe.com/docs/connect) platforms can reverse transfers made to a
  connected account, either entirely or partially, and can also specify whether
  to refund any related application fees. Transfer reversals add to the
  platform's balance and subtract from the destination account's balance.

  Reversing a transfer that was made for a [destination
  charge](/docs/connect/destination-charges) is allowed only up to the amount of
  the charge. It is possible to reverse a
  [transfer_group](https://stripe.com/docs/connect/charges-transfers#transfer-options)
  transfer only if the destination account has enough balance to cover the
  reversal.

  Related guide: [Reversing Transfers](https://stripe.com/docs/connect/charges-transfers#reversing-transfers).

  **:amount** :: *:integer*

  Amount, in %s.


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  Balance transaction that describes the impact on your account balance.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:destination_payment_refund** :: *ExOAPI.Stripe.Schemas.Refund | :string*

  Linked payment refund for the transfer reversal.


  **:id** :: *:string*

  Unique identifier for the object.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:source_refund** :: *ExOAPI.Stripe.Schemas.Refund | :string*

  ID of the refund responsible for the transfer reversal.


  **:transfer** :: *ExOAPI.Stripe.Schemas.Transfer | :string*

  ID of the transfer that was reversed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:destination_payment_refund, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Refund]
    )

    field(:id, :string)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:transfer_reversal])

    field(:source_refund, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Refund])

    field(:transfer, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Transfer])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transfer,
      :source_refund,
      :object,
      :metadata,
      :id,
      :destination_payment_refund,
      :currency,
      :created,
      :balance_transaction,
      :amount
    ])
    |> validate_required([:transfer, :object, :id, :currency, :created, :amount])
  end
end