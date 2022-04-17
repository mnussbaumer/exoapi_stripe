defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionBoleto do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:expires_at** :: *:integer*

  The timestamp after which the boleto expires.


  **:hosted_voucher_url** :: *:string*

  The URL to the hosted boleto voucher page, which allows customers to view the boleto voucher.


  **:number** :: *:string*

  The boleto number.


  **:pdf** :: *:string*

  The URL to the downloadable boleto voucher PDF.


  """

  @primary_key false
  typed_embedded_schema do
    field(:expires_at, :integer)

    field(:hosted_voucher_url, :string)

    field(:number, :string)

    field(:pdf, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:pdf, :number, :hosted_voucher_url, :expires_at])
  end
end