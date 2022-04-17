defmodule ExOAPI.Stripe.Schemas.SetupIntentNextAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:redirect_to_url** :: *ExOAPI.Stripe.Schemas.SetupIntentNextActionRedirectToUrl*


  **:type** :: *:string*

  Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`, `alipay_handle_redirect`, `oxxo_display_details`, or `verify_with_microdeposits`.


  **:use_stripe_sdk** :: *:map*

  When confirming a SetupIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.


  **:verify_with_microdeposits** :: *ExOAPI.Stripe.Schemas.SetupIntentNextActionVerifyWithMicrodeposits*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:redirect_to_url, ExOAPI.Stripe.Schemas.SetupIntentNextActionRedirectToUrl)

    field(:type, :string)

    field(:use_stripe_sdk, :map)

    embeds_one(
      :verify_with_microdeposits,
      ExOAPI.Stripe.Schemas.SetupIntentNextActionVerifyWithMicrodeposits
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:use_stripe_sdk, :type])
    |> validate_required([:type])
    |> cast_embed(:verify_with_microdeposits)
    |> cast_embed(:redirect_to_url)
  end
end