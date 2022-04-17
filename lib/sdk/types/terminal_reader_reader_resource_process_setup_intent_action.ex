defmodule ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceProcessSetupIntentAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Represents a reader action to process a setup intent

  **:generated_card** :: *:string*


  **:setup_intent** :: *ExOAPI.Stripe.Schemas.SetupIntent | :string*

  Most recent SetupIntent processed by the reader.


  """

  @primary_key false
  typed_embedded_schema do
    field(:generated_card, :string)

    field(:setup_intent, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.SetupIntent]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:setup_intent, :generated_card])
    |> validate_required([:setup_intent])
  end
end