defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionAutomaticTax do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:enabled** :: *:boolean*

  Indicates whether automatic tax is enabled for the session


  **:status** :: *:string*

  The status of the most recent automated tax calculation for this session.


  """

  @primary_key false
  typed_embedded_schema do
    field(:enabled, :boolean)

    field(:status, Ecto.Enum, values: [:requires_location_inputs, :failed, :complete])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :enabled])
    |> validate_required([:enabled])
  end
end