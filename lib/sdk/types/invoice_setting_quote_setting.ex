defmodule ExOAPI.Stripe.Schemas.InvoiceSettingQuoteSetting do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:days_until_due** :: *:integer*

  Number of days within which a customer must pay invoices generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:days_until_due, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:days_until_due])
  end
end