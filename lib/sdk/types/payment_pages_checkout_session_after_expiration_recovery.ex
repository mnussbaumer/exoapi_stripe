defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAfterExpirationRecovery do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:allow_promotion_codes** :: *:boolean*

  Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to `false`


  **:enabled** :: *:boolean*

  If `true`, a recovery url will be generated to recover this Checkout Session if it
  expires before a transaction is completed. It will be attached to the
  Checkout Session object upon expiration.


  **:expires_at** :: *:integer*

  The timestamp at which the recovery URL will expire.


  **:url** :: *:string*

  URL that creates a new Checkout Session when clicked that is a copy of this expired Checkout Session


  """

  @primary_key false
  typed_embedded_schema do
    field(:allow_promotion_codes, :boolean)

    field(:enabled, :boolean)

    field(:expires_at, :integer)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :expires_at, :enabled, :allow_promotion_codes])
    |> validate_required([:enabled, :allow_promotion_codes])
  end
end