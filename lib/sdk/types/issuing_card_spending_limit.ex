defmodule ExOAPI.Stripe.Schemas.IssuingCardSpendingLimit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  Maximum amount allowed to spend per interval.


  **::categories** :: *:string*


  **:interval** :: *:string*

  Interval (or event) to which the amount applies.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:categories, {:array, :string})

    field(:interval, Ecto.Enum,
      values: [:yearly, :weekly, :per_authorization, :monthly, :daily, :all_time]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:interval, :categories, :amount])
    |> validate_required([:interval, :amount])
  end
end