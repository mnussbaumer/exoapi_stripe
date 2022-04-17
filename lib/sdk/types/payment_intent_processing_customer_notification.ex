defmodule ExOAPI.Stripe.Schemas.PaymentIntentProcessingCustomerNotification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:approval_requested** :: *:boolean*

  Whether customer approval has been requested for this payment. For payments greater than INR 5000 or mandate amount, the customer must provide explicit approval of the payment with their bank.


  **:completes_at** :: *:integer*

  If customer approval is required, they need to provide approval before this time.


  """

  @primary_key false
  typed_embedded_schema do
    field(:approval_requested, :boolean)

    field(:completes_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:completes_at, :approval_requested])
  end
end