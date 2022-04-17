defmodule ExOAPI.Stripe.Schemas.RadarReviewResourceLocation do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:city** :: *:string*

  The city where the payment originated.


  **:country** :: *:string*

  Two-letter ISO code representing the country where the payment originated.


  **:latitude** :: *:number*

  The geographic latitude where the payment originated.


  **:longitude** :: *:number*

  The geographic longitude where the payment originated.


  **:region** :: *:string*

  The state/county/province/region where the payment originated.


  """

  @primary_key false
  typed_embedded_schema do
    field(:city, :string)

    field(:country, :string)

    field(:latitude, :float)

    field(:longitude, :float)

    field(:region, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:region, :longitude, :latitude, :country, :city])
  end
end