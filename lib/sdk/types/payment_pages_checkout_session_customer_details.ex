defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionCustomerDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  The customer's address at the time of checkout. Note: This property is populated only for sessions on or after March 30, 2022.


  **:email** :: *:string*

  The email associated with the Customer, if one exists, on the Checkout Session at the time of checkout or at time of session expiry.
  Otherwise, if the customer has consented to promotional content, this value is the most recent valid email provided by the customer on the Checkout form.


  **:name** :: *:string*

  The customer's name at the time of checkout. Note: This property is populated only for sessions on or after March 30, 2022.


  **:phone** :: *:string*

  The customer's phone number at the time of checkout


  **:tax_exempt** :: *:string*

  The customer’s tax exempt status at time of checkout.


  **::tax_ids** :: *ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTaxId*


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:email, :string)

    field(:name, :string)

    field(:phone, :string)

    field(:tax_exempt, Ecto.Enum, values: [:reverse, :none, :exempt])

    embeds_many(:tax_ids, ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTaxId)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:tax_exempt, :phone, :name, :email, :address])
    |> cast_embed(:tax_ids)
  end
end