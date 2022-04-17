defmodule ExOAPI.Stripe.Schemas.PaymentLinksResourceCompletionBehaviorRedirect do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:url** :: *:string*

  The URL the customer will be redirected to after the purchase is complete.


  """

  @primary_key false
  typed_embedded_schema do
    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url])
    |> validate_required([:url])
  end
end