defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWallet do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amex_express_checkout** :: *list(:map)*


  **:apple_pay** :: *list(:map)*


  **:dynamic_last4** :: *:string*

  (For tokenized numbers only.) The last four digits of the device account number.


  **:google_pay** :: *list(:map)*


  **:masterpass** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWalletMasterpass*


  **:samsung_pay** :: *list(:map)*


  **:type** :: *:string*

  The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.


  **:visa_checkout** :: *ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWalletVisaCheckout*


  """

  @primary_key false
  typed_embedded_schema do
    field(:amex_express_checkout, {:array, :map})

    field(:apple_pay, {:array, :map})

    field(:dynamic_last4, :string)

    field(:google_pay, {:array, :map})

    embeds_one(:masterpass, ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWalletMasterpass)

    field(:samsung_pay, {:array, :map})

    field(:type, Ecto.Enum,
      values: [
        :visa_checkout,
        :samsung_pay,
        :masterpass,
        :google_pay,
        :apple_pay,
        :amex_express_checkout
      ]
    )

    embeds_one(:visa_checkout, ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWalletVisaCheckout)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :samsung_pay,
      :google_pay,
      :dynamic_last4,
      :apple_pay,
      :amex_express_checkout
    ])
    |> validate_required([:type])
    |> cast_embed(:visa_checkout)
    |> cast_embed(:masterpass)
  end
end