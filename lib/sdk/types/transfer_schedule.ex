defmodule ExOAPI.Stripe.Schemas.TransferSchedule do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:delay_days** :: *:integer*

  The number of days charges for the account will be held before being paid out.


  **:interval** :: *:string*

  How frequently funds will be paid out. One of `manual` (payouts only created via API call), `daily`, `weekly`, or `monthly`.


  **:monthly_anchor** :: *:integer*

  The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.


  **:weekly_anchor** :: *:string*

  The day of the week funds will be paid out, of the style 'monday', 'tuesday', etc. Only shown if `interval` is weekly.


  """

  @primary_key false
  typed_embedded_schema do
    field(:delay_days, :integer)

    field(:interval, :string)

    field(:monthly_anchor, :integer)

    field(:weekly_anchor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:weekly_anchor, :monthly_anchor, :interval, :delay_days])
    |> validate_required([:interval, :delay_days])
  end
end