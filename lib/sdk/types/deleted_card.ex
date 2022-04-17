defmodule ExOAPI.Stripe.Schemas.DeletedCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:currency** :: *:string*

  Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.


  **:deleted** :: *:boolean*

  Always true for a deleted object


  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:currency, :string)

    field(:deleted, :boolean)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:card])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :id, :deleted, :currency])
    |> validate_required([:object, :id, :deleted])
  end
end