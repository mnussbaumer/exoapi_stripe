defmodule ExOAPI.Stripe.Schemas.TestHelpers_testClock do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A test clock enables deterministic control over objects in testmode. With a test clock, you can create
  objects at a frozen time in the past or future, and advance to a specific future time to observe webhooks and state changes. After the clock advances,
  you can either validate the current state of your scenario (and test your assumptions), change the current state of your scenario (and test more complex scenarios), or keep advancing forward in time.

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:deletes_after** :: *:integer*

  Time at which this clock is scheduled to auto delete.


  **:frozen_time** :: *:integer*

  Time at which all objects belonging to this clock are frozen.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:name** :: *:string*

  The custom name supplied at creation.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:status** :: *:string*

  The status of the Test Clock.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:deletes_after, :integer)

    field(:frozen_time, :integer)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:"test_helpers.test_clock"])

    field(:status, Ecto.Enum, values: [:ready, :internal_failure, :advancing])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :status,
      :object,
      :name,
      :livemode,
      :id,
      :frozen_time,
      :deletes_after,
      :created
    ])
    |> validate_required([
      :status,
      :object,
      :livemode,
      :id,
      :frozen_time,
      :deletes_after,
      :created
    ])
  end
end