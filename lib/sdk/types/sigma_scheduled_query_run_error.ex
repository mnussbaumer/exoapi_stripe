defmodule ExOAPI.Stripe.Schemas.SigmaScheduledQueryRunError do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:message** :: *:string*

  Information about the run failure.


  """

  @primary_key false
  typed_embedded_schema do
    field(:message, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:message])
    |> validate_required([:message])
  end
end