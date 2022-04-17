defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsP24 do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank** :: *:string*

  The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`, `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`, `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`, `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`, `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`.


  **:reference** :: *:string*

  Unique reference for this Przelewy24 payment.


  **:verified_name** :: *:string*

  Owner's verified full name. Values are verified or provided by Przelewy24 directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated.
  Przelewy24 rarely provides this information so the attribute is usually empty.


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

    field(:reference, :string)

    field(:verified_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verified_name, :reference, :bank])
  end
end