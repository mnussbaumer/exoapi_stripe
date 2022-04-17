defmodule ExOAPI.Stripe.Schemas.AccountFutureRequirements do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::alternatives** :: *ExOAPI.Stripe.Schemas.AccountRequirementsAlternative*


  **:current_deadline** :: *:integer*

  Date on which `future_requirements` merges with the main `requirements` hash and `future_requirements` becomes empty. After the transition, `currently_due` requirements may immediately become `past_due`, but the account may also be given a grace period depending on its enablement state prior to transitioning.


  **::currently_due** :: *:string*


  **:disabled_reason** :: *:string*

  This is typed as a string for consistency with `requirements.disabled_reason`, but it safe to assume `future_requirements.disabled_reason` is empty because fields in `future_requirements` will never disable the account.


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