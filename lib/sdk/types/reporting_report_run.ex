defmodule ExOAPI.Stripe.Schemas.Reporting_reportRun do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: The Report Run object represents an instance of a report type generated with
  specific run parameters. Once the object is created, Stripe begins processing the report.
  When the report has finished running, it will give you a reference to a file
  where you can retrieve your results. For an overview, see
  [API Access to Reports](https://stripe.com/docs/reporting/statements/api).

  Note that certain report types can only be run based on your live-mode data (not test-mode
  data), and will error when queried without a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:error** :: *ExOAPI.Stripe.Schemas.Error*

  If something should go wrong during the run, a message about the failure (populated when
   `status=failed`).


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  `true` if the report is run on live mode data and `false` if it is run on test mode data.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:parameters** :: *ExOAPI.Stripe.Schemas.FinancialReportingFinanceReportRunRunParameters*


  **:report_type** :: *:string*

  The ID of the [report type](https://stripe.com/docs/reports/report-types) to run, such as `"balance.summary.1"`.


  **:result** :: *ExOAPI.Stripe.Schemas.File*

  The file object representing the result of the report run (populated when
   `status=succeeded`).


  **:status** :: *:string*

  Status of this report run. This will be `pending` when the run is initially created.
   When the run finishes, this will be set to `succeeded` and the `result` field will be populated.
   Rarely, we may encounter an error, at which point this will be set to `failed` and the `error` field will be populated.


  **:succeeded_at** :: *:integer*

  Timestamp at which this run successfully finished (populated when
   `status=succeeded`). Measured in seconds since the Unix epoch.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:error, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:"reporting.report_run"])

    embeds_one(:parameters, ExOAPI.Stripe.Schemas.FinancialReportingFinanceReportRunRunParameters)

    field(:report_type, :string)

    field(:result, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.File])

    field(:status, :string)

    field(:succeeded_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :succeeded_at,
      :status,
      :result,
      :report_type,
      :object,
      :livemode,
      :id,
      :error,
      :created
    ])
    |> validate_required([:status, :report_type, :object, :livemode, :id, :created])
    |> cast_embed(:parameters, required: true)
  end
end