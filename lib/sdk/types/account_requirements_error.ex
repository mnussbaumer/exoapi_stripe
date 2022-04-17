defmodule ExOAPI.Stripe.Schemas.AccountRequirementsError do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:code** :: *:string*

  The code for the type of error.


  **:reason** :: *:string*

  An informative message that indicates the error type and provides additional details about the error.


  **:requirement** :: *:string*

  The specific user onboarding requirement field (in the requirements hash) that needs to be resolved.


  """

  @primary_key false
  typed_embedded_schema do
    field(:code, Ecto.Enum,
      values: [
        :verification_requires_additional_memorandum_of_associations,
        :verification_missing_owners,
        :verification_missing_executives,
        :verification_failed_tax_id_not_issued,
        :verification_failed_tax_id_match,
        :verification_failed_other,
        :verification_failed_name_match,
        :verification_failed_keyed_match,
        :verification_failed_keyed_identity,
        :verification_failed_id_number_match,
        :verification_failed_document_match,
        :verification_failed_business_iec_number,
        :verification_failed_address_match,
        :verification_document_type_not_supported,
        :verification_document_too_large,
        :verification_document_photo_mismatch,
        :verification_document_not_uploaded,
        :verification_document_not_signed,
        :verification_document_not_readable,
        :verification_document_nationality_mismatch,
        :verification_document_name_missing,
        :verification_document_name_mismatch,
        :verification_document_missing_front,
        :verification_document_missing_back,
        :verification_document_manipulated,
        :verification_document_issue_or_expiry_date_missing,
        :verification_document_invalid,
        :verification_document_incomplete,
        :verification_document_id_number_missing,
        :verification_document_id_number_mismatch,
        :verification_document_fraudulent,
        :verification_document_failed_test_mode,
        :verification_document_failed_other,
        :verification_document_failed_greyscale,
        :verification_document_failed_copy,
        :verification_document_expired,
        :verification_document_duplicate_type,
        :verification_document_dob_mismatch,
        :verification_document_country_not_supported,
        :verification_document_corrupt,
        :verification_document_address_missing,
        :verification_document_address_mismatch,
        :invalid_value_other,
        :invalid_street_address,
        :invalid_address_city_state_postal_code
      ]
    )

    field(:reason, :string)

    field(:requirement, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:requirement, :reason, :code])
    |> validate_required([:requirement, :reason, :code])
  end
end