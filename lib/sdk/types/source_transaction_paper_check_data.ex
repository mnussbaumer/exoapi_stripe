defmodule ExOAPI.Stripe.Schemas.SourceTransactionPaperCheckData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:available_at** :: *:string*

  Time at which the deposited funds will be available for use. Measured in seconds since the Unix epoch.


  **:invoices** :: *:string*

  Comma-separated list of invoice IDs associated with the paper check.


  """

  @primary_key false
  typed_embedded_schema do
    field(:available_at, :string)

    field(:invoices, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:invoices, :available_at])
  end
end