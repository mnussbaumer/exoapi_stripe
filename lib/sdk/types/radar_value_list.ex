defmodule ExOAPI.Stripe.Schemas.Radar_valueList do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Value lists allow you to group values together which can then be referenced in rules.

  Related guide: [Default Stripe Lists](https://stripe.com/docs/radar/lists#managing-list-items).

  **:alias** :: *:string*

  The name of the value list for use in rules.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:created_by** :: *:string*

  The name or email address of the user who created this value list.


  **:id** :: *:string*

  Unique identifier for the object.


  **:item_type** :: *:string*

  The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, `case_sensitive_string`, or `customer_id`.


  **::data** :: *ExOAPI.Stripe.Schemas.Radar_valueListItem*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:name** :: *:string*

  The name of the value list.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:alias, :string)

    field(:created, :integer)

    field(:created_by, :string)

    field(:id, :string)

    field(:item_type, Ecto.Enum,
      values: [
        :string,
        :ip_address,
        :email,
        :customer_id,
        :country,
        :case_sensitive_string,
        :card_fingerprint,
        :card_bin
      ]
    )

    field(:list_items, :map)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:"radar.value_list"])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :object,
      :name,
      :metadata,
      :livemode,
      :list_items,
      :item_type,
      :id,
      :created_by,
      :created,
      :alias
    ])
    |> validate_required([
      :object,
      :name,
      :metadata,
      :livemode,
      :list_items,
      :item_type,
      :id,
      :created_by,
      :created,
      :alias
    ])
  end
end