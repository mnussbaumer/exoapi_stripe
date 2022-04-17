defmodule ExOAPI.Stripe.Schemas.PaymentMethodEps do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank** :: *:string*

  The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank, Ecto.Enum,
      values: [
        :vr_bank_braunau,
        :volkskreditbank_ag,
        :volksbank_gruppe,
        :sparda_bank_wien,
        :schoellerbank_ag,
        :raiffeisen_bankengruppe_osterreich,
        :oberbank_ag,
        :marchfelder_bank,
        :hypo_vorarlberg_bank_ag,
        :hypo_tirol_bank_ag,
        :hypo_oberosterreich_salzburg_steiermark,
        :hypo_noe_lb_fur_niederosterreich_u_wien,
        :hypo_bank_burgenland_aktiengesellschaft,
        :hypo_alpeadriabank_international_ag,
        :erste_bank_und_sparkassen,
        :easybank_ag,
        :dolomitenbank,
        :capital_bank_grawe_gruppe_ag,
        :btv_vier_lander_bank,
        :brull_kallmus_bank_ag,
        :bks_bank_ag,
        :bawag_psk_ag,
        :bankhaus_schelhammer_und_schattera_ag,
        :bankhaus_carl_spangler,
        :bank_austria,
        :austrian_anadi_bank_ag,
        :arzte_und_apotheker_bank
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