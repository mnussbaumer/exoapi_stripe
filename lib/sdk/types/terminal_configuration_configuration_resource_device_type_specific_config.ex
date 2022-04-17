defmodule ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:splashscreen** :: *ExOAPI.Stripe.Schemas.File | :string*

  A File ID representing an image you would like displayed on the reader.


  """

  @primary_key false
  typed_embedded_schema do
    field(:splashscreen, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:splashscreen])
  end
end