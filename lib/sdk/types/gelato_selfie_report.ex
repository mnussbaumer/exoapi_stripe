defmodule ExOAPI.Stripe.Schemas.GelatoSelfieReport do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Result from a selfie check

  **:document** :: *:string*

  ID of the [File](https://stripe.com/docs/api/files) holding the image of the identity document used in this check.


  **:error** :: *ExOAPI.Stripe.Schemas.GelatoSelfieReportError*

  Details on the verification error. Present when status is `unverified`.


  **:selfie** :: *:string*

  ID of the [File](https://stripe.com/docs/api/files) holding the image of the selfie used in this check.


  **:status** :: *:string*

  Status of this `selfie` check.


  """

  @primary_key false
  typed_embedded_schema do
    field(:document, :string)

    field(:error, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.GelatoSelfieReportError])

    field(:selfie, :string)

    field(:status, Ecto.Enum, values: [:verified, :unverified])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :selfie, :error, :document])
    |> validate_required([:status])
  end
end