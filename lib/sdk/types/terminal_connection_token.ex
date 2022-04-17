defmodule ExOAPI.Stripe.Schemas.Terminal_connectionToken do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Connection Token is used by the Stripe Terminal SDK to connect to a reader.

  Related guide: [Fleet Management](https://stripe.com/docs/terminal/fleet/locations).

  **:location** :: *:string*

  The id of the location that this connection token is scoped to. Note that location scoping only applies to internet-connected readers. For more details, see [the docs on scoping connection tokens](https://stripe.com/docs/terminal/fleet/locations#connection-tokens).


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:secret** :: *:string*

  Your application should pass this token to the Stripe Terminal SDK.


  """

  @primary_key false
  typed_embedded_schema do
    field(:location, :string)

    field(:object, Ecto.Enum, values: [:"terminal.connection_token"])

    field(:secret, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:secret, :object, :location])
    |> validate_required([:secret, :object])
  end
end