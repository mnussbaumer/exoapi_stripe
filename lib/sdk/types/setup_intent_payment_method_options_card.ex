defmodule ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:mandate_options** :: *ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsCardMandateOptions*

  Configuration options for setting up an eMandate for cards issued in India.


  **:request_three_d_secure** :: *:string*

  We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.


  """

  @primary_key false
  typed_embedded_schema do
    field(:mandate_options, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsCardMandateOptions]
    )

    field(:request_three_d_secure, Ecto.Enum, values: [:challenge_only, :automatic, :any])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:request_three_d_secure, :mandate_options])
  end
end