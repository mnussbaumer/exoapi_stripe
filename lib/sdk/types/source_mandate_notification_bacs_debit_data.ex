defmodule ExOAPI.Stripe.Schemas.SourceMandateNotificationBacsDebitData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:last4** :: *:string*

  Last 4 digits of the account number associated with the debit.


  """

  @primary_key false
  typed_embedded_schema do
    field(:last4, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:last4])
  end
end