defmodule ExOAPI.Stripe.Schemas.PlatformTaxFee do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:account** :: *ExOAPI.Stripe.Schemas.Account*

  The Connected account that incurred this charge.


  **:id** :: *:string*

  Unique identifier for the object.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:source_transaction** :: *ExOAPI.Stripe.Schemas.SourceTransaction*

  The payment object that caused this tax to be inflicted.


  **:type** :: *:string*

  The type of tax (VAT).


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, :string)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:platform_tax_fee])

    field(:source_transaction, :string)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :source_transaction, :object, :id, :account])
    |> validate_required([:type, :source_transaction, :object, :id, :account])
  end
end