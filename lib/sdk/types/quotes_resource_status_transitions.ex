defmodule ExOAPI.Stripe.Schemas.QuotesResourceStatusTransitions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:accepted_at** :: *:integer*

  The time that the quote was accepted. Measured in seconds since Unix epoch.


  **:canceled_at** :: *:integer*

  The time that the quote was canceled. Measured in seconds since Unix epoch.


  **:finalized_at** :: *:integer*

  The time that the quote was finalized. Measured in seconds since Unix epoch.


  """

  @primary_key false
  typed_embedded_schema do
    field(:accepted_at, :integer)

    field(:canceled_at, :integer)

    field(:finalized_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:finalized_at, :canceled_at, :accepted_at])
  end
end