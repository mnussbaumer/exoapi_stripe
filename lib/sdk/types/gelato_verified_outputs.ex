defmodule ExOAPI.Stripe.Schemas.GelatoVerifiedOutputs do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  The user's verified address.


  **:dob** :: *ExOAPI.Stripe.Schemas.GelatoDataVerifiedOutputsDate*

  The user’s verified date of birth.


  **:first_name** :: *:string*

  The user's verified first name.


  **:id_number** :: *:string*

  The user's verified id number.


  **:id_number_type** :: *:string*

  The user's verified id number type.


  **:last_name** :: *:string*

  The user's verified last name.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:dob, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoDataVerifiedOutputsDate]
    )

    field(:first_name, :string)

    field(:id_number, :string)

    field(:id_number_type, Ecto.Enum, values: [:us_ssn, :sg_nric, :br_cpf])

    field(:last_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:last_name, :id_number_type, :id_number, :first_name, :dob, :address])
  end
end