defmodule ExOAPI.Stripe.Schemas.LoginLink do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:url** :: *:string*

  The URL for the login link.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:object, Ecto.Enum, values: [:login_link])

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :object, :created])
    |> validate_required([:url, :object, :created])
  end
end