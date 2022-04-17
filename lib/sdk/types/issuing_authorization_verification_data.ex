defmodule ExOAPI.Stripe.Schemas.IssuingAuthorizationVerificationData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address_line1_check** :: *:string*

  Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`.


  **:address_postal_code_check** :: *:string*

  Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`.


  **:cvc_check** :: *:string*

  Whether the cardholder provided a CVC and if it matched Stripe’s record.


  **:expiry_check** :: *:string*

  Whether the cardholder provided an expiry date and if it matched Stripe’s record.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address_line1_check, Ecto.Enum, values: [:not_provided, :mismatch, :match])

    field(:address_postal_code_check, Ecto.Enum, values: [:not_provided, :mismatch, :match])

    field(:cvc_check, Ecto.Enum, values: [:not_provided, :mismatch, :match])

    field(:expiry_check, Ecto.Enum, values: [:not_provided, :mismatch, :match])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:expiry_check, :cvc_check, :address_postal_code_check, :address_line1_check])
    |> validate_required([
      :expiry_check,
      :cvc_check,
      :address_postal_code_check,
      :address_line1_check
    ])
  end
end