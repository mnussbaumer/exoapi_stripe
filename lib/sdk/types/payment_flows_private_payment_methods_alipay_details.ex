defmodule ExOAPI.Stripe.Schemas.PaymentFlowsPrivatePaymentMethodsAlipayDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:buyer_id** :: *:string*

  Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.


  **:transaction_id** :: *:string*

  Transaction ID of this particular Alipay transaction.


  """

  @primary_key false
  typed_embedded_schema do
    field(:buyer_id, :string)

    field(:fingerprint, :string)

    field(:transaction_id, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:transaction_id, :fingerprint, :buyer_id])
  end
end