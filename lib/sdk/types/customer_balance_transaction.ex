defmodule ExOAPI.Stripe.Schemas.CustomerBalanceTransaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Each customer has a [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) value,
  which denotes a debit or credit that's automatically applied to their next invoice upon finalization.
  You may modify the value directly by using the [update customer API](https://stripe.com/docs/api/customers/update),
  or by creating a Customer Balance Transaction, which increments or decrements the customer's `balance` by the specified `amount`.

  Related guide: [Customer Balance](https://stripe.com/docs/billing/customer/balance) to learn more.

  **:amount** :: *:integer*

  The amount of the transaction. A negative value is a credit for the customer's balance, and a positive value is a debit to the customer's `balance`.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:credit_note** :: *ExOAPI.Stripe.Schemas.CreditNote | :string*

  The ID of the credit note (if any) related to the transaction.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer the transaction belongs to.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:ending_balance** :: *:integer*

  The customer's `balance` after the transaction was applied. A negative value decreases the amount due on the customer's next invoice. A positive value increases the amount due on the customer's next invoice.


  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice | :string*

  The ID of the invoice (if any) related to the transaction.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:type** :: *:string*

  Transaction type: `adjustment`, `applied_to_invoice`, `credit_note`, `initial`, `invoice_too_large`, `invoice_too_small`, `unspent_receiver_credit`, or `unapplied_from_invoice`. See the [Customer Balance page](https://stripe.com/docs/billing/customer/balance#types) to learn more about transaction types.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:created, :integer)

    field(:credit_note, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.CreditNote])

    field(:currency, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Customer])

    field(:description, :string)

    field(:ending_balance, :integer)

    field(:id, :string)

    field(:invoice, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Invoice])

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:customer_balance_transaction])

    field(:type, Ecto.Enum,
      values: [
        :unspent_receiver_credit,
        :unapplied_from_invoice,
        :migration,
        :invoice_too_small,
        :invoice_too_large,
        :initial,
        :credit_note,
        :applied_to_invoice,
        :adjustment
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :object,
      :metadata,
      :livemode,
      :invoice,
      :id,
      :ending_balance,
      :description,
      :customer,
      :currency,
      :credit_note,
      :created,
      :amount
    ])
    |> validate_required([
      :type,
      :object,
      :livemode,
      :id,
      :ending_balance,
      :customer,
      :currency,
      :created,
      :amount
    ])
  end
end