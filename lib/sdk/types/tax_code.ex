defmodule ExOAPI.Stripe.Schemas.TaxCode do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: [Tax codes](https://stripe.com/docs/tax/tax-codes) classify goods and services for tax purposes.

  **:description** :: *:string*

  A detailed description of which types of products the tax code represents.


  **:id** :: *:string*

  Unique identifier for the object.


  **:name** :: *:string*

  A short name for the tax code.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:description, :string)

    field(:id, :string)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:tax_code])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :name, :id, :description])
    |> validate_required([:object, :name, :id, :description])
  end
end