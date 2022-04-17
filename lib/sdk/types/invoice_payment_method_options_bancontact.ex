defmodule ExOAPI.Stripe.Schemas.InvoicePaymentMethodOptionsBancontact do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:preferred_language** :: *:string*

  Preferred language of the Bancontact authorization page that the customer is redirected to.


  """

  @primary_key false
  typed_embedded_schema do
    field(:preferred_language, Ecto.Enum, values: [:nl, :fr, :en, :de])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:preferred_language])
    |> validate_required([:preferred_language])
  end
end