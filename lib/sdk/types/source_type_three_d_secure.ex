defmodule ExOAPI.Stripe.Schemas.SourceTypeThreeDSecure do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address_line1_check** :: *:string*


  **:address_zip_check** :: *:string*


  **:authenticated** :: *:boolean*


  **:brand** :: *:string*


  **:card** :: *ExOAPI.Stripe.Schemas.Card*


  **:country** :: *:string*


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer*


  **:cvc_check** :: *:string*


  **:dynamic_last4** :: *:string*


  **:exp_month** :: *:integer*


  **:exp_year** :: *:integer*


  **:fingerprint** :: *:string*


  **:funding** :: *:string*


  **:last4** :: *:string*


  **:name** :: *:string*


  **:three_d_secure** :: *ExOAPI.Stripe.Schemas.ThreeDSecure*


  **:tokenization_method** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:address_line1_check, :string)

    field(:address_zip_check, :string)

    field(:authenticated, :boolean)

    field(:brand, :string)

    field(:card, :string)

    field(:country, :string)

    field(:customer, :string)

    field(:cvc_check, :string)

    field(:dynamic_last4, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:fingerprint, :string)

    field(:funding, :string)

    field(:last4, :string)

    field(:name, :string)

    field(:three_d_secure, :string)

    field(:tokenization_method, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :tokenization_method,
      :three_d_secure,
      :name,
      :last4,
      :funding,
      :fingerprint,
      :exp_year,
      :exp_month,
      :dynamic_last4,
      :cvc_check,
      :customer,
      :country,
      :card,
      :brand,
      :authenticated,
      :address_zip_check,
      :address_line1_check
    ])
  end
end