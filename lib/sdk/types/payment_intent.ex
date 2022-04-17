defmodule ExOAPI.Stripe.Schemas.PaymentIntent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A PaymentIntent guides you through the process of collecting a payment from your customer.
  We recommend that you create exactly one PaymentIntent for each order or
  customer session in your system. You can reference the PaymentIntent later to
  see the history of payment attempts for a particular session.

  A PaymentIntent transitions through
  [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses)
  throughout its lifetime as it interfaces with Stripe.js to perform
  authentication flows and ultimately creates at most one successful charge.

  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).

  **:setup_future_usage** :: *:string*

  Indicates that you intend to make future payments with this PaymentIntent's payment method.

  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.

  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).


  **:payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of the payment method used in this PaymentIntent.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:processing** :: *ExOAPI.Stripe.Schemas.PaymentIntentProcessing*

  If present, this property tells you about the processing state of the payment.


  **:capture_method** :: *:string*

  Controls when the funds will be captured from the customer's account.


  **:payment_method_options** :: *ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptions*

  Payment-method-specific configuration for this PaymentIntent.


  **::data** :: *ExOAPI.Stripe.Schemas.Charge*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:amount_received** :: *:integer*

  Amount that was collected by this PaymentIntent.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **::payment_method_types** :: *:string*


  **:amount_capturable** :: *:integer*

  Amount that can be captured from this PaymentIntent.


  **:review** :: *ExOAPI.Stripe.Schemas.Review | :string*

  ID of the review associated with this PaymentIntent, if any.


  **:confirmation_method** :: *:string*


  **:next_action** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextAction*

  If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.


  **:on_behalf_of** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  ID of the Customer this PaymentIntent belongs to, if one exists.

  Payment methods attached to other Customers cannot be used with this PaymentIntent.

  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.


  **:amount** :: *:integer*

  Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).


  **:invoice** :: *ExOAPI.Stripe.Schemas.Invoice | :string*

  ID of the invoice that created this PaymentIntent, if it exists.


  **:automatic_payment_methods** :: *ExOAPI.Stripe.Schemas.PaymentFlowsAutomaticPaymentMethodsPaymentIntent*

  Settings to configure compatible payment methods from the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods)


  **:statement_descriptor** :: *:string*

  For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.


  **:application** :: *ExOAPI.Stripe.Schemas.Application | :string*

  ID of the Connect application that created the PaymentIntent.


  **:client_secret** :: *:string*

  The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key. 

  The client secret can be used to complete a payment from your frontend. It should not be stored, logged, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.

  Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?ui=elements) and learn about how `client_secret` should be handled.


  **:receipt_email** :: *:string*

  Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:last_payment_error** :: *ExOAPI.Stripe.Schemas.ApiErrors*

  The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.


  **:canceled_at** :: *:integer*

  Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:cancellation_reason** :: *:string*

  Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).


  **:status** :: *:string*

  Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).


  **:transfer_group** :: *:string*

  A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.


  **:application_fee_amount** :: *:integer*

  The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).


  **:statement_descriptor_suffix** :: *:string*

  Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.


  **:transfer_data** :: *ExOAPI.Stripe.Schemas.TransferData*

  The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.


  **:id** :: *:string*

  Unique identifier for the object.


  **:shipping** :: *ExOAPI.Stripe.Schemas.Shipping*

  Shipping information for this PaymentIntent.


  """

  @primary_key false
  typed_embedded_schema do
    field(:setup_future_usage, Ecto.Enum, values: [:on_session, :off_session])

    field(:payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    field(:livemode, :boolean)

    field(:processing, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentProcessing]
    )

    field(:capture_method, Ecto.Enum, values: [:manual, :automatic])

    field(:payment_method_options, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentPaymentMethodOptions]
    )

    field(:charges, :map)

    field(:amount_received, :integer)

    field(:metadata, :map)

    field(:description, :string)

    field(:payment_method_types, {:array, :string})

    field(:amount_capturable, :integer)

    field(:review, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Review])

    field(:confirmation_method, Ecto.Enum, values: [:manual, :automatic])

    field(:next_action, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentNextAction]
    )

    field(:on_behalf_of, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:amount, :integer)

    field(:invoice, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Invoice])

    field(:automatic_payment_methods, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentFlowsAutomaticPaymentMethodsPaymentIntent]
    )

    field(:statement_descriptor, :string)

    field(:application, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Application]
    )

    field(:client_secret, :string)

    field(:receipt_email, :string)

    field(:object, Ecto.Enum, values: [:payment_intent])

    field(:last_payment_error, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.ApiErrors])

    field(:canceled_at, :integer)

    field(:currency, :string)

    field(:created, :integer)

    field(:cancellation_reason, Ecto.Enum,
      values: [
        :void_invoice,
        :requested_by_customer,
        :fraudulent,
        :failed_invoice,
        :duplicate,
        :automatic,
        :abandoned
      ]
    )

    field(:status, Ecto.Enum,
      values: [
        :succeeded,
        :requires_payment_method,
        :requires_confirmation,
        :requires_capture,
        :requires_action,
        :processing,
        :canceled
      ]
    )

    field(:transfer_group, :string)

    field(:application_fee_amount, :integer)

    field(:statement_descriptor_suffix, :string)

    field(:transfer_data, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.TransferData])

    field(:id, :string)

    field(:shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Shipping])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :shipping,
      :id,
      :transfer_data,
      :statement_descriptor_suffix,
      :application_fee_amount,
      :transfer_group,
      :status,
      :cancellation_reason,
      :created,
      :currency,
      :canceled_at,
      :last_payment_error,
      :object,
      :receipt_email,
      :client_secret,
      :application,
      :statement_descriptor,
      :automatic_payment_methods,
      :invoice,
      :amount,
      :customer,
      :on_behalf_of,
      :next_action,
      :confirmation_method,
      :review,
      :amount_capturable,
      :payment_method_types,
      :description,
      :metadata,
      :amount_received,
      :charges,
      :payment_method_options,
      :capture_method,
      :processing,
      :livemode,
      :payment_method,
      :setup_future_usage
    ])
    |> validate_required([
      :id,
      :status,
      :created,
      :currency,
      :object,
      :amount,
      :confirmation_method,
      :capture_method,
      :livemode
    ])
  end
end