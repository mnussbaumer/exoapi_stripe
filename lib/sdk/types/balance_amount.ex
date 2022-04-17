defmodule ExOAPI.Stripe.Schemas.BalanceAmount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  Balance amount.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:source_types** :: *ExOAPI.Stripe.Schemas.BalanceAmountBySourceType*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    embeds_one(:source_types, ExOAPI.Stripe.Schemas.BalanceAmountBySourceType)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:currency, :amount])
    |> validate_required([:currency, :amount])
    |> cast_embed(:source_types)
  end
end