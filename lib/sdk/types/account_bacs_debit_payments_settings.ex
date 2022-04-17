defmodule ExOAPI.Stripe.Schemas.AccountBacsDebitPaymentsSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:display_name** :: *:string*

  The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct Debit, this will appear on the mandate, and as the statement descriptor.


  """

  @primary_key false
  typed_embedded_schema do
    field(:display_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:display_name])
  end
end