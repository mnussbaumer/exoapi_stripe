defmodule ExOAPI.Stripe.Schemas.SubscriptionPendingInvoiceItemInterval do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:interval** :: *:string*

  Specifies invoicing frequency. Either `day`, `week`, `month` or `year`.


  **:interval_count** :: *:integer*

  The number of intervals between invoices. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks).


  """

  @primary_key false
  typed_embedded_schema do
    field(:interval, Ecto.Enum, values: [:year, :week, :month, :day])

    field(:interval_count, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:interval_count, :interval])
    |> validate_required([:interval_count, :interval])
  end
end