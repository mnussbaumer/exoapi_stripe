defmodule ExOAPI.Stripe.Schemas.IssuingTransactionFlightDataLeg do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:arrival_airport_code** :: *:string*

  The three-letter IATA airport code of the flight's destination.


  **:carrier** :: *:string*

  The airline carrier code.


  **:departure_airport_code** :: *:string*

  The three-letter IATA airport code that the flight departed from.


  **:flight_number** :: *:string*

  The flight number.


  **:service_class** :: *:string*

  The flight's service class.


  **:stopover_allowed** :: *:boolean*

  Whether a stopover is allowed on this flight.


  """

  @primary_key false
  typed_embedded_schema do
    field(:arrival_airport_code, :string)

    field(:carrier, :string)

    field(:departure_airport_code, :string)

    field(:flight_number, :string)

    field(:service_class, :string)

    field(:stopover_allowed, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :stopover_allowed,
      :service_class,
      :flight_number,
      :departure_airport_code,
      :carrier,
      :arrival_airport_code
    ])
  end
end