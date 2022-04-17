defmodule ExOAPI.Stripe.Schemas.BillingPortal_configuration do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A portal configuration describes the functionality and behavior of a portal session.

  **:active** :: *:boolean*

  Whether the configuration is active and can be used to create portal sessions.


  **:application** :: *ExOAPI.Stripe.Schemas.Application*

  ID of the Connect Application that created the configuration.


  **:business_profile** :: *ExOAPI.Stripe.Schemas.PortalBusinessProfile*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:default_return_url** :: *:string*

  The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.


  **:features** :: *ExOAPI.Stripe.Schemas.PortalFeatures*


  **:id** :: *:string*

  Unique identifier for the object.


  **:is_default** :: *:boolean*

  Whether the configuration is the default. If `true`, this configuration can be managed in the Dashboard and portal sessions will use this configuration unless it is overriden when creating the session.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:updated** :: *:integer*

  Time at which the object was last updated. Measured in seconds since the Unix epoch.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:application, :string)

    embeds_one(:business_profile, ExOAPI.Stripe.Schemas.PortalBusinessProfile)

    field(:created, :integer)

    field(:default_return_url, :string)

    embeds_one(:features, ExOAPI.Stripe.Schemas.PortalFeatures)

    field(:id, :string)

    field(:is_default, :boolean)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:"billing_portal.configuration"])

    field(:updated, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :updated,
      :object,
      :metadata,
      :livemode,
      :is_default,
      :id,
      :default_return_url,
      :created,
      :application,
      :active
    ])
    |> validate_required([:updated, :object, :livemode, :is_default, :id, :created, :active])
    |> cast_embed(:features, required: true)
    |> cast_embed(:business_profile, required: true)
  end
end