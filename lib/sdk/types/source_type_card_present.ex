defmodule ExOAPI.Stripe.Schemas.SourceTypeCardPresent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:application_cryptogram** :: *:string*


  **:application_preferred_name** :: *:string*


  **:authorization_code** :: *:string*


  **:authorization_response_code** :: *:string*


  **:brand** :: *:string*


  **:country** :: *:string*


  **:cvm_type** :: *:string*


  **:data_type** :: *:string*


  **:dedicated_file_name** :: *:string*


  **:emv_auth_data** :: *:string*


  **:evidence_customer_signature** :: *:string*


  **:evidence_transaction_certificate** :: *:string*


  **:exp_month** :: *:integer*


  **:exp_year** :: *:integer*


  **:fingerprint** :: *:string*


  **:funding** :: *:string*


  **:last4** :: *:string*


  **:pos_device_id** :: *:string*


  **:pos_entry_mode** :: *:string*


  **:read_method** :: *:string*


  **:reader** :: *:string*


  **:terminal_verification_results** :: *:string*


  **:transaction_status_information** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:application_cryptogram, :string)

    field(:application_preferred_name, :string)

    field(:authorization_code, :string)

    field(:authorization_response_code, :string)

    field(:brand, :string)

    field(:country, :string)

    field(:cvm_type, :string)

    field(:data_type, :string)

    field(:dedicated_file_name, :string)

    field(:emv_auth_data, :string)

    field(:evidence_customer_signature, :string)

    field(:evidence_transaction_certificate, :string)

    field(:exp_month, :integer)

    field(:exp_year, :integer)

    field(:fingerprint, :string)

    field(:funding, :string)

    field(:last4, :string)

    field(:pos_device_id, :string)

    field(:pos_entry_mode, :string)

    field(:read_method, :string)

    field(:reader, :string)

    field(:terminal_verification_results, :string)

    field(:transaction_status_information, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transaction_status_information,
      :terminal_verification_results,
      :reader,
      :read_method,
      :pos_entry_mode,
      :pos_device_id,
      :last4,
      :funding,
      :fingerprint,
      :exp_year,
      :exp_month,
      :evidence_transaction_certificate,
      :evidence_customer_signature,
      :emv_auth_data,
      :dedicated_file_name,
      :data_type,
      :cvm_type,
      :country,
      :brand,
      :authorization_response_code,
      :authorization_code,
      :application_preferred_name,
      :application_cryptogram
    ])
  end
end