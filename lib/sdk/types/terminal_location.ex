defmodule ExOAPI.Stripe.Schemas.Terminal_location do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Location represents a grouping of readers.

  Related guide: [Fleet Management](https://stripe.com/docs/terminal/fleet/locations).

  **:address** :: *ExOAPI.Stripe.Schemas.Address*


  **:configuration_overrides** :: *:string*

  The ID of a configuration that will be used to customize all readers in this location.


  **:display_name** :: *:string*

  The display name of the location.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:address, ExOAPI.Stripe.Schemas.Address)

    field(:configuration_overrides, :string)

    field(:display_name, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"terminal.location"])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :metadata, :livemode, :id, :display_name, :configuration_overrides])
    |> validate_required([:object, :metadata, :livemode, :id, :display_name])
    |> cast_embed(:address, required: true)
  end
end