defmodule ExOAPI.Stripe.Schemas.PaymentIntentCardProcessing do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:customer_notification** :: *ExOAPI.Stripe.Schemas.PaymentIntentProcessingCustomerNotification*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :customer_notification,
      ExOAPI.Stripe.Schemas.PaymentIntentProcessingCustomerNotification
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:customer_notification)
  end
end