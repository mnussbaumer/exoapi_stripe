defmodule ExOAPI.Stripe.Schemas.PortalFeatures do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:customer_update** :: *ExOAPI.Stripe.Schemas.PortalCustomerUpdate*


  **:invoice_history** :: *ExOAPI.Stripe.Schemas.PortalInvoiceList*


  **:payment_method_update** :: *ExOAPI.Stripe.Schemas.PortalPaymentMethodUpdate*


  **:subscription_cancel** :: *ExOAPI.Stripe.Schemas.PortalSubscriptionCancel*


  **:subscription_pause** :: *ExOAPI.Stripe.Schemas.PortalSubscriptionPause*


  **:subscription_update** :: *ExOAPI.Stripe.Schemas.PortalSubscriptionUpdate*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:customer_update, ExOAPI.Stripe.Schemas.PortalCustomerUpdate)

    embeds_one(:invoice_history, ExOAPI.Stripe.Schemas.PortalInvoiceList)

    embeds_one(:payment_method_update, ExOAPI.Stripe.Schemas.PortalPaymentMethodUpdate)

    embeds_one(:subscription_cancel, ExOAPI.Stripe.Schemas.PortalSubscriptionCancel)

    embeds_one(:subscription_pause, ExOAPI.Stripe.Schemas.PortalSubscriptionPause)

    embeds_one(:subscription_update, ExOAPI.Stripe.Schemas.PortalSubscriptionUpdate)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:subscription_update, required: true)
    |> cast_embed(:subscription_pause, required: true)
    |> cast_embed(:subscription_cancel, required: true)
    |> cast_embed(:payment_method_update, required: true)
    |> cast_embed(:invoice_history, required: true)
    |> cast_embed(:customer_update, required: true)
  end
end