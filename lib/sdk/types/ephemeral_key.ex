defmodule ExOAPI.Stripe.Schemas.EphemeralKey do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:expires** :: *:integer*

  Time at which the key will expire. Measured in seconds since the Unix epoch.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:secret** :: *:string*

  The key's secret. You can use this value to make authorized requests to the Stripe API.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:expires, :integer)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:ephemeral_key])

    field(:secret, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:secret, :object, :livemode, :id, :expires, :created])
    |> validate_required([:object, :livemode, :id, :expires, :created])
  end
end