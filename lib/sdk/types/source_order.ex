defmodule ExOAPI.Stripe.Schemas.SourceOrder do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:email** :: *:string*

  The email address of the customer placing the order.


  **::items** :: *ExOAPI.Stripe.Schemas.SourceOrderItem*


  **:shipping** :: *ExOAPI.Stripe.Schemas.Shipping*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:email, :string)

    embeds_many(:items, ExOAPI.Stripe.Schemas.SourceOrderItem)

    embeds_one(:shipping, ExOAPI.Stripe.Schemas.Shipping)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:email, :currency, :amount])
    |> validate_required([:currency, :amount])
    |> cast_embed(:shipping)
    |> cast_embed(:items)
  end
end