defmodule ExOAPI.Stripe.Schemas.SubscriptionPaymentMethodOptionsCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:mandate_options** :: *ExOAPI.Stripe.Schemas.InvoiceMandateOptionsCard*


  **:request_three_d_secure** :: *:string*

  We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:mandate_options, ExOAPI.Stripe.Schemas.InvoiceMandateOptionsCard)

    field(:request_three_d_secure, Ecto.Enum, values: [:automatic, :any])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:request_three_d_secure])
    |> cast_embed(:mandate_options)
  end
end