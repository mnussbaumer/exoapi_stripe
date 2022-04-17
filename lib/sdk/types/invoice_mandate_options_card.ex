defmodule ExOAPI.Stripe.Schemas.InvoiceMandateOptionsCard do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  Amount to be charged for future payments.


  **:amount_type** :: *:string*

  One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the amount charged can be up to the value passed for the `amount` param.


  **:description** :: *:string*

  A description of the mandate or subscription that is meant to be displayed to the customer.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_type, Ecto.Enum, values: [:maximum, :fixed])

    field(:description, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:description, :amount_type, :amount])
  end
end