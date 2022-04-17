defmodule ExOAPI.Stripe.Schemas.ChargeTransferData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account.


  **:destination** :: *ExOAPI.Stripe.Schemas.Account | :string*

  ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was specified in the charge request.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:destination, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:destination, :amount])
    |> validate_required([:destination])
  end
end