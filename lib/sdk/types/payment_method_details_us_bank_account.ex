defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsUsBankAccount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:account_holder_type** :: *:string*

  Account holder type: individual or company.


  **:account_type** :: *:string*

  Account type: checkings or savings. Defaults to checking if omitted.


  **:bank_name** :: *:string*

  Name of the bank associated with the bank account.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:last4** :: *:string*

  Last four digits of the bank account number.


  **:routing_number** :: *:string*

  Routing number of the bank account.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account_holder_type, Ecto.Enum, values: [:individual, :company])

    field(:account_type, Ecto.Enum, values: [:savings, :checking])

    field(:bank_name, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:routing_number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :routing_number,
      :last4,
      :fingerprint,
      :bank_name,
      :account_type,
      :account_holder_type
    ])
  end
end