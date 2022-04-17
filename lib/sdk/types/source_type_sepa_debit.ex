defmodule ExOAPI.Stripe.Schemas.SourceTypeSepaDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank_code** :: *:string*


  **:branch_code** :: *:string*


  **:country** :: *:string*


  **:fingerprint** :: *:string*


  **:last4** :: *:string*


  **:mandate_reference** :: *:string*


  **:mandate_url** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank_code, :string)

    field(:branch_code, :string)

    field(:country, :string)

    field(:fingerprint, :string)

    field(:last4, :string)

    field(:mandate_reference, :string)

    field(:mandate_url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :mandate_url,
      :mandate_reference,
      :last4,
      :fingerprint,
      :country,
      :branch_code,
      :bank_code
    ])
  end
end