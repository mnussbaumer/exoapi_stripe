defmodule ExOAPI.Stripe.Schemas.SourceMandateNotificationAcssDebitData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:statement_descriptor** :: *:string*

  The statement descriptor associate with the debit.


  """

  @primary_key false
  typed_embedded_schema do
    field(:statement_descriptor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:statement_descriptor])
  end
end