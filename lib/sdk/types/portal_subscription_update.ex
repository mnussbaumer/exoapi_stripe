defmodule ExOAPI.Stripe.Schemas.PortalSubscriptionUpdate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::default_allowed_updates** :: *:string*


  **:enabled** :: *:boolean*

  Whether the feature is enabled.


  **::products** :: *ExOAPI.Stripe.Schemas.PortalSubscriptionUpdateProduct*


  **:proration_behavior** :: *:string*

  Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:default_allowed_updates, {:array, :string})

    field(:enabled, :boolean)

    embeds_many(:products, ExOAPI.Stripe.Schemas.PortalSubscriptionUpdateProduct)

    field(:proration_behavior, Ecto.Enum, values: [:none, :create_prorations, :always_invoice])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:proration_behavior, :enabled, :default_allowed_updates])
    |> validate_required([:proration_behavior, :enabled])
    |> cast_embed(:products)
  end
end