defmodule ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceLineItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Represents a line item to be displayed on the reader

  **:amount** :: *:integer*

  The amount of the line item. A positive integer in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:description** :: *:string*

  Description of the line item.


  **:quantity** :: *:integer*

  The quantity of the line item.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:description, :string)

    field(:quantity, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:quantity, :description, :amount])
    |> validate_required([:quantity, :description, :amount])
  end
end