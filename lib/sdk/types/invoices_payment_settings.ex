defmodule ExOAPI.Stripe.Schemas.InvoicesPaymentSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:payment_method_options** :: *ExOAPI.Stripe.Schemas.InvoicesPaymentMethodOptions*

  Payment-method-specific configuration to provide to the invoice’s PaymentIntent.


  **::payment_method_types** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:payment_method_options, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.InvoicesPaymentMethodOptions]
    )

    field(:payment_method_types, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:payment_method_types, :payment_method_options])
  end
end