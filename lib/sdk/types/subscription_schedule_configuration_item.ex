defmodule ExOAPI.Stripe.Schemas.SubscriptionScheduleConfigurationItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A phase item describes the price and quantity of a phase.

  **:billing_thresholds** :: *ExOAPI.Stripe.Schemas.SubscriptionItemBillingThresholds*

  Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period


  **:price** :: *ExOAPI.Stripe.Schemas.DeletedPrice | ExOAPI.Stripe.Schemas.Price | :string*

  ID of the price to which the customer should be subscribed.


  **:quantity** :: *:integer*

  Quantity of the plan to which the customer should be subscribed.


  **::tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  """

  @primary_key false
  typed_embedded_schema do
    field(:billing_thresholds, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionItemBillingThresholds]
    )

    field(:price, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Price, ExOAPI.Stripe.Schemas.DeletedPrice]
    )

    field(:quantity, :integer)

    embeds_many(:tax_rates, ExOAPI.Stripe.Schemas.TaxRate)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:quantity, :price, :billing_thresholds])
    |> validate_required([:price])
    |> cast_embed(:tax_rates)
  end
end