defmodule ExOAPI.Stripe.Schemas.PaymentLink do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A payment link is a shareable URL that will take your customers to a hosted payment page. A payment link can be shared and used multiple times.

  When a customer opens a payment link it will open a new [checkout session](https://stripe.com/docs/api/checkout/sessions) to render the payment page. You can use [checkout session events](https://stripe.com/docs/api/events/types#event_types-checkout.session.completed) to track payments through payment links.

  Related guide: [Payment Links API](https://stripe.com/docs/payments/payment-links/api)

  **:active** :: *:boolean*

  Whether the payment link's `url` is active. If `false`, customers visiting the URL will be shown a page saying that the link has been deactivated.


  **:after_completion** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceAfterCompletion*


  **:allow_promotion_codes** :: *:boolean*

  Whether user redeemable promotion codes are enabled.


  **:application_fee_amount** :: *:integer*

  The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account.


  **:application_fee_percent** :: *:number*

  This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceAutomaticTax*


  **:billing_address_collection** :: *:string*

  Configuration for collecting the customer's billing address.


  **:id** :: *:string*

  Unique identifier for the object.


  **::data** :: *ExOAPI.Stripe.Schemas.Item*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:on_behalf_of** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details.


  **::payment_method_types** :: *:string*


  **:phone_number_collection** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourcePhoneNumberCollection*


  **:shipping_address_collection** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceShippingAddressCollection*

  Configuration for collecting the customer's shipping address.


  **:subscription_data** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceSubscriptionData*

  When creating a subscription, the specified configuration data will be used. There must be at least one line item with a recurring price to use `subscription_data`.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceTransferData*

  The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to.


  **:url** :: *:string*

  The public URL that can be shared with customers.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    embeds_one(:after_completion, ExOAPI.Stripe.Schemas.PaymentLinksResourceAfterCompletion)

    field(:allow_promotion_codes, :boolean)

    field(:application_fee_amount, :integer)

    field(:application_fee_percent, :float)

    embeds_one(:automatic_tax, ExOAPI.Stripe.Schemas.PaymentLinksResourceAutomaticTax)

    field(:billing_address_collection, Ecto.Enum, values: [:required, :auto])

    field(:id, :string)

    field(:line_items, :map)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:payment_link])

    field(:on_behalf_of, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:payment_method_types, {:array, :string})

    embeds_one(
      :phone_number_collection,
      ExOAPI.Stripe.Schemas.PaymentLinksResourcePhoneNumberCollection
    )

    field(:shipping_address_collection, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentLinksResourceShippingAddressCollection]
    )

    field(:subscription_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentLinksResourceSubscriptionData]
    )

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentLinksResourceTransferData]
    )

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :transfer_data,
      :subscription_data,
      :shipping_address_collection,
      :payment_method_types,
      :on_behalf_of,
      :object,
      :metadata,
      :livemode,
      :line_items,
      :id,
      :billing_address_collection,
      :application_fee_percent,
      :application_fee_amount,
      :allow_promotion_codes,
      :active
    ])
    |> validate_required([
      :url,
      :object,
      :metadata,
      :livemode,
      :id,
      :billing_address_collection,
      :allow_promotion_codes,
      :active
    ])
    |> cast_embed(:phone_number_collection, required: true)
    |> cast_embed(:automatic_tax, required: true)
    |> cast_embed(:after_completion, required: true)
  end
end