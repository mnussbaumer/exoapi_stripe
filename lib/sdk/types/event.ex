defmodule ExOAPI.Stripe.Schemas.Event do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Events are our way of letting you know when something interesting happens in
  your account. When an interesting event occurs, we create a new `Event`
  object. For example, when a charge succeeds, we create a `charge.succeeded`
  event; and when an invoice payment attempt fails, we create an
  `invoice.payment_failed` event. Note that many API requests may cause multiple
  events to be created. For example, if you create a new subscription for a
  customer, you will receive both a `customer.subscription.created` event and a
  `charge.succeeded` event.

  Events occur when the state of another API resource changes. The state of that
  resource at the time of the change is embedded in the event's data field. For
  example, a `charge.succeeded` event will contain a charge, and an
  `invoice.payment_failed` event will contain an invoice.

  As with other API resources, you can use endpoints to retrieve an
  [individual event](https://stripe.com/docs/api#retrieve_event) or a [list of events](https://stripe.com/docs/api#list_events)
  from the API. We also have a separate
  [webhooks](http://en.wikipedia.org/wiki/Webhook) system for sending the
  `Event` objects directly to an endpoint on your server. Webhooks are managed
  in your
  [account settings](https://dashboard.stripe.com/account/webhooks),
  and our [Using Webhooks](https://stripe.com/docs/webhooks) guide will help you get set up.

  When using [Connect](https://stripe.com/docs/connect), you can also receive notifications of
  events that occur in connected accounts. For these events, there will be an
  additional `account` attribute in the received `Event` object.

  **NOTE:** Right now, access to events through the [Retrieve Event API](https://stripe.com/docs/api#retrieve_event) is
  guaranteed only for 30 days.

  **:account** :: *ExOAPI.Stripe.Schemas.Account*

  The connected account that originated the event.


  **:api_version** :: *:string*

  The Stripe API version used to render `data`. *Note: This property is populated only for events on or after October 31, 2014*.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:data** :: *ExOAPI.Stripe.Schemas.NotificationEventData*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:pending_webhooks** :: *:integer*

  Number of webhooks that have yet to be successfully delivered (i.e., to return a 20x response) to the URLs you've specified.


  **:request** :: *ExOAPI.Stripe.Schemas.NotificationEventRequest*

  Information on the API request that instigated the event.


  **:type** :: *:string*

  Description of the event (e.g., `invoice.created` or `charge.refunded`).


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, :string)

    field(:api_version, :string)

    field(:created, :integer)

    embeds_one(:data, ExOAPI.Stripe.Schemas.NotificationEventData)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:event])

    field(:pending_webhooks, :integer)

    field(:request, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.NotificationEventRequest]
    )

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :request,
      :pending_webhooks,
      :object,
      :livemode,
      :id,
      :created,
      :api_version,
      :account
    ])
    |> validate_required([:type, :pending_webhooks, :object, :livemode, :id, :created])
    |> cast_embed(:data, required: true)
  end
end