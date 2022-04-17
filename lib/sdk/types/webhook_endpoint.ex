defmodule ExOAPI.Stripe.Schemas.WebhookEndpoint do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: You can configure [webhook endpoints](https://stripe.com/docs/webhooks/) via the API to be
  notified about events that happen in your Stripe account or connected
  accounts.

  Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.

  Related guide: [Setting up Webhooks](https://stripe.com/docs/webhooks/configure).

  **:api_version** :: *:string*

  The API version events are rendered as for this webhook endpoint.


  **:application** :: *ExOAPI.Stripe.Schemas.Application*

  The ID of the associated Connect application.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:description** :: *:string*

  An optional description of what the webhook is used for.


  **::enabled_events** :: *:string*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:secret** :: *:string*

  The endpoint's secret, used to generate [webhook signatures](https://stripe.com/docs/webhooks/signatures). Only returned at creation.


  **:status** :: *:string*

  The status of the webhook. It can be `enabled` or `disabled`.


  **:url** :: *:string*

  The URL of the webhook endpoint.


  """

  @primary_key false
  typed_embedded_schema do
    field(:api_version, :string)

    field(:application, :string)

    field(:created, :integer)

    field(:description, :string)

    field(:enabled_events, {:array, :string})

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:webhook_endpoint])

    field(:secret, :string)

    field(:status, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :status,
      :secret,
      :object,
      :metadata,
      :livemode,
      :id,
      :enabled_events,
      :description,
      :created,
      :application,
      :api_version
    ])
    |> validate_required([:url, :status, :object, :metadata, :livemode, :id, :created])
  end
end