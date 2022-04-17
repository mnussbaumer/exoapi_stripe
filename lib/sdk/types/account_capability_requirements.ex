defmodule ExOAPI.Stripe.Schemas.AccountCapabilityRequirements do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::alternatives** :: *ExOAPI.Stripe.Schemas.AccountRequirementsAlternative*


  **:current_deadline** :: *:integer*

  Date by which the fields in `currently_due` must be collected to keep the capability enabled for the account. These fields may disable the capability sooner if the next threshold is reached before they are collected.


  **::currently_due** :: *:string*


  **:disabled_reason** :: *:string*

  If the capability is disabled, this string describes why. Can be `requirements.past_due`, `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`, `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.

  `rejected.unsupported_business` means that the account's business is not supported by the capability. For example, payment methods may restrict the businesses they support in their terms of service:

  - [Afterpay Clearpay's terms of service](/afterpay-clearpay/legal#restricted-businesses)

  If you believe that the rejection is in error, please contact support at https://support.stripe.com/contact/ for assistance.


  **::errors** :: *ExOAPI.Stripe.Schemas.AccountRequirementsError*


  **::eventually_due** :: *:string*


  **::past_due** :: *:string*


  **::pending_verification** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_many(:alternatives, ExOAPI.Stripe.Schemas.AccountRequirementsAlternative)

    field(:current_deadline, :integer)

    field(:currently_due, {:array, :string})

    field(:disabled_reason, :string)

    embeds_many(:errors, ExOAPI.Stripe.Schemas.AccountRequirementsError)

    field(:eventually_due, {:array, :string})

    field(:past_due, {:array, :string})

    field(:pending_verification, {:array, :string})
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :pending_verification,
      :past_due,
      :eventually_due,
      :disabled_reason,
      :currently_due,
      :current_deadline
    ])
    |> cast_embed(:errors, required: true)
    |> cast_embed(:alternatives)
  end
end