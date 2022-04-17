defmodule ExOAPI.Stripe.Schemas.GelatoSessionLastError do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Shows last VerificationSession error

  **:code** :: *:string*

  A short machine-readable string giving the reason for the verification or user-session failure.


  **:reason** :: *:string*

  A message that explains the reason for verification or user-session failure.


  """

  @primary_key false
  typed_embedded_schema do
    field(:code, Ecto.Enum,
      values: [
        :under_supported_age,
        :selfie_unverified_other,
        :selfie_manipulated,
        :selfie_face_mismatch,
        :selfie_document_missing_photo,
        :id_number_unverified_other,
        :id_number_mismatch,
        :id_number_insufficient_document_data,
        :document_unverified_other,
        :document_type_not_supported,
        :document_expired,
        :device_not_supported,
        :country_not_supported,
        :consent_declined,
        :abandoned
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