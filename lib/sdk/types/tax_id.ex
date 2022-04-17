defmodule ExOAPI.Stripe.Schemas.TaxId do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: You can add one or multiple tax IDs to a [customer](https://stripe.com/docs/api/customers).
  A customer's tax IDs are displayed on invoices and credit notes issued for the customer.

  Related guide: [Customer Tax Identification Numbers](https://stripe.com/docs/billing/taxes/tax-ids).

  **:country** :: *:string*

  Two-letter ISO code representing the country of the tax ID.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer | :string*

  ID of the customer.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:type** :: *:string*

  Type of the tax ID, one of `ae_trn`, `au_abn`, `au_arn`, `bg_uic`, `br_cnpj`, `br_cpf`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `ch_vat`, `cl_tin`, `es_cif`, `eu_vat`, `gb_vat`, `ge_vat`, `hk_br`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `kr_brn`, `li_uid`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `th_vat`, `tw_vat`, `ua_vat`, `us_ein`, or `za_vat`. Note that some legacy tax IDs have type `unknown`


  **:value** :: *:string*

  Value of the tax ID.


  **:verification** :: *ExOAPI.Stripe.Schemas.TaxIdVerification*

  Tax ID verification information.


  """

  @primary_key false
  typed_embedded_schema do
    field(:country, :string)

    field(:created, :integer)

    field(:customer, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Customer])

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:tax_id])

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

    field(:verification, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.TaxIdVerification])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :verification,
      :value,
      :type,
      :object,
      :livemode,
      :id,
      :customer,
      :created,
      :country
    ])
    |> validate_required([:value, :type, :object, :livemode, :id, :created])
  end
end