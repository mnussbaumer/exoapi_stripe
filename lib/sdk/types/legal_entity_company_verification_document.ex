defmodule ExOAPI.Stripe.Schemas.LegalEntityCompanyVerificationDocument do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:back** :: *ExOAPI.Stripe.Schemas.File | :string*

  The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.


  **:details** :: *:string*

  A user-displayable string describing the verification state of this document.


  **:details_code** :: *:string*

  One of `document_corrupt`, `document_expired`, `document_failed_copy`, `document_failed_greyscale`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_not_readable`, `document_not_uploaded`, `document_type_not_supported`, or `document_too_large`. A machine-readable code specifying the verification state for this document.


  **:front** :: *ExOAPI.Stripe.Schemas.File | :string*

  The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:back, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:details, :string)

    field(:details_code, :string)

    field(:front, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:front, :details_code, :details, :back])
  end
end