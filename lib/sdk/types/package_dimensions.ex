defmodule ExOAPI.Stripe.Schemas.PackageDimensions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:height** :: *:number*

  Height, in inches.


  **:length** :: *:number*

  Length, in inches.


  **:weight** :: *:number*

  Weight, in ounces.


  **:width** :: *:number*

  Width, in inches.


  """

  @primary_key false
  typed_embedded_schema do
    field(:height, :float)

    field(:length, :float)

    field(:weight, :float)

    field(:width, :float)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:width, :weight, :length, :height])
    |> validate_required([:width, :weight, :length, :height])
  end
end