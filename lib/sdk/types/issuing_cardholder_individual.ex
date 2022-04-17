defmodule ExOAPI.Stripe.Schemas.IssuingCardholderIndividual do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:dob** :: *ExOAPI.Stripe.Schemas.IssuingCardholderIndividualDob*

  The date of birth of this cardholder.


  **:first_name** :: *:string*

  The first name of this cardholder.


  **:last_name** :: *:string*

  The last name of this cardholder.


  **:verification** :: *ExOAPI.Stripe.Schemas.IssuingCardholderVerification*

  Government-issued ID document for this cardholder.


  """

  @primary_key false
  typed_embedded_schema do
    field(:dob, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingCardholderIndividualDob]
    )

    field(:first_name, :string)

    field(:last_name, :string)

    field(:verification, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.IssuingCardholderVerification]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verification, :last_name, :first_name, :dob])
    |> validate_required([:last_name, :first_name])
  end
end