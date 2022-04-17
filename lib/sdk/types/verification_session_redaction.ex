defmodule ExOAPI.Stripe.Schemas.VerificationSessionRedaction do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:status** :: *:string*

  Indicates whether this object and its related objects have been redacted or not.


  """

  @primary_key false
  typed_embedded_schema do
    field(:status, Ecto.Enum, values: [:redacted, :processing])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status])
    |> validate_required([:status])
  end
end