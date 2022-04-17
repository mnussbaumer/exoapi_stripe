defmodule ExOAPI.Stripe.Schemas.InvoiceSettingCustomerSetting do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::custom_fields** :: *ExOAPI.Stripe.Schemas.InvoiceSettingCustomField*


  **:default_payment_method** :: *ExOAPI.Stripe.Schemas.PaymentMethod | :string*

  ID of a payment method that's attached to the customer, to be used as the customer's default payment method for subscriptions and invoices.


  **:footer** :: *:string*

  Default footer to be displayed on invoices for this customer.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:custom_fields, ExOAPI.Stripe.Schemas.InvoiceSettingCustomField)

    field(:default_payment_method, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.PaymentMethod]
    )

    field(:footer, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:footer, :default_payment_method])
    |> cast_embed(:custom_fields)
  end
end