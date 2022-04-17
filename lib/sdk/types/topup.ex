defmodule ExOAPI.Stripe.Schemas.Topup do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: To top up your Stripe balance, you create a top-up object. You can retrieve
  individual top-ups, as well as list all top-ups. Top-ups are identified by a
  unique, random ID.

  Related guide: [Topping Up your Platform Account](https://stripe.com/docs/connect/top-ups).

  **:amount** :: *:integer*

  Amount transferred.


  **:balance_transaction** :: *ExOAPI.Stripe.Schemas.BalanceTransaction | :string*

  ID of the balance transaction that describes the impact of this top-up on your account balance. May not be specified depending on status of top-up.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:expected_availability_date** :: *:integer*

  Date the funds are expected to arrive in your Stripe account for payouts. This factors in delays like weekends or bank holidays. May not be specified depending on status of top-up.


  **:failure_code** :: *:string*

  Error code explaining reason for top-up failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).


  **:failure_message** :: *:string*

  Message to user further explaining reason for top-up failure if available.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:source** :: *ExOAPI.Stripe.Schemas.Source*


  **:statement_descriptor** :: *:string*

  Extra information about a top-up. This will appear on your source's bank statement. It must contain at least one letter.


  **:status** :: *:string*

  The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or `succeeded`.


  **:transfer_group** :: *:string*

  A string that identifies this top-up as part of a group.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:balance_transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.BalanceTransaction]
    )

    field(:created, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:expected_availability_date, :integer)

    field(:failure_code, :string)

    field(:failure_message, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:topup])

    embeds_one(:source, ExOAPI.Stripe.Schemas.Source)

    field(:statement_descriptor, :string)

    field(:status, Ecto.Enum, values: [:succeeded, :reversed, :pending, :failed, :canceled])

    field(:transfer_group, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transfer_group,
      :status,
      :statement_descriptor,
      :object,
      :metadata,
      :livemode,
      :id,
      :failure_message,
      :failure_code,
      :expected_availability_date,
      :description,
      :currency,
      :created,
      :balance_transaction,
      :amount
    ])
    |> validate_required([
      :status,
      :object,
      :metadata,
      :livemode,
      :id,
      :currency,
      :created,
      :amount
    ])
    |> cast_embed(:source, required: true)
  end
end