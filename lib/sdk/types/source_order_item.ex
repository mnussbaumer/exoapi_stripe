defmodule ExOAPI.Stripe.Schemas.SourceOrderItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount (price) for this order item.


  **:currency** :: *:string*

  This currency of this order item. Required when `amount` is present.


  **:description** :: *:string*

  Human-readable description for this order item.


  **:parent** :: *:string*

  The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).


  **:quantity** :: *:integer*

  The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.


  **:type** :: *:string*

  The type of this order item. Must be `sku`, `tax`, or `shipping`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:parent, :string)

    field(:quantity, :integer)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :quantity, :parent, :description, :currency, :amount])
  end
end