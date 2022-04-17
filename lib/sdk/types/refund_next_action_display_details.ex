defmodule ExOAPI.Stripe.Schemas.RefundNextActionDisplayDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:email_sent** :: *ExOAPI.Stripe.Schemas.EmailSent*


  **:expires_at** :: *:integer*

  The expiry timestamp.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:email_sent, ExOAPI.Stripe.Schemas.EmailSent)

    field(:expires_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:expires_at])
    |> validate_required([:expires_at])
    |> cast_embed(:email_sent, required: true)
  end
end