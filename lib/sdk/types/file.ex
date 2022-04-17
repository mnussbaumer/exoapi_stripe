defmodule ExOAPI.Stripe.Schemas.File do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This is an object representing a file hosted on Stripe's servers. The
  file may have been uploaded by yourself using the [create file](https://stripe.com/docs/api#create_file)
  request (for example, when uploading dispute evidence) or it may have
  been created by Stripe (for example, the results of a [Sigma scheduled
  query](#scheduled_queries)).

  Related guide: [File Upload Guide](https://stripe.com/docs/file-upload).

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:expires_at** :: *:integer*

  The time at which the file expires and is no longer available in epoch seconds.


  **:filename** :: *:string*

  A filename for the file, suitable for saving to a filesystem.


  **:id** :: *:string*

  Unique identifier for the object.


  **::data** :: *ExOAPI.Stripe.Schemas.FileLink*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:purpose** :: *:string*

  The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.


  **:size** :: *:integer*

  The size in bytes of the file object.


  **:title** :: *:string*

  A user friendly title for the document.


  **:type** :: *:string*

  The type of the file returned (e.g., `csv`, `pdf`, `jpg`, or `png`).


  **:url** :: *:string*

  The URL from which the file can be downloaded using your live secret API key.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:expires_at, :integer)

    field(:filename, :string)

    field(:id, :string)

    field(:links, :map)

    field(:object, Ecto.Enum, values: [:file])

    field(:purpose, Ecto.Enum,
      values: [
        :tax_document_user_upload,
        :sigma_scheduled_query,
        :selfie,
        :pci_document,
        :identity_document_downloadable,
        :identity_document,
        :finance_report_run,
        :document_provider_identity_document,
        :dispute_evidence,
        :customer_signature,
        :business_logo,
        :business_icon,
        :additional_verification,
        :account_requirement
      ]
    )

    field(:size, :integer)

    field(:title, :string)

    field(:type, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :type,
      :title,
      :size,
      :purpose,
      :object,
      :links,
      :id,
      :filename,
      :expires_at,
      :created
    ])
    |> validate_required([:size, :purpose, :object, :id, :created])
  end
end