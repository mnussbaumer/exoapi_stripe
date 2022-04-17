defmodule ExOAPI.Stripe.Schemas.Identity_verificationSession do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A VerificationSession guides you through the process of collecting and verifying the identities
  of your users. It contains details about the type of verification, such as what [verification
  check](/docs/identity/verification-checks) to perform. Only create one VerificationSession for
  each verification in your system.

  A VerificationSession transitions through [multiple
  statuses](/docs/identity/how-sessions-work) throughout its lifetime as it progresses through
  the verification flow. The VerificationSession contains the user’s verified data after
  verification checks are complete.

  Related guide: [The Verification Sessions API](https://stripe.com/docs/identity/verification-sessions)

  **:client_secret** :: *:string*

  The short-lived client secret used by Stripe.js to [show a verification modal](https://stripe.com/docs/js/identity/modal) inside your app. This client secret expires after 24 hours and can only be used once. Don’t store it, log it, embed it in a URL, or expose it to anyone other than the user. Make sure that you have TLS enabled on any page that includes the client secret. Refer to our docs on [passing the client secret to the frontend](https://stripe.com/docs/identity/verification-sessions#client-secret) to learn more.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:id** :: *:string*

  Unique identifier for the object.


  **:last_error** :: *ExOAPI.Stripe.Schemas.GelatoSessionLastError*

  If present, this property tells you the last error encountered when processing the verification.


  **:last_verification_report** :: *ExOAPI.Stripe.Schemas.Identity_verificationReport | :string*

  ID of the most recent VerificationReport. [Learn more about accessing detailed verification results.](https://stripe.com/docs/identity/verification-sessions#results)


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:options** :: *ExOAPI.Stripe.Schemas.GelatoVerificationSessionOptions*


  **:redaction** :: *ExOAPI.Stripe.Schemas.VerificationSessionRedaction*

  Redaction status of this VerificationSession. If the VerificationSession is not redacted, this field will be null.


  **:status** :: *:string*

  Status of this VerificationSession. [Learn more about the lifecycle of sessions](https://stripe.com/docs/identity/how-sessions-work).


  **:type** :: *:string*

  The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be performed.


  **:url** :: *:string*

  The short-lived URL that you use to redirect a user to Stripe to submit their identity information. This URL expires after 48 hours and can only be used once. Don’t store it, log it, send it in emails or expose it to anyone other than the user. Refer to our docs on [verifying identity documents](https://stripe.com/docs/identity/verify-identity-documents?platform=web&type=redirect) to learn how to redirect users to Stripe.


  **:verified_outputs** :: *ExOAPI.Stripe.Schemas.GelatoVerifiedOutputs*

  The user’s verified data.


  """

  @primary_key false
  typed_embedded_schema do
    field(:client_secret, :string)

    field(:created, :integer)

    field(:id, :string)

    field(:last_error, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoSessionLastError]
    )

    field(:last_verification_report, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Identity_verificationReport]
    )

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"identity.verification_session"])

    embeds_one(:options, ExOAPI.Stripe.Schemas.GelatoVerificationSessionOptions)

    field(:redaction, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.VerificationSessionRedaction]
    )

    field(:status, Ecto.Enum, values: [:verified, :requires_input, :processing, :canceled])

    field(:type, Ecto.Enum, values: [:id_number, :document])

    field(:url, :string)

    field(:verified_outputs, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoVerifiedOutputs]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :verified_outputs,
      :url,
      :type,
      :status,
      :redaction,
      :object,
      :metadata,
      :livemode,
      :last_verification_report,
      :last_error,
      :id,
      :created,
      :client_secret
    ])
    |> validate_required([:type, :status, :object, :metadata, :livemode, :id, :created])
    |> cast_embed(:options, required: true)
  end
end