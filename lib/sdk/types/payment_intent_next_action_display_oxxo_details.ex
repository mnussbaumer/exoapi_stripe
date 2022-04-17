defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionDisplayOxxoDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:expires_after** :: *:integer*

  The timestamp after which the OXXO voucher expires.


  **:hosted_voucher_url** :: *:string*

  The URL for the hosted OXXO voucher page, which allows customers to view and print an OXXO voucher.


  **:number** :: *:string*

  OXXO reference number.


  """

  @primary_key false
  typed_embedded_schema do
    field(:expires_after, :integer)

    field(:hosted_voucher_url, :string)

    field(:number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:number, :hosted_voucher_url, :expires_after])
  end
end