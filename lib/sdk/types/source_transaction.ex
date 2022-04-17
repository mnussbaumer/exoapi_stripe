defmodule ExOAPI.Stripe.Schemas.SourceTransaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Some payment methods have no required amount that a customer must send.
  Customers can be instructed to send any amount, and it can be made up of
  multiple transactions. As such, sources can have multiple associated
  transactions.

  **:ach_credit_transfer** :: *ExOAPI.Stripe.Schemas.SourceTransactionAchCreditTransferData*


  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed to the receiver.


  **:chf_credit_transfer** :: *ExOAPI.Stripe.Schemas.SourceTransactionChfCreditTransferData*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:gbp_credit_transfer** :: *ExOAPI.Stripe.Schemas.SourceTransactionGbpCreditTransferData*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:paper_check** :: *ExOAPI.Stripe.Schemas.SourceTransactionPaperCheckData*


  **:sepa_credit_transfer** :: *ExOAPI.Stripe.Schemas.SourceTransactionSepaCreditTransferData*


  **:source** :: *ExOAPI.Stripe.Schemas.Source*

  The ID of the source this transaction is attached to.


  **:status** :: *:string*

  The status of the transaction, one of `succeeded`, `pending`, or `failed`.


  **:type** :: *:string*

  The type of source this transaction is attached to.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:ach_credit_transfer, ExOAPI.Stripe.Schemas.SourceTransactionAchCreditTransferData)

    field(:amount, :integer)

    embeds_one(:chf_credit_transfer, ExOAPI.Stripe.Schemas.SourceTransactionChfCreditTransferData)

    field(:created, :integer)

    field(:currency, :string)

    embeds_one(:gbp_credit_transfer, ExOAPI.Stripe.Schemas.SourceTransactionGbpCreditTransferData)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:source_transaction])

    embeds_one(:paper_check, ExOAPI.Stripe.Schemas.SourceTransactionPaperCheckData)

    embeds_one(
      :sepa_credit_transfer,
      ExOAPI.Stripe.Schemas.SourceTransactionSepaCreditTransferData
    )

    field(:source, :string)

    field(:status, :string)

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
        :alipay,
        :ach_debit,
        :ach_credit_transfer
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :status,
      :source,
      :object,
      :livemode,
      :id,
      :currency,
      :created,
      :amount
    ])
    |> validate_required([
      :type,
      :status,
      :source,
      :object,
      :livemode,
      :id,
      :currency,
      :created,
      :amount
    ])
    |> cast_embed(:sepa_credit_transfer)
    |> cast_embed(:paper_check)
    |> cast_embed(:gbp_credit_transfer)
    |> cast_embed(:chf_credit_transfer)
    |> cast_embed(:ach_credit_transfer)
  end
end