defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardInstallments do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::available_plans** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan*


  **:enabled** :: *:boolean*

  Whether Installments are enabled for this PaymentIntent.


  **:plan** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan*

  Installment plan selected for this PaymentIntent.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:available_plans, ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan)

    field(:enabled, :boolean)

    field(:plan, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardInstallmentsPlan]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:plan, :enabled])
    |> validate_required([:enabled])
    |> cast_embed(:available_plans)
  end
end