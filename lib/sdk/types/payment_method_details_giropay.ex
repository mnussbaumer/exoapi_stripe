defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsGiropay do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_code** :: *:string*

  Bank code of bank associated with the bank account.


  **:bank_name** :: *:string*

  Name of the bank associated with the bank account.


  **:bic** :: *:string*

  Bank Identifier Code of the bank associated with the bank account.


  **:verified_name** :: *:string*

  Owner's verified full name. Values are verified or provided by Giropay directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated.
  Giropay rarely provides this information so the attribute is usually empty.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_code, :string)

    field(:bank_name, :string)

    field(:bic, :string)

    field(:verified_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verified_name, :bic, :bank_name, :bank_code])
  end
end