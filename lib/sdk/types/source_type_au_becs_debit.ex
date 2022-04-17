defmodule ExOAPI.Stripe.Schemas.SourceTypeAuBecsDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bsb_number** :: *:string*


  **:fingerprint** :: *:string*


  **:last4** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:bsb_number, :string)

    field(:fingerprint, :string)

    field(:last4, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:last4, :fingerprint, :bsb_number])
  end
end