defmodule ExOAPI.Stripe.Schemas.InvoiceTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount in %s that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination.


  **:destination** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account where funds from the payment will be transferred to upon payment success.


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