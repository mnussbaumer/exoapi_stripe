defmodule ExOAPI.Stripe.Schemas.CustomerTaxLocation do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:country** :: *:string*

  The customer's country as identified by Stripe Tax.


  **:source** :: *ExOAPI.Stripe.Schemas.Source*

  The data source used to infer the customer's location.


  **:state** :: *:string*

  The customer's state, county, province, or region as identified by Stripe Tax.


  """

  @primary_key false
  typed_embedded_schema do
    field(:country, :string)

    field(:source, Ecto.Enum,
      values: [:shipping_destination, :payment_method, :ip_address, :billing_address]
    )

    field(:state, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:state, :source, :country])
    |> validate_required([:source, :country])
  end
end