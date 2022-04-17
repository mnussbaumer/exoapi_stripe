defmodule ExOAPI.Stripe.Schemas.PaymentMethodP24 do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank** :: *:string*

  The customer's bank, if provided.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank, Ecto.Enum,
      values: [
        :volkswagen_bank,
        :toyota_bank,
        :tmobile_usbugi_bankowe,
        :santander_przelew24,
        :plus_bank,
        :pbac_z_ipko,
        :noble_pay,
        :nest_przelew,
        :mbank_mtransfer,
        :inteligo,
        :ing,
        :ideabank,
        :getin_bank,
        :etransfer_pocztowy24,
        :envelobank,
        :credit_agricole,
        :citi_handlowy,
        :boz,
        :bnp_paribas,
        :blik,
        :banki_spbdzielcze,
        :bank_pekao_sa,
        :bank_nowy_bfg_sa,
        :bank_millennium,
        :alior_bank
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:bank])
  end
end