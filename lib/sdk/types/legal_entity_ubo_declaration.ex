defmodule ExOAPI.Stripe.Schemas.LegalEntityUboDeclaration do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:date** :: *:integer*

  The Unix timestamp marking when the beneficial owner attestation was made.


  **:ip** :: *:string*

  The IP address from which the beneficial owner attestation was made.


  **:user_agent** :: *:string*

  The user-agent string from the browser where the beneficial owner attestation was made.


  """

  @primary_key false
  typed_embedded_schema do
    field(:date, :integer)

    field(:ip, :string)

    field(:user_agent, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:user_agent, :ip, :date])
  end
end