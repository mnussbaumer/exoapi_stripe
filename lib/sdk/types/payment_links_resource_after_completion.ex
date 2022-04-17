defmodule ExOAPI.Stripe.Schemas.PaymentLinksResourceAfterCompletion do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:hosted_confirmation** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceCompletionBehaviorConfirmationPage*


  **:redirect** :: *ExOAPI.Stripe.Schemas.PaymentLinksResourceCompletionBehaviorRedirect*


  **:type** :: *:string*

  The specified behavior after the purchase is complete.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :hosted_confirmation,
      ExOAPI.Stripe.Schemas.PaymentLinksResourceCompletionBehaviorConfirmationPage
    )

    embeds_one(:redirect, ExOAPI.Stripe.Schemas.PaymentLinksResourceCompletionBehaviorRedirect)

    field(:type, Ecto.Enum, values: [:redirect, :hosted_confirmation])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type])
    |> validate_required([:type])
    |> cast_embed(:redirect)
    |> cast_embed(:hosted_confirmation)
  end
end