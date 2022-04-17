defmodule ExOAPI.Stripe.Schemas.IssuingTransactionFlightData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:departure_at** :: *:integer*

  The time that the flight departed.


  **:passenger_name** :: *:string*

  The name of the passenger.


  **:refundable** :: *:boolean*

  Whether the ticket is refundable.


  **::segments** :: *ExOAPI.Stripe.Schemas.IssuingTransactionFlightDataLeg*


  **:travel_agency** :: *:string*

  The travel agency that issued the ticket.


  """

  @primary_key false
  typed_embedded_schema do
    field(:departure_at, :integer)

    field(:passenger_name, :string)

    field(:refundable, :boolean)

    embeds_many(:segments, ExOAPI.Stripe.Schemas.IssuingTransactionFlightDataLeg)

    field(:travel_agency, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:travel_agency, :refundable, :passenger_name, :departure_at])
    |> cast_embed(:segments)
  end
end