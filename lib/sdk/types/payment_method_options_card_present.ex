defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsCardPresent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:request_extended_authorization** :: *:boolean*

  Request ability to capture this payment beyond the standard [authorization validity window](https://stripe.com/docs/terminal/features/extended-authorizations#authorization-validity)


  **:request_incremental_authorization_support** :: *:boolean*

  Request ability to [increment](docs/terminal/features/incremental-authorizations) this PaymentIntent if the combination of MCC and card brand is eligible. Check [incremental_authorization_supported](https://stripe.com/docs/api/charges/object#charge_object-payment_method_details-card_present-incremental_authorization_supported) in the [Confirm](https://stripe.com/docs/api/payment_intents/confirm) response to verify support.


  """

  @primary_key false
  typed_embedded_schema do
    field(:request_extended_authorization, :boolean)

    field(:request_incremental_authorization_support, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:request_incremental_authorization_support, :request_extended_authorization])
  end
end