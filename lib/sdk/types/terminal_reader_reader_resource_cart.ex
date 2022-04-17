defmodule ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceCart do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Represents a cart to be displayed on the reader

  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **::line_items** :: *ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceLineItem*


  **:tax** :: *:integer*

  Tax amount for the entire cart. A positive integer in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  **:total** :: *:integer*

  Total amount for the entire cart, including tax. A positive integer in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).


  """

  @primary_key false
  typed_embedded_schema do
    field(:currency, :string)

    embeds_many(:line_items, ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceLineItem)

    field(:tax, :integer)

    field(:total, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:total, :tax, :currency])
    |> validate_required([:total, :currency])
    |> cast_embed(:line_items, required: true)
  end
end