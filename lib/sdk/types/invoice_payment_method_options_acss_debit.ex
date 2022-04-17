defmodule ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:mandate_options** :: *ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebitMandateOptions*


  **:verification_method** :: *:string*

  Bank account verification method.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :mandate_options,
      ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsAcssDebitMandateOptions
    )

    field(:verification_method, Ecto.Enum, values: [:microdeposits, :instant, :automatic])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verification_method])
    |> cast_embed(:mandate_options)
  end
end