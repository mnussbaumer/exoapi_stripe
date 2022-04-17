defmodule ExOAPI.Stripe.Schemas.SourceOwner do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  Owner's address.


  **:email** :: *:string*

  Owner's email address.


  **:name** :: *:string*

  Owner's full name.


  **:phone** :: *:string*

  Owner's phone number (including extension).


  **:verified_address** :: *ExOAPI.Stripe.Schemas.Address*

  Verified owner's address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.


  **:verified_email** :: *:string*

  Verified owner's email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.


  **:verified_name** :: *:string*

  Verified owner's full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.


  **:verified_phone** :: *:string*

  Verified owner's phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:email, :string)

    field(:name, :string)

    field(:phone, :string)

    field(:verified_address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:verified_email, :string)

    field(:verified_name, :string)

    field(:verified_phone, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :verified_phone,
      :verified_name,
      :verified_email,
      :verified_address,
      :phone,
      :name,
      :email,
      :address
    ])
  end
end