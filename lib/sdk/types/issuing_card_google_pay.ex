defmodule ExOAPI.Stripe.Schemas.IssuingCardGooglePay do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:eligible** :: *:boolean*

  Google Pay Eligibility


  **:ineligible_reason** :: *:string*

  Reason the card is ineligible for Google Pay


  """

  @primary_key false
  typed_embedded_schema do
    field(:eligible, :boolean)

    field(:ineligible_reason, Ecto.Enum,
      values: [:unsupported_region, :missing_cardholder_contact, :missing_agreement]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:ineligible_reason, :eligible])
    |> validate_required([:eligible])
  end
end