defmodule ExOAPI.Stripe.Schemas.Reporting_reportType do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: The Report Type resource corresponds to a particular type of report, such as
  the "Activity summary" or "Itemized payouts" reports. These objects are
  identified by an ID belonging to a set of enumerated values. See
  [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api)
  for those Report Type IDs, along with required and optional parameters.

  Note that certain report types can only be run based on your live-mode data (not test-mode
  data), and will error when queried without a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).

  **:data_available_end** :: *:integer*

  Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch.


  **:data_available_start** :: *:integer*

  Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch.


  **::default_columns** :: *:string*


  **:id** :: *:string*

  The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as `balance.summary.1`.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:name** :: *:string*

  Human-readable name of the Report Type


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:updated** :: *:integer*

  When this Report Type was latest updated. Measured in seconds since the Unix epoch.


  **:version** :: *:integer*

  Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas.


  """

  @primary_key false
  typed_embedded_schema do
    field(:data_available_end, :integer)

    field(:data_available_start, :integer)

    field(:default_columns, {:array, :string})

    field(:id, :string)

    field(:livemode, :boolean)

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:"reporting.report_type"])

    field(:updated, :integer)

    field(:version, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :version,
      :updated,
      :object,
      :name,
      :livemode,
      :id,
      :default_columns,
      :data_available_start,
      :data_available_end
    ])
    |> validate_required([
      :version,
      :updated,
      :object,
      :name,
      :livemode,
      :id,
      :data_available_start,
      :data_available_end
    ])
  end
end