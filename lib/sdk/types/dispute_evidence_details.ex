defmodule ExOAPI.Stripe.Schemas.DisputeEvidenceDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:due_by** :: *:integer*

  Date by which evidence must be submitted in order to successfully challenge dispute. Will be null if the customer's bank or credit card company doesn't allow a response for this particular dispute.


  **:has_evidence** :: *:boolean*

  Whether evidence has been staged for this dispute.


  **:past_due** :: *:boolean*

  Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is *not* guaranteed.


  **:submission_count** :: *:integer*

  The number of times evidence has been submitted. Typically, you may only submit evidence once.


  """

  @primary_key false
  typed_embedded_schema do
    field(:due_by, :integer)

    field(:has_evidence, :boolean)

    field(:past_due, :boolean)

    field(:submission_count, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:submission_count, :past_due, :has_evidence, :due_by])
    |> validate_required([:submission_count, :past_due, :has_evidence])
  end
end