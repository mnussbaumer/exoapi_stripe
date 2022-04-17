defmodule ExOAPI.Stripe.Schemas.Radar_valueListItem do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.

  Related guide: [Managing List Items](https://stripe.com/docs/radar/lists#managing-list-items).

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:created_by** :: *:string*

  The name or email address of the user who added this item to the value list.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:value** :: *:string*

  The value of the item.


  **:value_list** :: *:string*

  The identifier of the value list this item belongs to.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:created_by, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:"radar.value_list_item"])

    field(:value, :string)

    field(:value_list, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:value_list, :value, :object, :livemode, :id, :created_by, :created])
    |> validate_required([:value_list, :value, :object, :livemode, :id, :created_by, :created])
  end
end