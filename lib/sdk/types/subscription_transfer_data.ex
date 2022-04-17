defmodule ExOAPI.Stripe.Schemas.SubscriptionTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount_percent** :: *:number*

  A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount is transferred to the destination.


  **:destination** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account where funds from the payment will be transferred to upon payment success.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount_percent, :float)

    field(:destination, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:destination, :amount_percent])
    |> validate_required([:destination])
  end
end