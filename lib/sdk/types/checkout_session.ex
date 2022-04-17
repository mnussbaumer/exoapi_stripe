defmodule ExOAPI.Stripe.Schemas.Checkout_session do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Checkout Session represents your customer's session as they pay for
  one-time purchases or subscriptions through [Checkout](https://stripe.com/docs/payments/checkout)
  or [Payment Links](https://stripe.com/docs/payments/payment-links). We recommend creating a
  new Session each time your customer attempts to pay.

  Once payment is successful, the Checkout Session will contain a reference
  to the [Customer](https://stripe.com/docs/api/customers), and either the successful
  [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active
  [Subscription](https://stripe.com/docs/api/subscriptions).

  You can create a Checkout Session on your server and pass its ID to the
  client to begin Checkout.

  Related guide: [Checkout Server Quickstart](https://stripe.com/docs/payments/checkout/api).

  **:payment_status** :: *:string*

  The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`.
  You can use this value to decide when to fulfill your customer's order.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:payment_method_options** :: *ExOAPI.Stripe.Schemas.CheckoutSessionPaymentMethodOptions*

  Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession.


  **::data** :: *ExOAPI.Stripe.Schemas.Item*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:customer_creation** :: *:string*

  Configure whether a Checkout Session creates a Customer when the Checkout Session completes.


  **:payment_link** :: *ExOAPI.Stripe.Schemas.PaymentLink | :string*

  The ID of the Payment Link that created this Session.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **::payment_method_types** :: *:string*


  **:locale** :: *:string*

  The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.


  **:shipping_address_collection** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionShippingAddressCollection*

  When set, provides configuration for Checkout to collect a shipping address from a customer.


  **:consent_collection** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionConsentCollection*

  When set, provides configuration for the Checkout Session to gather active consent from customers.


  **:payment_intent** :: *ExOAPI.Stripe.Schemas.PaymentIntent | :string*

  The ID of the PaymentIntent for Checkout Sessions in `payment` mode.


  **:customer_email** :: *:string*

  If provided, this value will be used when the Customer object is created.
  If not provided, customers will be asked to enter their email address.
  Use this parameter to prefill customer data if you already have an email
  on file. To access information about the customer once the payment flow is
  complete, use the `customer` attribute.


  **:customer_details** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionCustomerDetails*

  The customer details including the customer's tax exempt status and the customer's tax IDs. Only present on Sessions in `payment` or `subscription` mode.


  **:phone_number_collection** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionPhoneNumberCollection*


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer for this Session.
  For Checkout Sessions in `payment` or `subscription` mode, Checkout
  will create a new customer object based on information provided
  during the payment flow unless an existing customer was provided when
  the Session was created.


  **:submit_type** :: *:string*

  Describes the type of transaction being performed by Checkout in order to customize
  relevant text on the page, such as the submit button. `submit_type` can only be
  specified on Checkout Sessions in `payment` mode, but not Checkout Sessions
  in `subscription` or `setup` mode.


  **:mode** :: *:string*

  The mode of the Checkout Session.


  **:success_url** :: *:string*

  The URL the customer will be directed to after the payment or
  subscription creation is successful.


  **:recovered_from** :: *:string*

  The ID of the original expired Checkout Session that triggered the recovery flow.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:total_details** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTotalDetails*

  Tax and discount details for the computed total amount.


  **:expires_at** :: *:integer*

  The timestamp at which the Checkout Session will expire.


  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAutomaticTax*


  **:setup_intent** :: *ExOAPI.Stripe.Schemas.SetupIntent | :string*

  The ID of the SetupIntent for Checkout Sessions in `setup` mode.


  **:client_reference_id** :: *:string*

  A unique string to reference the Checkout Session. This can be a
  customer ID, a cart ID, or similar, and can be used to reconcile the
  Session with your internal systems.


  **:after_expiration** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAfterExpiration*

  When set, provides configuration for actions to take if this Checkout Session expires.


  **:tax_id_collection** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTaxIdCollection*


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:amount_subtotal** :: *:integer*

  Total of all items before discounts or taxes are applied.


  **:amount_total** :: *:integer*

  Total of all items after discounts and taxes are applied.


  **:url** :: *:string*

  The URL to the Checkout Session. Redirect customers to this URL to take them to Checkout. If you’re using [Custom Domains](https://stripe.com/docs/payments/checkout/custom-domains), the URL will use your subdomain. Otherwise, it’ll use `checkout.stripe.com.`


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription | :string*

  The ID of the subscription for Checkout Sessions in `subscription` mode.


  **:allow_promotion_codes** :: *:boolean*

  Enables user redeemable promotion codes.


  **:shipping_rate** :: *ExOAPI.Stripe.Schemas.ShippingRate | :string*

  The ID of the ShippingRate for Checkout Sessions in `payment` mode.


  **:billing_address_collection** :: *:string*

  Describes whether Checkout should collect the customer's billing address.


  **:cancel_url** :: *:string*

  The URL the customer will be directed to if they decide to cancel payment and return to your website.


  **:status** :: *:string*

  The status of the Checkout Session, one of `open`, `complete`, or `expired`.


  **:consent** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionConsent*

  Results of `consent_collection` for this session.


  **:id** :: *:string*

  Unique identifier for the object. Used to pass to `redirectToCheckout`
  in Stripe.js.


  **::shipping_options** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionShippingOption*


  **:shipping** :: *ExOAPI.Stripe.Schemas.Shipping*

  Shipping information for this Checkout Session.


  """

  @primary_key false
  typed_embedded_schema do
    field(:payment_status, Ecto.Enum, values: [:unpaid, :paid, :no_payment_required])

    field(:livemode, :boolean)

    field(:payment_method_options, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.CheckoutSessionPaymentMethodOptions]
    )

    field(:line_items, :map)

    field(:customer_creation, Ecto.Enum, values: [:if_required, :always])

    field(:payment_link, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentLink]
    )

    field(:metadata, :map)

    field(:payment_method_types, {:array, :string})

    field(:locale, Ecto.Enum,
      values: [
        :"zh-TW",
        :"zh-HK",
        :zh,
        :vi,
        :tr,
        :th,
        :sv,
        :sl,
        :sk,
        :ru,
        :ro,
        :"pt-BR",
        :pt,
        :pl,
        :nl,
        :nb,
        :mt,
        :ms,
        :lv,
        :lt,
        :ko,
        :ja,
        :it,
        :id,
        :hu,
        :hr,
        :"fr-CA",
        :fr,
        :fil,
        :fi,
        :et,
        :"es-419",
        :es,
        :"en-GB",
        :en,
        :el,
        :de,
        :da,
        :cs,
        :bg,
        :auto
      ]
    )

    field(:shipping_address_collection, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionShippingAddressCollection]
    )

    field(:consent_collection, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionConsentCollection]
    )

    field(:payment_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentIntent]
    )

    field(:customer_email, :string)

    field(:customer_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionCustomerDetails]
    )

    embeds_one(
      :phone_number_collection,
      ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionPhoneNumberCollection
    )

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:submit_type, Ecto.Enum, values: [:pay, :donate, :book, :auto])

    field(:mode, Ecto.Enum, values: [:subscription, :setup, :payment])

    field(:success_url, :string)

    field(:recovered_from, :string)

    field(:object, Ecto.Enum, values: [:"checkout.session"])

    field(:total_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTotalDetails]
    )

    field(:expires_at, :integer)

    embeds_one(:automatic_tax, ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAutomaticTax)

    field(:setup_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SetupIntent]
    )

    field(:client_reference_id, :string)

    field(:after_expiration, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAfterExpiration]
    )

    embeds_one(
      :tax_id_collection,
      ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTaxIdCollection
    )

    field(:currency, :string)

    field(:amount_subtotal, :integer)

    field(:amount_total, :integer)

    field(:url, :string)

    field(:subscription, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Subscription]
    )

    field(:allow_promotion_codes, :boolean)

    field(:shipping_rate, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.ShippingRate]
    )

    field(:billing_address_collection, Ecto.Enum, values: [:required, :auto])

    field(:cancel_url, :string)

    field(:status, Ecto.Enum, values: [:open, :expired, :complete])

    field(:consent, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionConsent]
    )

    field(:id, :string)

    embeds_many(
      :shipping_options,
      ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionShippingOption
    )

    field(:shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Shipping])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :shipping,
      :id,
      :consent,
      :status,
      :cancel_url,
      :billing_address_collection,
      :shipping_rate,
      :allow_promotion_codes,
      :subscription,
      :url,
      :amount_total,
      :amount_subtotal,
      :currency,
      :after_expiration,
      :client_reference_id,
      :setup_intent,
      :expires_at,
      :total_details,
      :object,
      :recovered_from,
      :success_url,
      :mode,
      :submit_type,
      :customer,
      :customer_details,
      :customer_email,
      :payment_intent,
      :consent_collection,
      :shipping_address_collection,
      :locale,
      :payment_method_types,
      :metadata,
      :payment_link,
      :customer_creation,
      :line_items,
      :payment_method_options,
      :livemode,
      :payment_status
    ])
    |> validate_required([
      :id,
      :cancel_url,
      :expires_at,
      :object,
      :success_url,
      :mode,
      :livemode,
      :payment_status
    ])
    |> cast_embed(:shipping_options)
    |> cast_embed(:tax_id_collection)
    |> cast_embed(:automatic_tax, required: true)
    |> cast_embed(:phone_number_collection)
  end
end