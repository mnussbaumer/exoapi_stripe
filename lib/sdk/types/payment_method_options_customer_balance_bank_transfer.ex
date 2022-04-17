defmodule ExOAPI.Stripe.Schemas.PaymentMethodOptionsCustomerBalanceBankTransfer do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::requested_address_types** :: *:string*


  **:type** :: *:string*

  The bank transfer type that this PaymentIntent is allowed to use for funding. Permitted values include: `us_bank_account`, `eu_bank_account`, `id_bank_account`, `gb_bank_account`, `jp_bank_account`, `mx_bank_account`, `eu_bank_transfer`, `gb_bank_transfer`, `id_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:requested_address_types, {:array, :string})

    field(:type, Ecto.Enum,
      values: [
        :us_bank_transfer,
        :us_bank_account,
        :mx_bank_transfer,
        :mx_bank_account,
        :jp_bank_transfer,
        :jp_bank_account,
        :id_bank_transfer,
        :id_bank_account,
        :gb_bank_transfer,
        :gb_bank_account,
        :eu_bank_transfer,
        :eu_bank_account
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :requested_address_types])
  end
end