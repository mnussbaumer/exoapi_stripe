defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbini do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:expires_at** :: *:integer*

  The timestamp at which the pending Konbini payment expires.


  **:hosted_voucher_url** :: *:string*

  The URL for the Konbini payment instructions page, which allows customers to view and print a Konbini voucher.


  **:stores** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniStores*


  """

  @primary_key false
  typed_embedded_schema do
    field(:expires_at, :integer)

    field(:hosted_voucher_url, :string)

    embeds_one(:stores, ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniStores)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:hosted_voucher_url, :expires_at])
    |> validate_required([:expires_at])
    |> cast_embed(:stores, required: true)
  end
end