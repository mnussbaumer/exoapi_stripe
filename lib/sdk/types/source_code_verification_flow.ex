defmodule ExOAPI.Stripe.Schemas.SourceCodeVerificationFlow do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:attempts_remaining** :: *:integer*

  The number of attempts remaining to authenticate the source object with a verification code.


  **:status** :: *:string*

  The status of the code verification, either `pending` (awaiting verification, `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be 0).


  """

  @primary_key false
  typed_embedded_schema do
    field(:attempts_remaining, :integer)

    field(:status, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :attempts_remaining])
    |> validate_required([:status, :attempts_remaining])
  end
end