defmodule ExOAPI.Stripe.Schemas.GelatoReportDocumentOptions do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::allowed_types** :: *:string*


  **:require_id_number** :: *:boolean*

  Collect an ID number and perform an [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.


  **:require_live_capture** :: *:boolean*

  Disable image uploads, identity document images have to be captured using the device’s camera.


  **:require_matching_selfie** :: *:boolean*

  Capture a face image and perform a [selfie check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://stripe.com/docs/identity/selfie).


  """

  @primary_key false
  typed_embedded_schema do
    field(:allowed_types, {:array, :string})

    field(:require_id_number, :boolean)

    field(:require_live_capture, :boolean)

    field(:require_matching_selfie, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :require_matching_selfie,
      :require_live_capture,
      :require_id_number,
      :allowed_types
    ])
  end
end