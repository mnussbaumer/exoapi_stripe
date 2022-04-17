defmodule ExOAPI.Stripe.Schemas.PaymentPagesCheckoutSessionTaxId do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:type** :: *:string*

  The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, or `unknown`


  **:value** :: *:string*

  The value of the tax ID.


  """

  @primary_key false
  typed_embedded_schema do
    field(:type, Ecto.Enum,
      values: [
        :za_vat,
        :us_ein,
        :unknown,
        :ua_vat,
        :tw_vat,
        :th_vat,
        :si_tin,
        :sg_uen,
        :sg_gst,
        :sa_vat,
        :ru_kpp,
        :ru_inn,
        :nz_gst,
        :no_vat,
        :my_sst,
        :my_itn,
        :my_frp,
        :mx_rfc,
        :li_uid,
        :kr_brn,
        :jp_rn,
        :jp_cn,
        :is_vat,
        :in_gst,
        :il_vat,
        :id_npwp,
        :hu_tin,
        :hk_br,
        :ge_vat,
        :gb_vat,
        :eu_vat,
        :es_cif,
        :cl_tin,
        :ch_vat,
        :ca_qst,
        :ca_pst_sk,
        :ca_pst_mb,
        :ca_pst_bc,
        :ca_gst_hst,
        :ca_bn,
        :br_cpf,
        :br_cnpj,
        :bg_uic,
        :au_arn,
        :au_abn,
        :ae_trn
      ]
    )

    field(:value, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:value, :type])
    |> validate_required([:type])
  end
end