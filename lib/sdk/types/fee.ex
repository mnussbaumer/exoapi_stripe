defmodule ExOAPI.Stripe.Schemas.Fee do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:amount** :: *:integer*

  Amount of the fee, in cents.


  **:application** :: *ExOAPI.Stripe.Schemas.Application*

  ID of the Connect application that earned the fee.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:type** :: *:string*

  Type of the fee, one of: `application_fee`, `stripe_fee` or `tax`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:application, :string)

    field(:currency, :string)

    field(:description, :string)

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :description, :currency, :application, :amount])
    |> validate_required([:type, :currency, :amount])
  end
end