defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniSeicomart do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:confirmation_number** :: *:string*

  The confirmation number.


  **:payment_code** :: *:string*

  The payment code.


  """

  @primary_key false
  typed_embedded_schema do
    field(:confirmation_number, :string)

    field(:payment_code, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:payment_code, :confirmation_number])
    |> validate_required([:payment_code])
  end
end