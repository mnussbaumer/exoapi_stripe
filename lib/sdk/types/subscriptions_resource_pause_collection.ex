defmodule ExOAPI.Stripe.Schemas.SubscriptionsResourcePauseCollection do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: The Pause Collection settings determine how we will pause collection for this subscription and for how long the subscription
  should be paused.

  **:behavior** :: *:string*

  The payment collection behavior for this subscription while paused. One of `keep_as_draft`, `mark_uncollectible`, or `void`.


  **:resumes_at** :: *:integer*

  The time after which the subscription will resume collecting payments.


  """

  @primary_key false
  typed_embedded_schema do
    field(:behavior, Ecto.Enum, values: [:void, :mark_uncollectible, :keep_as_draft])

    field(:resumes_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:resumes_at, :behavior])
    |> validate_required([:behavior])
  end
end