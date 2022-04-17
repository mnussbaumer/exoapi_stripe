defmodule ExOAPI.Stripe.Schemas.IssuingCardholderRequirements do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:disabled_reason** :: *:string*

  If `disabled_reason` is present, all cards will decline authorizations with `cardholder_verification_required` reason.


  **::past_due** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:disabled_reason, Ecto.Enum, values: [:under_review, :"rejected.listed", :listed])

    field(:past_due, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:past_due, :disabled_reason])
  end
end