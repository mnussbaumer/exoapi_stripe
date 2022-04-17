defmodule ExOAPI.Stripe.Schemas.GelatoDocumentReport do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Result from a document check

  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  Address as it appears in the document.


  **:dob** :: *ExOAPI.Stripe.Schemas.GelatoDataDocumentReportDateOfBirth*

  Date of birth as it appears in the document.


  **:error** :: *ExOAPI.Stripe.Schemas.GelatoDocumentReportError*

  Details on the verification error. Present when status is `unverified`.


  **:expiration_date** :: *ExOAPI.Stripe.Schemas.GelatoDataDocumentReportExpirationDate*

  Expiration date of the document.


  **::files** :: *:string*


  **:first_name** :: *:string*

  First name as it appears in the document.


  **:issued_date** :: *ExOAPI.Stripe.Schemas.GelatoDataDocumentReportIssuedDate*

  Issued date of the document.


  **:issuing_country** :: *:string*

  Issuing country of the document.


  **:last_name** :: *:string*

  Last name as it appears in the document.


  **:number** :: *:string*

  Document ID number.


  **:status** :: *:string*

  Status of this `document` check.


  **:type** :: *:string*

  Type of the document.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:dob, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoDataDocumentReportDateOfBirth]
    )

    field(:error, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.GelatoDocumentReportError])

    field(:expiration_date, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoDataDocumentReportExpirationDate]
    )

    field(:files, {:array, :string})

    field(:first_name, :string)

    field(:issued_date, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoDataDocumentReportIssuedDate]
    )

    field(:issuing_country, :string)

    field(:last_name, :string)

    field(:number, :string)

    field(:status, Ecto.Enum, values: [:verified, :unverified])

    field(:type, Ecto.Enum, values: [:passport, :id_card, :driving_license])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :status,
      :number,
      :last_name,
      :issuing_country,
      :issued_date,
      :first_name,
      :files,
      :expiration_date,
      :error,
      :dob,
      :address
    ])
    |> validate_required([:status])
  end
end