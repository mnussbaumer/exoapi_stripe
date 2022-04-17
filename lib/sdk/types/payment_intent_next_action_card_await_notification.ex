defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionCardAwaitNotification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:charge_attempt_at** :: *:integer*

  The time that payment will be attempted. If customer approval is required, they need to provide approval before this time.


  **:customer_approval_required** :: *:boolean*

  For payments greater than INR 5000, the customer must provide explicit approval of the payment with their bank. For payments of lower amount, no customer action is required.


  """

  @primary_key false
  typed_embedded_schema do
    field(:charge_attempt_at, :integer)

    field(:customer_approval_required, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:customer_approval_required, :charge_attempt_at])
  end
end