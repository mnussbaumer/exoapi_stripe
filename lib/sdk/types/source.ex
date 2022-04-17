defmodule ExOAPI.Stripe.Schemas.Source do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: `Source` objects allow you to accept a variety of payment methods. They
  represent a customer's payment instrument, and can be used with the Stripe API
  just like a `Card` object: once chargeable, they can be charged, or can be
  attached to customers.

  Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).

  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:acss_debit** :: *ExOAPI.Stripe.Schemas.SourceTypeAcssDebit*


  **:ach_debit** :: *ExOAPI.Stripe.Schemas.SourceTypeAchDebit*


  **:alipay** :: *ExOAPI.Stripe.Schemas.SourceTypeAlipay*


  **:giropay** :: *ExOAPI.Stripe.Schemas.SourceTypeGiropay*


  **:redirect** :: *ExOAPI.Stripe.Schemas.SourceRedirectFlow*


  **:ideal** :: *ExOAPI.Stripe.Schemas.SourceTypeIdeal*


  **:code_verification** :: *ExOAPI.Stripe.Schemas.SourceCodeVerificationFlow*


  **:card** :: *ExOAPI.Stripe.Schemas.SourceTypeCard*


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:multibanco** :: *ExOAPI.Stripe.Schemas.SourceTypeMultibanco*


  **:usage** :: *:string*

  Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.


  **:receiver** :: *ExOAPI.Stripe.Schemas.SourceReceiverFlow*


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer*

  The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.


  **:ach_credit_transfer** :: *ExOAPI.Stripe.Schemas.SourceTypeAchCreditTransfer*


  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.


  **:statement_descriptor** :: *:string*

  Extra information about a source. This will appear on your customer's statement every time you charge the source.


  **:wechat** :: *ExOAPI.Stripe.Schemas.SourceTypeWechat*


  **:client_secret** :: *:string*

  The client secret of the source. Used for client-side retrieval using a publishable key.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:sofort** :: *ExOAPI.Stripe.Schemas.SourceTypeSofort*


  **:p24** :: *ExOAPI.Stripe.Schemas.SourceTypeP24*


  **:currency** :: *:string*

  Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:type** :: *:string*

  The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://stripe.com/docs/sources) used.


  **:status** :: *:string*

  The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.


  **:bancontact** :: *ExOAPI.Stripe.Schemas.SourceTypeBancontact*


  **:three_d_secure** :: *ExOAPI.Stripe.Schemas.SourceTypeThreeDSecure*


  **:au_becs_debit** :: *ExOAPI.Stripe.Schemas.SourceTypeAuBecsDebit*


  **:card_present** :: *ExOAPI.Stripe.Schemas.SourceTypeCardPresent*


  **:flow** :: *:string*

  The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`.


  **:sepa_debit** :: *ExOAPI.Stripe.Schemas.SourceTypeSepaDebit*


  **:klarna** :: *ExOAPI.Stripe.Schemas.SourceTypeKlarna*


  **:source_order** :: *ExOAPI.Stripe.Schemas.SourceOrder*


  **:id** :: *:string*

  Unique identifier for the object.


  **:owner** :: *ExOAPI.Stripe.Schemas.SourceOwner*

  Information about the owner of the payment instrument that may be used or required by particular source types.


  **:eps** :: *ExOAPI.Stripe.Schemas.SourceTypeEps*


  """

  @primary_key false
  typed_embedded_schema do
    field(:livemode, :boolean)

    embeds_one(:acss_debit, ExOAPI.Stripe.Schemas.SourceTypeAcssDebit)

    embeds_one(:ach_debit, ExOAPI.Stripe.Schemas.SourceTypeAchDebit)

    embeds_one(:alipay, ExOAPI.Stripe.Schemas.SourceTypeAlipay)

    embeds_one(:giropay, ExOAPI.Stripe.Schemas.SourceTypeGiropay)

    embeds_one(:redirect, ExOAPI.Stripe.Schemas.SourceRedirectFlow)

    embeds_one(:ideal, ExOAPI.Stripe.Schemas.SourceTypeIdeal)

    embeds_one(:code_verification, ExOAPI.Stripe.Schemas.SourceCodeVerificationFlow)

    embeds_one(:card, ExOAPI.Stripe.Schemas.SourceTypeCard)

    field(:metadata, :map)

    embeds_one(:multibanco, ExOAPI.Stripe.Schemas.SourceTypeMultibanco)

    field(:usage, :string)

    embeds_one(:receiver, ExOAPI.Stripe.Schemas.SourceReceiverFlow)

    field(:customer, :string)

    embeds_one(:ach_credit_transfer, ExOAPI.Stripe.Schemas.SourceTypeAchCreditTransfer)

    field(:amount, :integer)

    field(:statement_descriptor, :string)

    embeds_one(:wechat, ExOAPI.Stripe.Schemas.SourceTypeWechat)

    field(:client_secret, :string)

    field(:object, Ecto.Enum, values: [:source])

    embeds_one(:sofort, ExOAPI.Stripe.Schemas.SourceTypeSofort)

    embeds_one(:p24, ExOAPI.Stripe.Schemas.SourceTypeP24)

    field(:currency, :string)

    field(:created, :integer)

    field(:type, Ecto.Enum,
      values: [
        :wechat,
        :three_d_secure,
        :sofort,
        :sepa_debit,
        :p24,
        :multibanco,
        :klarna,
        :ideal,
        :giropay,
        :eps,
        :card_present,
        :card,
        :bancontact,
        :au_becs_debit,
        :alipay,
        :acss_debit,
        :ach_debit,
        :ach_credit_transfer
      ]
    )

    field(:status, :string)

    embeds_one(:bancontact, ExOAPI.Stripe.Schemas.SourceTypeBancontact)

    embeds_one(:three_d_secure, ExOAPI.Stripe.Schemas.SourceTypeThreeDSecure)

    embeds_one(:au_becs_debit, ExOAPI.Stripe.Schemas.SourceTypeAuBecsDebit)

    embeds_one(:card_present, ExOAPI.Stripe.Schemas.SourceTypeCardPresent)

    field(:flow, :string)

    embeds_one(:sepa_debit, ExOAPI.Stripe.Schemas.SourceTypeSepaDebit)

    embeds_one(:klarna, ExOAPI.Stripe.Schemas.SourceTypeKlarna)

    embeds_one(:source_order, ExOAPI.Stripe.Schemas.SourceOrder)

    field(:id, :string)

    field(:owner, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.SourceOwner])

    embeds_one(:eps, ExOAPI.Stripe.Schemas.SourceTypeEps)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :owner,
      :id,
      :flow,
      :status,
      :type,
      :created,
      :currency,
      :object,
      :client_secret,
      :statement_descriptor,
      :amount,
      :customer,
      :usage,
      :metadata,
      :livemode
    ])
    |> validate_required([
      :id,
      :flow,
      :status,
      :type,
      :created,
      :object,
      :client_secret,
      :livemode
    ])
    |> cast_embed(:eps)
    |> cast_embed(:source_order)
    |> cast_embed(:klarna)
    |> cast_embed(:sepa_debit)
    |> cast_embed(:card_present)
    |> cast_embed(:au_becs_debit)
    |> cast_embed(:three_d_secure)
    |> cast_embed(:bancontact)
    |> cast_embed(:p24)
    |> cast_embed(:sofort)
    |> cast_embed(:wechat)
    |> cast_embed(:ach_credit_transfer)
    |> cast_embed(:receiver)
    |> cast_embed(:multibanco)
    |> cast_embed(:card)
    |> cast_embed(:code_verification)
    |> cast_embed(:ideal)
    |> cast_embed(:redirect)
    |> cast_embed(:giropay)
    |> cast_embed(:alipay)
    |> cast_embed(:ach_debit)
    |> cast_embed(:acss_debit)
  end
end