defmodule ExOAPI.Stripe.Schemas.PaymentLinksResourceSubscriptionData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:trial_period_days** :: *:integer*

  Integer representing the number of trial period days before the customer is charged for the first time.


  """

  @primary_key false
  typed_embedded_schema do
    field(:trial_period_days, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:trial_period_days])
  end
end