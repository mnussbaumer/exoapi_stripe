defmodule ExOAPI.Stripe.Schemas.Issuing_dispute do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: As a [card issuer](https://stripe.com/docs/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.

  Related guide: [Disputing Transactions](https://stripe.com/docs/issuing/purchases/disputes)

  **:amount** :: *:integer*

  Disputed amount. Usually the amount of the `transaction`, but can differ (usually because of currency fluctuation).


  **::balance_transactions** :: *ExOAPI.Stripe.Schemas.BalanceTransaction*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  The currency the `transaction` was made in.


  **:evidence** :: *ExOAPI.Stripe.Schemas.IssuingDisputeEvidence*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:status** :: *:string*

  Current status of the dispute.


  **:transaction** :: *ExOAPI.Stripe.Schemas.Issuing_transaction | :string*

  The transaction being disputed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    embeds_many(:balance_transactions, ExOAPI.Stripe.Schemas.BalanceTransaction)

    field(:created, :integer)

    field(:currency, :string)

    embeds_one(:evidence, ExOAPI.Stripe.Schemas.IssuingDisputeEvidence)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"issuing.dispute"])

    field(:status, Ecto.Enum, values: [:won, :unsubmitted, :submitted, :lost, :expired])

    field(:transaction, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Issuing_transaction]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transaction,
      :status,
      :object,
      :metadata,
      :livemode,
      :id,
      :currency,
      :created,
      :amount
    ])
    |> validate_required([
      :transaction,
      :status,
      :object,
      :metadata,
      :livemode,
      :id,
      :currency,
      :created,
      :amount
    ])
    |> cast_embed(:evidence, required: true)
    |> cast_embed(:balance_transactions)
  end
end