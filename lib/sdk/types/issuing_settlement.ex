defmodule ExOAPI.Stripe.Schemas.Issuing_settlement do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: When a non-stripe BIN is used, any use of an [issued card](https://stripe.com/docs/issuing) must be settled directly with the card network. The net amount owed is represented by an Issuing `Settlement` object.

  **:bin** :: *:string*

  The Bank Identification Number reflecting this settlement record.


  **:clearing_date** :: *:integer*

  The date that the transactions are cleared and posted to user's accounts.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:interchange_fees** :: *:integer*

  The total interchange received as reimbursement for the transactions.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:net_total** :: *:integer*

  The total net amount required to settle with the network.


  **:network** :: *:string*

  The card network for this settlement report. One of ["visa"]


  **:network_fees** :: *:integer*

  The total amount of fees owed to the network.


  **:network_settlement_identifier** :: *:string*

  The Settlement Identification Number assigned by the network.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:settlement_service** :: *:string*

  One of `international` or `uk_national_net`.


  **:transaction_count** :: *:integer*

  The total number of transactions reflected in this settlement.


  **:transaction_volume** :: *:integer*

  The total transaction amount reflected in this settlement.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bin, :string)

    field(:clearing_date, :integer)

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:interchange_fees, :integer)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:net_total, :integer)

    field(:network, Ecto.Enum, values: [:visa])

    field(:network_fees, :integer)

    field(:network_settlement_identifier, :string)

    field(:object, Ecto.Enum, values: [:"issuing.settlement"])

    field(:settlement_service, :string)

    field(:transaction_count, :integer)

    field(:transaction_volume, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transaction_volume,
      :transaction_count,
      :settlement_service,
      :object,
      :network_settlement_identifier,
      :network_fees,
      :network,
      :net_total,
      :metadata,
      :livemode,
      :interchange_fees,
      :id,
      :currency,
      :created,
      :clearing_date,
      :bin
    ])
    |> validate_required([
      :transaction_volume,
      :transaction_count,
      :settlement_service,
      :object,
      :network_settlement_identifier,
      :network_fees,
      :network,
      :net_total,
      :metadata,
      :livemode,
      :interchange_fees,
      :id,
      :currency,
      :created,
      :clearing_date,
      :bin
    ])
  end
end