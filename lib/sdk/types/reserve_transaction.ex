defmodule ExOAPI.Stripe.Schemas.ReserveTransaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:description, :string)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:reserve_transaction])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :id, :description, :currency, :amount])
    |> validate_required([:object, :id, :currency, :amount])
  end
end