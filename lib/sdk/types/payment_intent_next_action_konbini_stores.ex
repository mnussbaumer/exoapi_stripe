defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniStores do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:familymart** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniFamilymart*

  FamilyMart instruction details.


  **:lawson** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniLawson*

  Lawson instruction details.


  **:ministop** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniMinistop*

  Ministop instruction details.


  **:seicomart** :: *ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniSeicomart*

  Seicomart instruction details.


  """

  @primary_key false
  typed_embedded_schema do
    field(:familymart, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniFamilymart]
    )

    field(:lawson, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniLawson]
    )

    field(:ministop, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniMinistop]
    )

    field(:seicomart, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.PaymentIntentNextActionKonbiniSeicomart]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:seicomart, :ministop, :lawson, :familymart])
  end
end