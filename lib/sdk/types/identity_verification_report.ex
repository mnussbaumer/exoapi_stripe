defmodule ExOAPI.Stripe.Schemas.Identity_verificationReport do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A VerificationReport is the result of an attempt to collect and verify data from a user.
  The collection of verification checks performed is determined from the `type` and `options`
  parameters used. You can find the result of each verification check performed in the
  appropriate sub-resource: `document`, `id_number`, `selfie`.

  Each VerificationReport contains a copy of any data collected by the user as well as
  reference IDs which can be used to access collected images through the [FileUpload](https://stripe.com/docs/api/files)
  API. To configure and create VerificationReports, use the
  [VerificationSession](https://stripe.com/docs/api/identity/verification_sessions) API.

  Related guides: [Accessing verification results](https://stripe.com/docs/identity/verification-sessions#results).

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:document** :: *ExOAPI.Stripe.Schemas.GelatoDocumentReport*


  **:id** :: *:string*

  Unique identifier for the object.


  **:id_number** :: *ExOAPI.Stripe.Schemas.GelatoIdNumberReport*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:options** :: *ExOAPI.Stripe.Schemas.GelatoVerificationReportOptions*


  **:selfie** :: *ExOAPI.Stripe.Schemas.GelatoSelfieReport*


  **:type** :: *:string*

  Type of report.


  **:verification_session** :: *:string*

  ID of the VerificationSession that created this report.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    embeds_one(:document, ExOAPI.Stripe.Schemas.GelatoDocumentReport)

    field(:id, :string)

    embeds_one(:id_number, ExOAPI.Stripe.Schemas.GelatoIdNumberReport)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:"identity.verification_report"])

    embeds_one(:options, ExOAPI.Stripe.Schemas.GelatoVerificationReportOptions)

    embeds_one(:selfie, ExOAPI.Stripe.Schemas.GelatoSelfieReport)

    field(:type, Ecto.Enum, values: [:id_number, :document])

    field(:verification_session, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verification_session, :type, :object, :livemode, :id, :created])
    |> validate_required([:type, :object, :livemode, :id, :created])
    |> cast_embed(:selfie)
    |> cast_embed(:options, required: true)
    |> cast_embed(:id_number)
    |> cast_embed(:document)
  end
end