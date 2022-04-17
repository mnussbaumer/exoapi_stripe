defmodule ExOAPI.Stripe.Schemas.BankAccount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: These bank accounts are payment methods on `Customer` objects.

  On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer
  destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts).
  They can be bank accounts or debit cards as well, and are documented in the links above.

  Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).

  **:account** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The ID of the account that the bank account is associated with.


  **:account_holder_name** :: *:string*

  The name of the person or business that owns the bank account.


  **:account_holder_type** :: *:string*

  The type of entity that holds the account. This can be either `individual` or `company`.


  **:account_type** :: *:string*

  The bank account type. This can only be `checking` or `savings` in most countries. In Japan, this can only be `futsu` or `toza`.


  **::available_payout_methods** :: *:string*


  **:bank_name** :: *:string*

  Name of the bank associated with the routing number (e.g., `WELLS FARGO`).


  **:country** :: *:string*

  Two-letter ISO code representing the country the bank account is located in.


  **:currency** :: *:string*

  Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer that the bank account is associated with.


  **:default_for_currency** :: *:boolean*

  Whether this bank account is the default external account for its currency.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:id** :: *:string*

  Unique identifier for the object.


  **:last4** :: *:string*

  The last four digits of the bank account number.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:routing_number** :: *:string*

  The routing transit number for the bank account.


  **:status** :: *:string*

  For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.

  For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:account_holder_name, :string)

    field(:account_holder_type, :string)

    field(:account_type, :string)

    field(:available_payout_methods, {:array, :string})

    field(:bank_name, :string)

    field(:country, :string)

    field(:currency, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:default_for_currency, :boolean)

    field(:fingerprint, :string)

    field(:id, :string)

    field(:last4, :string)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:bank_account])

    field(:routing_number, :string)

    field(:status, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :status,
      :routing_number,
      :object,
      :metadata,
      :last4,
      :id,
      :fingerprint,
      :default_for_currency,
      :customer,
      :currency,
      :country,
      :bank_name,
      :available_payout_methods,
      :account_type,
      :account_holder_type,
      :account_holder_name,
      :account
    ])
    |> validate_required([:status, :object, :last4, :id, :currency, :country])
  end
end