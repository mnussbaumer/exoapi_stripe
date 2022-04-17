defmodule ExOAPI.Stripe.Schemas.LegalEntityJapanAddress do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:city** :: *:string*

  City/Ward.


  **:country** :: *:string*

  Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).


  **:line1** :: *:string*

  Block/Building number.


  **:line2** :: *:string*

  Building details.


  **:postal_code** :: *:string*

  ZIP or postal code.


  **:state** :: *:string*

  Prefecture.


  **:town** :: *:string*

  Town/cho-me.


  """

  @primary_key false
  typed_embedded_schema do
    field(:city, :string)

    field(:country, :string)

    field(:line1, :string)

    field(:line2, :string)

    field(:postal_code, :string)

    field(:state, :string)

    field(:town, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:town, :state, :postal_code, :line2, :line1, :country, :city])
  end
end