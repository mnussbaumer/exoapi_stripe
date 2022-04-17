defmodule ExOAPI.Stripe.Schemas.SkuInventory do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:quantity** :: *:integer*

  The count of inventory available. Will be present if and only if `type` is `finite`.


  **:type** :: *:string*

  Inventory type. Possible values are `finite`, `bucket` (not quantified), and `infinite`.


  **:value** :: *:string*

  An indicator of the inventory available. Possible values are `in_stock`, `limited`, and `out_of_stock`. Will be present if and only if `type` is `bucket`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:quantity, :integer)

    field(:type, :string)

    field(:value, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:value, :type, :quantity])
    |> validate_required([:type])
  end
end