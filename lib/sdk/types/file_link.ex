defmodule ExOAPI.Stripe.Schemas.FileLink do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: To share the contents of a `File` object with non-Stripe users, you can
  create a `FileLink`. `FileLink`s contain a URL that can be used to
  retrieve the contents of the file without authentication.

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:expired** :: *:boolean*

  Whether this link is already expired.


  **:expires_at** :: *:integer*

  Time at which the link expires.


  **:file** :: *ExOAPI.Stripe.Schemas.File | :string*

  The file object this link points to.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:url** :: *:string*

  The publicly accessible URL to download the file.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:expired, :boolean)

    field(:expires_at, :integer)

    field(:file, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:file_link])

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :object,
      :metadata,
      :livemode,
      :id,
      :file,
      :expires_at,
      :expired,
      :created
    ])
    |> validate_required([:object, :metadata, :livemode, :id, :file, :expired, :created])
  end
end