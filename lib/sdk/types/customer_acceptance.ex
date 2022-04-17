defmodule ExOAPI.Stripe.Schemas.CustomerAcceptance do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:accepted_at** :: *:integer*

  The time at which the customer accepted the Mandate.


  **:offline** :: *list(:map)*


  **:online** :: *ExOAPI.Stripe.Schemas.OnlineAcceptance*


  **:type** :: *:string*

  The type of customer acceptance information included with the Mandate. One of `online` or `offline`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:accepted_at, :integer)

    field(:offline, {:array, :map})

    embeds_one(:online, ExOAPI.Stripe.Schemas.OnlineAcceptance)

    field(:type, Ecto.Enum, values: [:online, :offline])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :offline, :accepted_at])
    |> validate_required([:type])
    |> cast_embed(:online)
  end
end