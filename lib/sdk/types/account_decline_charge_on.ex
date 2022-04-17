defmodule ExOAPI.Stripe.Schemas.AccountDeclineChargeOn do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:avs_failure** :: *:boolean*

  Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.


  **:cvc_failure** :: *:boolean*

  Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.


  """

  @primary_key false
  typed_embedded_schema do
    field(:avs_failure, :boolean)

    field(:cvc_failure, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:cvc_failure, :avs_failure])
    |> validate_required([:cvc_failure, :avs_failure])
  end
end