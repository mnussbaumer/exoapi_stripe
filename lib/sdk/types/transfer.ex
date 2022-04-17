defmodule ExOAPI.Stripe.Schemas.Transfer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A `Transfer` object is created when you move funds between Stripe accounts as
  part of Connect.

  Before April 6, 2017, transfers also represented movement of funds from a
  Stripe account to a card or bank account. This behavior has since been split
  out into a [Payout](https://stripe.com/docs/api#payout_object) object, with corresponding payout endpoints. For more
  information, read about the
  [transfer/payout split](https://stripe.com/docs/transfer-payout-split).

  Related guide: [Creating Separate Charges and Transfers](https://stripe.com/docs/connect/charges-transfers).

  **:amount** :: *:integer*

  Amount in %s to be transferred.


  **:amount_reversed** :: *:integer*

  Amount in %s reversed (can be less than the amount attribute on the transfer if a partial reversal was issued).


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  Balance transaction that describes the impact of this transfer on your account balance.


  **:created** :: *:integer*

  Time that this record of the transfer was first created.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:destination** :: *ExOAPI.Stripe.Schemas.Account | :string*

  ID of the Stripe account the transfer was sent to.


  **:destination_payment** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  If the destination is a Stripe account, this will be the ID of the payment that the destination account received for the transfer.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **::data** :: *ExOAPI.Stripe.Schemas.TransferReversal*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:reversed** :: *:boolean*

  Whether the transfer has been fully reversed. If the transfer is only partially reversed, this attribute will still be false.


  **:source_transaction** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the charge or payment that was used to fund the transfer. If null, the transfer was funded from the available balance.


  **:source_type** :: *:string*

  The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`.


  **:transfer_group** :: *:string*

  A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_reversed, :integer)

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:destination, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:destination_payment, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Charge]
    )

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:transfer])

    field(:reversals, :map)

    field(:reversed, :boolean)

    field(:source_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Charge]
    )

    field(:source_type, :string)

    field(:transfer_group, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transfer_group,
      :source_type,
      :source_transaction,
      :reversed,
      :reversals,
      :object,
      :metadata,
      :livemode,
      :id,
      :destination_payment,
      :destination,
      :description,
      :currency,
      :created,
      :balance_transaction,
      :amount_reversed,
      :amount
    ])
    |> validate_required([
      :reversed,
      :reversals,
      :object,
      :metadata,
      :livemode,
      :id,
      :currency,
      :created,
      :amount_reversed,
      :amount
    ])
  end
end