defmodule ExOAPI.Stripe.Schemas.PaymentLinksResourceCompletionBehaviorConfirmationPage do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:custom_message** :: *:string*

  The custom message that is displayed to the customer after the purchase is complete.


  """

  @primary_key false
  typed_embedded_schema do
    field(:custom_message, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:custom_message])
  end
end