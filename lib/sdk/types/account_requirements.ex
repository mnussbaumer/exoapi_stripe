defmodule ExOAPI.Stripe.Schemas.AccountRequirements do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::alternatives** :: *ExOAPI.Stripe.Schemas.AccountRequirementsAlternative*


  **:current_deadline** :: *:integer*

  Date by which the fields in `currently_due` must be collected to keep the account enabled. These fields may disable the account sooner if the next threshold is reached before they are collected.


  **::currently_due** :: *:string*


  **:disabled_reason** :: *:string*

  If the account is disabled, this string describes why. Can be `requirements.past_due`, `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`, `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.


  **::errors** :: *ExOAPI.Stripe.Schemas.AccountRequirementsError*


  **::eventually_due** :: *:string*


  **::past_due** :: *:string*


  **::pending_verification** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:alternatives, ExOAPI.Stripe.Schemas.AccountRequirementsAlternative)

    field(:current_deadline, :integer)

    field(:currently_due, {:array, :string})

    field(:disabled_reason, :string)

    embeds_many(:errors, ExOAPI.Stripe.Schemas.AccountRequirementsError)

    field(:eventually_due, {:array, :string})

    field(:past_due, {:array, :string})

    field(:pending_verification, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :pending_verification,
      :past_due,
      :eventually_due,
      :disabled_reason,
      :currently_due,
      :current_deadline
    ])
    |> cast_embed(:errors)
    |> cast_embed(:alternatives)
  end
end