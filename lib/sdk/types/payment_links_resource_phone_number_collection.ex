defmodule ExOAPI.Stripe.Schemas.PaymentLinksResourcePhoneNumberCollection do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:enabled** :: *:boolean*

  If `true`, a phone number will be collected during checkout.


  """

  @primary_key false
  typed_embedded_schema do
    field(:enabled, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:enabled])
    |> validate_required([:enabled])
  end
end