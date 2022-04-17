defmodule ExOAPI.Stripe.Schemas.FeeRefund do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: `Application Fee Refund` objects allow you to refund an application fee that
  has previously been created but not yet refunded. Funds will be refunded to
  the Stripe account from which the fee was originally collected.

  Related guide: [Refunding Application Fees](https://stripe.com/docs/connect/destination-charges#refunding-app-fee).

  **:amount** :: *:integer*

  Amount, in %s.


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  Balance transaction that describes the impact on your account balance.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:fee** :: *ExOAPI.Stripe.Schemas.ApplicationFee | :string*

  ID of the application fee that was refunded.


  **:id** :: *:string*

  Unique identifier for the object.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:fee, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.ApplicationFee])

    field(:id, :string)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:fee_refund])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :object,
      :metadata,
      :id,
      :fee,
      :currency,
      :created,
      :balance_transaction,
      :amount
    ])
    |> validate_required([:object, :id, :fee, :currency, :created, :amount])
  end
end