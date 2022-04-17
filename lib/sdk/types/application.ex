defmodule ExOAPI.Stripe.Schemas.Application do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:id** :: *:string*

  Unique identifier for the object.


  **:name** :: *:string*

  The name of the application.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:id, :string)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:application])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :name, :id])
    |> validate_required([:object, :id])
  end
end