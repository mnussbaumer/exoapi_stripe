defmodule ExOAPI.Stripe.Schemas.PaymentMethodSepaDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_code** :: *:string*

  Bank code of bank associated with the bank account.


  **:branch_code** :: *:string*

  Branch code of bank associated with the bank account.


  **:country** :: *:string*

  Two-letter ISO code representing the country the bank account is located in.


  **:fingerprint** :: *:string*

  Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.


  **:generated_from** :: *ExOAPI.Stripe.Schemas.SepaDebitGeneratedFrom*

  Information about the object that generated this PaymentMethod.


  **:last4** :: *:string*

  Last four characters of the IBAN.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_code, :string)

    field(:branch_code, :string)

    field(:country, :string)

    field(:fingerprint, :string)

    field(:generated_from, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.SepaDebitGeneratedFrom]
    )

    field(:last4, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:last4, :generated_from, :fingerprint, :country, :branch_code, :bank_code])
  end
end