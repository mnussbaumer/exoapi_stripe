defmodule ExOAPI.Stripe.Schemas.ShippingMethod do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:delivery_estimate** :: *ExOAPI.Stripe.Schemas.DeliveryEstimate*

  The estimated delivery date for the given shipping method. Can be either a specific date or a range.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:id** :: *:string*

  Unique identifier for the object.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:currency, :string)

    field(:delivery_estimate, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.DeliveryEstimate]
    )

    field(:description, :string)

    field(:id, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:id, :description, :delivery_estimate, :currency, :amount])
    |> validate_required([:id, :description, :currency, :amount])
  end
end