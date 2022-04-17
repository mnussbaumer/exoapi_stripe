defmodule ExOAPI.Stripe.Schemas.IssuingTransactionReceiptData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:description** :: *:string*

  The description of the item. The maximum length of this field is 26 characters.


  **:quantity** :: *:number*

  The quantity of the item.


  **:total** :: *:integer*

  The total for this line item in cents.


  **:unit_cost** :: *:integer*

  The unit cost of the item in cents.


  """

  @primary_key false
  typed_embedded_schema do
    field(:description, :string)

    field(:quantity, :float)

    field(:total, :integer)

    field(:unit_cost, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:unit_cost, :total, :quantity, :description])
  end
end