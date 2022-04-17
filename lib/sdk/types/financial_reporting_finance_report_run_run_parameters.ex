defmodule ExOAPI.Stripe.Schemas.FinancialReportingFinanceReportRunRunParameters do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::columns** :: *:string*


  **:connected_account** :: *:string*

  Connected account ID by which to filter the report run.


  **:currency** :: *:string*

  Currency of objects to be included in the report run.


  **:interval_end** :: *:integer*

  Ending timestamp of data to be included in the report run (exclusive).


  **:interval_start** :: *:integer*

  Starting timestamp of data to be included in the report run.


  **:payout** :: *ExOAPI.Stripe.Schemas.Payout*

  Payout ID by which to filter the report run.


  **:reporting_category** :: *:string*

  Category of balance transactions to be included in the report run.


  **:timezone** :: *:string*

  Defaults to `Etc/UTC`. The output timezone for all timestamps in the report. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones). Has no effect on `interval_start` or `interval_end`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:columns, {:array, :string})

    field(:connected_account, :string)

    field(:currency, :string)

    field(:interval_end, :integer)

    field(:interval_start, :integer)

    field(:payout, :string)

    field(:reporting_category, :string)

    field(:timezone, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :timezone,
      :reporting_category,
      :payout,
      :interval_start,
      :interval_end,
      :currency,
      :connected_account,
      :columns
    ])
  end
end