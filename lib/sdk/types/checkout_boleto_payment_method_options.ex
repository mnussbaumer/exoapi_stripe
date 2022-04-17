defmodule ExOAPI.Stripe.Schemas.CheckoutBoletoPaymentMethodOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:expires_after_days** :: *:integer*

  The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto voucher will expire on Wednesday at 23:59 America/Sao_Paulo time.


  """

  @primary_key false
  typed_embedded_schema do
    field(:expires_after_days, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:expires_after_days])
    |> validate_required([:expires_after_days])
  end
end