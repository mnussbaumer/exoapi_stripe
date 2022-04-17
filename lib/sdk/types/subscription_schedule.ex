defmodule ExOAPI.Stripe.Schemas.SubscriptionSchedule do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.

  Related guide: [Subscription Schedules](https://stripe.com/docs/billing/subscriptions/subscription-schedules).

  **:canceled_at** :: *:integer*

  Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch.


  **:completed_at** :: *:integer*

  Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:current_phase** :: *ExOAPI.Stripe.Schemas.SubscriptionScheduleCurrentPhase*

  Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  ID of the customer who owns the subscription schedule.


  **:default_settings** :: *ExOAPI.Stripe.Schemas.SubscriptionSchedulesResourceDefaultSettings*


  **:end_behavior** :: *:string*

  Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` and `cancel`.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **::phases** :: *ExOAPI.Stripe.Schemas.SubscriptionSchedulePhaseConfiguration*


  **:released_at** :: *:integer*

  Time at which the subscription schedule was released. Measured in seconds since the Unix epoch.


  **:released_subscription** :: *:string*

  ID of the subscription once managed by the subscription schedule (if it is released).


  **:status** :: *:string*

  The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://stripe.com/docs/billing/subscriptions/subscription-schedules).


  **:subscription** :: *ExOAPI.Stripe.Schemas.Subscription | :string*

  ID of the subscription managed by the subscription schedule.


  **:test_clock** :: *ExOAPI.Stripe.Schemas.TestHelpers_testClock | :string*

  ID of the test clock this subscription schedule belongs to.


  """

  @primary_key false
  typed_embedded_schema do
    field(:canceled_at, :integer)

    field(:completed_at, :integer)

    field(:created, :integer)

    field(:current_phase, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SubscriptionScheduleCurrentPhase]
    )

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    embeds_one(
      :default_settings,
      ExOAPI.Stripe.Schemas.SubscriptionSchedulesResourceDefaultSettings
    )

    field(:end_behavior, Ecto.Enum, values: [:renew, :release, :none, :cancel])

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:subscription_schedule])

    embeds_many(:phases, ExOAPI.Stripe.Schemas.SubscriptionSchedulePhaseConfiguration)

    field(:released_at, :integer)

    field(:released_subscription, :string)

    field(:status, Ecto.Enum, values: [:released, :not_started, :completed, :canceled, :active])

    field(:subscription, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Subscription]
    )

    field(:test_clock, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.TestHelpers_testClock]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :test_clock,
      :subscription,
      :status,
      :released_subscription,
      :released_at,
      :object,
      :metadata,
      :livemode,
      :id,
      :end_behavior,
      :customer,
      :current_phase,
      :created,
      :completed_at,
      :canceled_at
    ])
    |> validate_required([:status, :object, :livemode, :id, :end_behavior, :customer, :created])
    |> cast_embed(:phases, required: true)
    |> cast_embed(:default_settings, required: true)
  end
end