defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsCardWalletMasterpass do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:billing_address** :: *ExOAPI.Stripe.Schemas.Address*

  Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.


  **:email** :: *:string*

  Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.


  **:name** :: *:string*

  Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.


  **:shipping_address** :: *ExOAPI.Stripe.Schemas.Address*

  Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.


  """

  @primary_key false
  typed_embedded_schema do
    field(:billing_address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:email, :string)

    field(:name, :string)

    field(:shipping_address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:shipping_address, :name, :email, :billing_address])
  end
end