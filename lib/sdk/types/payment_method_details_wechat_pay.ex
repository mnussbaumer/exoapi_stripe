defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsWechatPay do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:fingerprint** :: *:string*

  Uniquely identifies this particular WeChat Pay account. You can use this attribute to check whether two WeChat accounts are the same.


  **:transaction_id** :: *:string*

  Transaction ID of this particular WeChat Pay transaction.


  """

  @primary_key false
  typed_embedded_schema do
    field(:fingerprint, :string)

    field(:transaction_id, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:transaction_id, :fingerprint])
  end
end