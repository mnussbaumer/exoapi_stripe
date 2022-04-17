defmodule ExOAPI.Stripe.Schemas.RefundNextAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:display_details** :: *ExOAPI.Stripe.Schemas.RefundNextActionDisplayDetails*

  Contains the refund details.


  **:type** :: *:string*

  Type of the next action to perform.


  """

  @primary_key false
  typed_embedded_schema do
    field(:display_details, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.RefundNextActionDisplayDetails]
    )

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :display_details])
    |> validate_required([:type])
  end
end