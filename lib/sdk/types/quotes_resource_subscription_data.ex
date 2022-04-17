defmodule ExOAPI.Stripe.Schemas.QuotesResourceSubscriptionData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:effective_date** :: *:integer*

  When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. This date is ignored if it is in the past when the quote is accepted. Measured in seconds since the Unix epoch.


  **:trial_period_days** :: *:integer*

  Integer representing the number of trial period days before the customer is charged for the first time.


  """

  @primary_key false
  typed_embedded_schema do
    field(:effective_date, :integer)

    field(:trial_period_days, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:trial_period_days, :effective_date])
  end
end