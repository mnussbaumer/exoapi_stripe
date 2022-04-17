defmodule ExOAPI.Stripe.Schemas.Customer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This object represents a customer of your business. It lets you create recurring charges and track payments that belong to the same customer.

  Related guide: [Save a card during payment](https://stripe.com/docs/payments/save-during-payment).

  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  The customer's address.


  **:balance** :: *ExOAPI.Stripe.Schemas.Balance*

  Current balance, if any, being stored on the customer. If negative, the customer has credit to apply to their next invoice. If positive, the customer has an amount owed that will be added to their next invoice. The balance does not refer to any unpaid invoices; it solely takes into account amounts that have yet to be successfully applied to any invoice. This balance is only taken into account as invoices are finalized.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can be charged in for recurring billing purposes.


  **:default_source** :: *ExOAPI.Stripe.Schemas.Source | ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BitcoinReceiver | ExOAPI.Stripe.Schemas.BankAccount | ExOAPI.Stripe.Schemas.AlipayAccount | :string*

  ID of the default payment source for the customer.

  If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) field instead.


  **:delinquent** :: *:boolean*

  When the customer's latest invoice is billed by charging automatically, `delinquent` is `true` if the invoice's latest charge failed. When the customer's latest invoice is billed by sending an invoice, `delinquent` is `true` if the invoice isn't paid by its due date.

  If an invoice is marked uncollectible by [dunning](https://stripe.com/docs/billing/automatic-collection), `delinquent` doesn't get reset to `false`.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:discount** :: *ExOAPI.Stripe.Schemas.Discount*

  Describes the current discount active on the customer, if there is one.


  **:email** :: *:string*

  The customer's email address.


  **:id** :: *:string*

  Unique identifier for the object.


  **:invoice_prefix** :: *:string*

  The prefix for the customer used to generate unique invoice numbers.


  **:invoice_settings** :: *ExOAPI.Stripe.Schemas.InvoiceSettingCustomerSetting*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:name** :: *:string*

  The customer's full name or business name.


  **:next_invoice_sequence** :: *:integer*

  The suffix of the customer's next invoice number, e.g., 0001.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:phone** :: *:string*

  The customer's phone number.


  **::preferred_locales** :: *:string*


  **:shipping** :: *ExOAPI.Stripe.Schemas.Shipping*

  Mailing and shipping address for the customer. Appears on invoices emailed to this customer.


  **::data** :: *ExOAPI.Stripe.Schemas.Source | ExOAPI.Stripe.Schemas.Card | ExOAPI.Stripe.Schemas.BitcoinReceiver | ExOAPI.Stripe.Schemas.BankAccount | ExOAPI.Stripe.Schemas.AlipayAccount*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **::data** :: *ExOAPI.Stripe.Schemas.Subscription*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:tax** :: *ExOAPI.Stripe.Schemas.CustomerTax*


  **:tax_exempt** :: *:string*

  Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`. When set to `reverse`, invoice and receipt PDFs include the text **"Reverse charge"**.


  **::data** :: *ExOAPI.Stripe.Schemas.TaxId*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:test_clock** :: *ExOAPI.Stripe.Schemas.TestHelpers_testClock | :string*

  ID of the test clock this customer belongs to.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:balance, :integer)

    field(:created, :integer)

    field(:currency, :string)

    field(:default_source, ExOAPI.EctoTypes.AnyOf,
      types: [
        :string,
        ExOAPI.Stripe.Schemas.AlipayAccount,
        ExOAPI.Stripe.Schemas.BankAccount,
        ExOAPI.Stripe.Schemas.BitcoinReceiver,
        ExOAPI.Stripe.Schemas.Card,
        ExOAPI.Stripe.Schemas.Source
      ]
    )

    field(:delinquent, :boolean)

    field(:description, :string)

    field(:discount, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Discount])

    field(:email, :string)

    field(:id, :string)

    field(:invoice_prefix, :string)

    embeds_one(:invoice_settings, ExOAPI.Stripe.Schemas.InvoiceSettingCustomerSetting)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:name, :string)

    field(:next_invoice_sequence, :integer)

    field(:object, Ecto.Enum, values: [:customer])

    field(:phone, :string)

    field(:preferred_locales, {:array, :string})

    field(:shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Shipping])

    field(:sources, :map)

    field(:subscriptions, :map)

    embeds_one(:tax, ExOAPI.Stripe.Schemas.CustomerTax)

    field(:tax_exempt, Ecto.Enum, values: [:reverse, :none, :exempt])

    field(:tax_ids, :map)

    field(:test_clock, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.TestHelpers_testClock]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :test_clock,
      :tax_ids,
      :tax_exempt,
      :subscriptions,
      :sources,
      :shipping,
      :preferred_locales,
      :phone,
      :object,
      :next_invoice_sequence,
      :name,
      :metadata,
      :livemode,
      :invoice_prefix,
      :id,
      :email,
      :discount,
      :description,
      :delinquent,
      :default_source,
      :currency,
      :created,
      :balance,
      :address
    ])
    |> validate_required([:object, :livemode, :id, :created])
    |> cast_embed(:tax)
    |> cast_embed(:invoice_settings)
  end
end