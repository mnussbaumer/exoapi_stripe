defmodule ExOAPI.Stripe.Schemas.SourceTypeIdeal do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank** :: *:string*


  **:bic** :: *:string*


  **:iban_last4** :: *:string*


  **:statement_descriptor** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank, :string)

    field(:bic, :string)

    field(:iban_last4, :string)

    field(:statement_descriptor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:statement_descriptor, :iban_last4, :bic, :bank])
  end
end