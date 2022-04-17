defmodule ExOAPI.Stripe.Schemas.IssuingCardAuthorizationControls do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::allowed_categories** :: *:string*


  **::blocked_categories** :: *:string*


  **::spending_limits** :: *ExOAPI.Stripe.Schemas.IssuingCardSpendingLimit*


  **:spending_limits_currency** :: *:string*

  Currency of the amounts within `spending_limits`. Always the same as the currency of the card.


  """

  @primary_key false
  typed_embedded_schema do
    field(:allowed_categories, {:array, :string})

    field(:blocked_categories, {:array, :string})

    embeds_many(:spending_limits, ExOAPI.Stripe.Schemas.IssuingCardSpendingLimit)

    field(:spending_limits_currency, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:spending_limits_currency, :blocked_categories, :allowed_categories])
    |> cast_embed(:spending_limits)
  end
end