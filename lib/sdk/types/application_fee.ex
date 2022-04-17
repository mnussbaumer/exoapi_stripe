defmodule ExOAPI.Stripe.Schemas.ApplicationFee do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:account** :: *ExOAPI.Stripe.Schemas.Account | :string*

  ID of the Stripe account this fee was taken from.


  **:amount** :: *:integer*

  Amount earned, in %s.


  **:amount_refunded** :: *:integer*

  Amount in %s refunded (can be less than the amount attribute on the fee if a partial refund was issued)


  **:application** :: *ExOAPI.Stripe.Schemas.Application | :string*

  ID of the Connect application that earned the fee.


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  Balance transaction that describes the impact of this collected application fee on your account balance (not including refunds).


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the charge that the application fee was taken from.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:originating_transaction** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the corresponding charge on the platform account, if this fee was the result of a charge using the `destination` parameter.


  **:refunded** :: *:boolean*

  Whether the fee has been fully refunded. If the fee is only partially refunded, this attribute will still be false.


  **::data** :: *ExOAPI.Stripe.Schemas.FeeRefund*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:amount, :integer)

    field(:amount_refunded, :integer)

    field(:application, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Application]
    )

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:application_fee])

    field(:originating_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Charge]
    )

    field(:refunded, :boolean)

    field(:refunds, :map)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :refunds,
      :refunded,
      :originating_transaction,
      :object,
      :livemode,
      :id,
      :currency,
      :created,
      :charge,
      :balance_transaction,
      :application,
      :amount_refunded,
      :amount,
      :account
    ])
    |> validate_required([
      :refunds,
      :refunded,
      :object,
      :livemode,
      :id,
      :currency,
      :created,
      :charge,
      :application,
      :amount_refunded,
      :amount,
      :account
    ])
  end
end