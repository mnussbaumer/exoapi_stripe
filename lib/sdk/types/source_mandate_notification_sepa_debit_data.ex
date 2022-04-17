defmodule ExOAPI.Stripe.Schemas.SourceMandateNotificationSepaDebitData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:creditor_identifier** :: *:string*

  SEPA creditor ID.


  **:last4** :: *:string*

  Last 4 digits of the account number associated with the debit.


  **:mandate_reference** :: *:string*

  Mandate reference associated with the debit.


  """

  @primary_key false
  typed_embedded_schema do
    field(:creditor_identifier, :string)

    field(:last4, :string)

    field(:mandate_reference, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:mandate_reference, :last4, :creditor_identifier])
  end
end