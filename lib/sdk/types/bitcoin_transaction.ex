defmodule ExOAPI.Stripe.Schemas.BitcoinTransaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount of `currency` that the transaction was converted to in real-time.


  **:bitcoin_amount** :: *:integer*

  The amount of bitcoin contained in the transaction.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which this transaction was converted.


  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:receiver** :: *:string*

  The receiver to which this transaction was sent.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:bitcoin_amount, :integer)

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:bitcoin_transaction])

    field(:receiver, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:receiver, :object, :id, :currency, :created, :bitcoin_amount, :amount])
    |> validate_required([:receiver, :object, :id, :currency, :created, :bitcoin_amount, :amount])
  end
end