defmodule ExOAPI.Stripe.Schemas.SubscriptionsResourcePendingUpdate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Pending Updates store the changes pending from a previous update that will be applied
  to the Subscription upon successful payment.

  **:billing_cycle_anchor** :: *:integer*

  If the update is applied, determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.


  **:expires_at** :: *:integer*

  The point after which the changes reflected by this update will be discarded and no longer applied.


  **::subscription_items** :: *ExOAPI.Stripe.Schemas.SubscriptionItem*


  **:trial_end** :: *:integer*

  Unix timestamp representing the end of the trial period the customer will get before being charged for the first time, if the update is applied.


  **:trial_from_plan** :: *:boolean*

  Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed. See [Using trial periods on subscriptions](https://stripe.com/docs/billing/subscriptions/trials) to learn more.


  """

  @primary_key false
  typed_embedded_schema do
    field(:billing_cycle_anchor, :integer)

    field(:expires_at, :integer)

    embeds_many(:subscription_items, ExOAPI.Stripe.Schemas.SubscriptionItem)

    field(:trial_end, :integer)

    field(:trial_from_plan, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:trial_from_plan, :trial_end, :expires_at, :billing_cycle_anchor])
    |> validate_required([:expires_at])
    |> cast_embed(:subscription_items)
  end
end