defmodule ExOAPI.Stripe.Schemas.GelatoSelfieReportError do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:code** :: *:string*

  A short machine-readable string giving the reason for the verification failure.


  **:reason** :: *:string*

  A human-readable message giving the reason for the failure. These messages can be shown to your users.


  """

  @primary_key false
  typed_embedded_schema do
    field(:code, Ecto.Enum,
      values: [
        :selfie_unverified_other,
        :selfie_manipulated,
        :selfie_face_mismatch,
        :selfie_document_missing_photo
      ]
    )

    field(:reason, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reason, :code])
  end
end