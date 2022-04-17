defmodule ExOAPI.Stripe.Schemas.PersonFutureRequirements do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::alternatives** :: *ExOAPI.Stripe.Schemas.AccountRequirementsAlternative*


  **::currently_due** :: *:string*


  **::errors** :: *ExOAPI.Stripe.Schemas.AccountRequirementsError*


  **::eventually_due** :: *:string*


  **::past_due** :: *:string*


  **::pending_verification** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:alternatives, ExOAPI.Stripe.Schemas.AccountRequirementsAlternative)

    field(:currently_due, {:array, :string})

    embeds_many(:errors, ExOAPI.Stripe.Schemas.AccountRequirementsError)

    field(:eventually_due, {:array, :string})

    field(:past_due, {:array, :string})

    field(:pending_verification, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:pending_verification, :past_due, :eventually_due, :currently_due])
    |> cast_embed(:errors, required: true)
    |> cast_embed(:alternatives)
  end
end