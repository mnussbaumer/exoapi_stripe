defmodule ExOAPI.Stripe.Schemas.SourceTypeBancontact do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_code** :: *:string*


  **:bank_name** :: *:string*


  **:bic** :: *:string*


  **:iban_last4** :: *:string*


  **:preferred_language** :: *:string*


  **:statement_descriptor** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_code, :string)

    field(:bank_name, :string)

    field(:bic, :string)

    field(:iban_last4, :string)

    field(:preferred_language, :string)

    field(:statement_descriptor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :statement_descriptor,
      :preferred_language,
      :iban_last4,
      :bic,
      :bank_name,
      :bank_code
    ])
  end
end