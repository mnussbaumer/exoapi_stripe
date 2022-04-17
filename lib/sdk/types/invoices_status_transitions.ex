defmodule ExOAPI.Stripe.Schemas.InvoicesStatusTransitions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:finalized_at** :: *:integer*

  The time that the invoice draft was finalized.


  **:marked_uncollectible_at** :: *:integer*

  The time that the invoice was marked uncollectible.


  **:paid_at** :: *:integer*

  The time that the invoice was paid.


  **:voided_at** :: *:integer*

  The time that the invoice was voided.


  """

  @primary_key false
  typed_embedded_schema do
    field(:finalized_at, :integer)

    field(:marked_uncollectible_at, :integer)

    field(:paid_at, :integer)

    field(:voided_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:voided_at, :paid_at, :marked_uncollectible_at, :finalized_at])
  end
end