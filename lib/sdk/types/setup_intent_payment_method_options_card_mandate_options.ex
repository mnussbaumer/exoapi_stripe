defmodule ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsCardMandateOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  Amount to be charged for future payments.


  **:amount_type** :: *:string*

  One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the amount charged can be up to the value passed for the `amount` param.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  A description of the mandate or subscription that is meant to be displayed to the customer.


  **:end_date** :: *:integer*

  End date of the mandate or subscription. If not provided, the mandate will be active until canceled. If provided, end date should be after start date.


  **:interval** :: *:string*

  Specifies payment frequency. One of `day`, `week`, `month`, `year`, or `sporadic`.


  **:interval_count** :: *:integer*

  The number of intervals between payments. For example, `interval=month` and `interval_count=3` indicates one payment every three months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks). This parameter is optional when `interval=sporadic`.


  **:reference** :: *:string*

  Unique identifier for the mandate or subscription.


  **:start_date** :: *:integer*

  Start date of the mandate or subscription. Start date should not be lesser than yesterday.


  **::supported_types** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_type, Ecto.Enum, values: [:maximum, :fixed])

    field(:currency, :string)

    field(:description, :string)

    field(:end_date, :integer)

    field(:interval, Ecto.Enum, values: [:year, :week, :sporadic, :month, :day])

    field(:interval_count, :integer)

    field(:reference, :string)

    field(:start_date, :integer)

    field(:supported_types, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :supported_types,
      :start_date,
      :reference,
      :interval_count,
      :interval,
      :end_date,
      :description,
      :currency,
      :amount_type,
      :amount
    ])
    |> validate_required([:start_date, :reference, :interval, :currency, :amount_type, :amount])
  end
end