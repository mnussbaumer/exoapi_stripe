defmodule ExOAPI.Stripe.Schemas.IssuingCardholderIndividualDob do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:day** :: *:integer*

  The day of birth, between 1 and 31.


  **:month** :: *:integer*

  The month of birth, between 1 and 12.


  **:year** :: *:integer*

  The four-digit year of birth.


  """

  @primary_key false
  typed_embedded_schema do
    field(:day, :integer)

    field(:month, :integer)

    field(:year, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:year, :month, :day])
  end
end