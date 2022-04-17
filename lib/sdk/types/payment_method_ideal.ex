defmodule ExOAPI.Stripe.Schemas.PaymentMethodIdeal do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank** :: *:string*

  The customer's bank, if provided. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.


  **:bic** :: *:string*

  The Bank Identifier Code of the customer's bank, if the bank was provided.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank, Ecto.Enum,
      values: [
        :van_lanschot,
        :triodos_bank,
        :sns_bank,
        :revolut,
        :regiobank,
        :rabobank,
        :moneyou,
        :knab,
        :ing,
        :handelsbanken,
        :bunq,
        :asn_bank,
        :abn_amro
      ]
    )

    field(:bic, Ecto.Enum,
      values: [
        :TRIONL2U,
        :SNSBNL2A,
        :REVOLT21,
        :RBRBNL21,
        :RABONL2U,
        :MOYONL21,
        :KNABNL2H,
        :INGBNL2A,
        :HANDNL2A,
        :FVLBNL22,
        :BUNQNL2A,
        :ASNBNL21,
        :ABNANL2A
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:bic, :bank])
  end
end