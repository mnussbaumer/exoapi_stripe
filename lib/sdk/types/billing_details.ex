defmodule ExOAPI.Stripe.Schemas.BillingDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  Billing address.


  **:email** :: *:string*

  Email address.


  **:name** :: *:string*

  Full name.


  **:phone** :: *:string*

  Billing phone number (including extension).


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:email, :string)

    field(:name, :string)

    field(:phone, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:phone, :name, :email, :address])
  end
end