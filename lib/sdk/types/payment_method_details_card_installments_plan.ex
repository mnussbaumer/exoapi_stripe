defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:count** :: *:integer*

  For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card.


  **:interval** :: *:string*

  For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
  One of `month`.


  **:type** :: *:string*

  Type of installment plan, one of `fixed_count`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:count, :integer)

    field(:interval, Ecto.Enum, values: [:month])

    field(:type, Ecto.Enum, values: [:fixed_count])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :interval, :count])
    |> validate_required([:type])
  end
end