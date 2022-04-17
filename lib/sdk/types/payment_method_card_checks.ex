defmodule ExOAPI.Stripe.Schemas.PaymentMethodCardChecks do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address_line1_check** :: *:string*

  If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.


  **:address_postal_code_check** :: *:string*

  If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.


  **:cvc_check** :: *:string*

  If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address_line1_check, :string)

    field(:address_postal_code_check, :string)

    field(:cvc_check, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:cvc_check, :address_postal_code_check, :address_line1_check])
  end
end