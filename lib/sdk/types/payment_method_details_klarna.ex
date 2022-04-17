defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsKlarna do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:payment_method_category** :: *:string*

  The Klarna payment method used for this transaction.
  Can be one of `pay_later`, `pay_now`, `pay_with_financing`, or `pay_in_installments`


  **:preferred_locale** :: *:string*

  Preferred language of the Klarna authorization page that the customer is redirected to.
  Can be one of `de-AT`, `en-AT`, `nl-BE`, `fr-BE`, `en-BE`, `de-DE`, `en-DE`, `da-DK`, `en-DK`, `es-ES`, `en-ES`, `fi-FI`, `sv-FI`, `en-FI`, `en-GB`, `en-IE`, `it-IT`, `en-IT`, `nl-NL`, `en-NL`, `nb-NO`, `en-NO`, `sv-SE`, `en-SE`, `en-US`, `es-US`, `fr-FR`, or `en-FR`


  """

  @primary_key false
  typed_embedded_schema do
    field(:payment_method_category, :string)

    field(:preferred_locale, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:preferred_locale, :payment_method_category])
  end
end