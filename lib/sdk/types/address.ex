defmodule ExOAPI.Stripe.Schemas.Address do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:city** :: *:string*

  City, district, suburb, town, or village.


  **:country** :: *:string*

  Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).


  **:line1** :: *:string*

  Address line 1 (e.g., street, PO Box, or company name).


  **:line2** :: *:string*

  Address line 2 (e.g., apartment, suite, unit, or building).


  **:postal_code** :: *:string*

  ZIP or postal code.


  **:state** :: *:string*

  State, county, province, or region.


  """

  @primary_key false
  typed_embedded_schema do
    field(:city, :string)

    field(:country, :string)

    field(:line1, :string)

    field(:line2, :string)

    field(:postal_code, :string)

    field(:state, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:state, :postal_code, :line2, :line1, :country, :city])
  end
end