defmodule ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebitMandateOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:transaction_type** :: *:string*

  Transaction type of the mandate.


  """

  @primary_key false
  typed_embedded_schema do
    field(:transaction_type, Ecto.Enum, values: [:personal, :business])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:transaction_type])
  end
end