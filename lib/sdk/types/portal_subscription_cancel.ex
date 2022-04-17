defmodule ExOAPI.Stripe.Schemas.PortalSubscriptionCancel do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:cancellation_reason** :: *ExOAPI.Stripe.Schemas.PortalSubscriptionCancellationReason*


  **:enabled** :: *:boolean*

  Whether the feature is enabled.


  **:mode** :: *:string*

  Whether to cancel subscriptions immediately or at the end of the billing period.


  **:proration_behavior** :: *:string*

  Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:cancellation_reason, ExOAPI.Stripe.Schemas.PortalSubscriptionCancellationReason)

    field(:enabled, :boolean)

    field(:mode, Ecto.Enum, values: [:immediately, :at_period_end])

    field(:proration_behavior, Ecto.Enum, values: [:none, :create_prorations, :always_invoice])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:proration_behavior, :mode, :enabled])
    |> validate_required([:proration_behavior, :mode, :enabled])
    |> cast_embed(:cancellation_reason, required: true)
  end
end