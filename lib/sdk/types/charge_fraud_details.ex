defmodule ExOAPI.Stripe.Schemas.ChargeFraudDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:stripe_report** :: *:string*

  Assessments from Stripe. If set, the value is `fraudulent`.


  **:user_report** :: *:string*

  Assessments reported by you. If set, possible values of are `safe` and `fraudulent`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:stripe_report, :string)

    field(:user_report, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:user_report, :stripe_report])
  end
end