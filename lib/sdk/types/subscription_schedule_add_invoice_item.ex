defmodule ExOAPI.Stripe.Schemas.SubscriptionScheduleAddInvoiceItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: An Add Invoice Item describes the prices and quantities that will be added as pending invoice items when entering a phase.

  **:price** :: *ExOAPI.Stripe.Schemas.DeletedPrice | ExOAPI.Stripe.Schemas.Price | :string*

  ID of the price used to generate the invoice item.


  **:quantity** :: *:integer*

  The quantity of the invoice item.


  **::tax_rates** :: *ExOAPI.Stripe.Schemas.TaxRate*


  """

  @primary_key false
  typed_embedded_schema do
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
    |> cast(params, [:quantity, :price])
    |> validate_required([:price])
    |> cast_embed(:tax_rates)
  end
end