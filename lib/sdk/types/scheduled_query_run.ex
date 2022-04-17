defmodule ExOAPI.Stripe.Schemas.ScheduledQueryRun do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: If you have [scheduled a Sigma query](https://stripe.com/docs/sigma/scheduled-queries), you'll
  receive a `sigma.scheduled_query_run.created` webhook each time the query
  runs. The webhook contains a `ScheduledQueryRun` object, which you can use to
  retrieve the query results.

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:data_load_time** :: *:integer*

  When the query was run, Sigma contained a snapshot of your Stripe data at this time.


  **:error** :: *ExOAPI.Stripe.Schemas.SigmaScheduledQueryRunError*


  **:file** :: *ExOAPI.Stripe.Schemas.File*

  The file object representing the results of the query.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:result_available_until** :: *:integer*

  Time at which the result expires and is no longer available for download.


  **:sql** :: *:string*

  SQL for the query.


  **:status** :: *:string*

  The query's execution status, which will be `completed` for successful runs, and `canceled`, `failed`, or `timed_out` otherwise.


  **:title** :: *:string*

  Title of the query.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:data_load_time, :integer)

    embeds_one(:error, ExOAPI.Stripe.Schemas.SigmaScheduledQueryRunError)

    field(:file, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.File])

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:scheduled_query_run])

    field(:result_available_until, :integer)

    field(:sql, :string)

    field(:status, :string)

    field(:title, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :title,
      :status,
      :sql,
      :result_available_until,
      :object,
      :livemode,
      :id,
      :file,
      :data_load_time,
      :created
    ])
    |> validate_required([
      :title,
      :status,
      :sql,
      :result_available_until,
      :object,
      :livemode,
      :id,
      :data_load_time,
      :created
    ])
    |> cast_embed(:error)
  end
end