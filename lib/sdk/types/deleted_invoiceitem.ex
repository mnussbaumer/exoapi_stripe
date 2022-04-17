defmodule ExOAPI.Stripe.Schemas.DeletedInvoiceitem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:deleted** :: *:boolean*

  Always true for a deleted object


  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:deleted, :boolean)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:invoiceitem])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :id, :deleted])
    |> validate_required([:object, :id, :deleted])
  end
end