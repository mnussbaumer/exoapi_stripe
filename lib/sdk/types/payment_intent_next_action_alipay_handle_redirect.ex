defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionAlipayHandleRedirect do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:native_data** :: *:string*

  The native data to be used with Alipay SDK you must redirect your customer to in order to authenticate the payment in an Android App.


  **:native_url** :: *:string*

  The native URL you must redirect your customer to in order to authenticate the payment in an iOS App.


  **:return_url** :: *:string*

  If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.


  **:url** :: *:string*

  The URL you must redirect your customer to in order to authenticate the payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:native_data, :string)

    field(:native_url, :string)

    field(:return_url, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :return_url, :native_url, :native_data])
  end
end