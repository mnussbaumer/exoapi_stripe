defmodule ExOAPI.Stripe.Schemas.PaymentLinksResourceTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount in %s that will be transferred to the destination account. By default, the entire amount is transferred to the destination.


  **:destination** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The connected account receiving the transfer.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:destination, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:destination, :amount])
    |> validate_required([:destination])
  end
end