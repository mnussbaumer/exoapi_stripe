defmodule ExOAPI.Stripe.Schemas.LegalEntityPersonVerification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:additional_document** :: *ExOAPI.Stripe.Schemas.LegalEntityPersonVerificationDocument*

  A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.


  **:details** :: *:string*

  A user-displayable string describing the verification state for the person. For example, this may say "Provided identity information could not be verified".


  **:details_code** :: *:string*

  One of `document_address_mismatch`, `document_dob_mismatch`, `document_duplicate_type`, `document_id_number_mismatch`, `document_name_mismatch`, `document_nationality_mismatch`, `failed_keyed_identity`, or `failed_other`. A machine-readable code specifying the verification state for the person.


  **:document** :: *ExOAPI.Stripe.Schemas.LegalEntityPersonVerificationDocument*


  **:status** :: *:string*

  The state of verification for the person. Possible values are `unverified`, `pending`, or `verified`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:additional_document, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.LegalEntityPersonVerificationDocument]
    )

    field(:details, :string)

    field(:details_code, :string)

    embeds_one(:document, ExOAPI.Stripe.Schemas.LegalEntityPersonVerificationDocument)

    field(:status, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :details_code, :details, :additional_document])
    |> validate_required([:status])
    |> cast_embed(:document)
  end
end