defmodule ExOAPI.Stripe.Schemas.CountrySpecVerificationFieldDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::additional** :: *:string*


  **::minimum** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:additional, {:array, :string})

    field(:minimum, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:minimum, :additional])
  end
end