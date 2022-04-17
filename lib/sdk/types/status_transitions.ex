defmodule ExOAPI.Stripe.Schemas.StatusTransitions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:canceled** :: *:integer*

  The time that the order was canceled.


  **:fulfiled** :: *:integer*

  The time that the order was fulfilled.


  **:paid** :: *:integer*

  The time that the order was paid.


  **:returned** :: *:integer*

  The time that the order was returned.


  """

  @primary_key false
  typed_embedded_schema do
    field(:canceled, :integer)

    field(:fulfiled, :integer)

    field(:paid, :integer)

    field(:returned, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:returned, :paid, :fulfiled, :canceled])
  end
end