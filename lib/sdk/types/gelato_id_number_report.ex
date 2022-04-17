defmodule ExOAPI.Stripe.Schemas.GelatoIdNumberReport do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Result from an id_number check

  **:dob** :: *ExOAPI.Stripe.Schemas.GelatoDataIdNumberReportDate*

  Date of birth.


  **:error** :: *ExOAPI.Stripe.Schemas.GelatoIdNumberReportError*

  Details on the verification error. Present when status is `unverified`.


  **:first_name** :: *:string*

  First name.


  **:id_number** :: *:string*

  ID number.


  **:id_number_type** :: *:string*

  Type of ID number.


  **:last_name** :: *:string*

  Last name.


  **:status** :: *:string*

  Status of this `id_number` check.


  """

  @primary_key false
  typed_embedded_schema do
    field(:dob, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.GelatoDataIdNumberReportDate]
    )

    field(:error, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.GelatoIdNumberReportError])

    field(:first_name, :string)

    field(:id_number, :string)

    field(:id_number_type, Ecto.Enum, values: [:us_ssn, :sg_nric, :br_cpf])

    field(:last_name, :string)

    field(:status, Ecto.Enum, values: [:verified, :unverified])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :last_name, :id_number_type, :id_number, :first_name, :error, :dob])
    |> validate_required([:status])
  end
end