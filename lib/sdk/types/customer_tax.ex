defmodule ExOAPI.Stripe.Schemas.CustomerTax do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:automatic_tax** :: *ExOAPI.Stripe.Schemas.AutomaticTax*

  Surfaces if automatic tax computation is possible given the current customer location information.


  **:ip_address** :: *:string*

  A recent IP address of the customer used for tax reporting and tax location inference.


  **:location** :: *ExOAPI.Stripe.Schemas.CustomerTaxLocation*

  The customer's location as identified by Stripe Tax.


  """

  @primary_key false
  typed_embedded_schema do
    field(:automatic_tax, Ecto.Enum,
      values: [:unrecognized_location, :supported, :not_collecting, :failed]
    )

    field(:ip_address, :string)

    field(:location, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.CustomerTaxLocation])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:location, :ip_address, :automatic_tax])
    |> validate_required([:automatic_tax])
  end
end