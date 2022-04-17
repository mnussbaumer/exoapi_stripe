defmodule ExOAPI.Stripe.Schemas.Balance do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This is an object representing your Stripe balance. You can retrieve it to see
  the balance currently on your Stripe account.

  You can also retrieve the balance history, which contains a list of
  [transactions](https://stripe.com/docs/reporting/balance-transaction-types) that contributed to the balance
  (charges, payouts, and so forth).

  The available and pending amounts for each currency are broken down further by
  payment source types.

  Related guide: [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances).

  **::available** :: *ExOAPI.Stripe.Schemas.BalanceAmount*


  **::connect_reserved** :: *ExOAPI.Stripe.Schemas.BalanceAmount*


  **::instant_available** :: *ExOAPI.Stripe.Schemas.BalanceAmount*


  **:issuing** :: *ExOAPI.Stripe.Schemas.BalanceDetail*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **::pending** :: *ExOAPI.Stripe.Schemas.BalanceAmount*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:available, ExOAPI.Stripe.Schemas.BalanceAmount)

    embeds_many(:connect_reserved, ExOAPI.Stripe.Schemas.BalanceAmount)

    embeds_many(:instant_available, ExOAPI.Stripe.Schemas.BalanceAmount)

    embeds_one(:issuing, ExOAPI.Stripe.Schemas.BalanceDetail)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:balance])

    embeds_many(:pending, ExOAPI.Stripe.Schemas.BalanceAmount)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :livemode])
    |> validate_required([:object, :livemode])
    |> cast_embed(:pending, required: true)
    |> cast_embed(:issuing)
    |> cast_embed(:instant_available)
    |> cast_embed(:connect_reserved)
    |> cast_embed(:available, required: true)
  end
end