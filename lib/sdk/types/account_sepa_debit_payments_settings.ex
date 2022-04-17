defmodule ExOAPI.Stripe.Schemas.AccountSepaDebitPaymentsSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:creditor_id** :: *:string*

  SEPA creditor identifier that identifies the company making the payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:creditor_id, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:creditor_id])
  end
end