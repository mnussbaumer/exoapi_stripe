defmodule ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceSetReaderDisplayAction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Represents a reader action to set the reader display

  **:cart** :: *ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceCart*

  Cart object to be displayed by the reader.


  **:type** :: *:string*

  Type of information to be displayed by the reader.


  """

  @primary_key false
  typed_embedded_schema do
    field(:cart, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.TerminalReaderReaderResourceCart]
    )

    field(:type, Ecto.Enum, values: [:cart])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :cart])
    |> validate_required([:type])
  end
end