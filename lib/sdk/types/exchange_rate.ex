defmodule ExOAPI.Stripe.Schemas.ExchangeRate do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: `Exchange Rate` objects allow you to determine the rates that Stripe is
  currently using to convert from one currency to another. Since this number is
  variable throughout the day, there are various reasons why you might want to
  know the current rate (for example, to dynamically price an item for a user
  with a default payment in a foreign currency).

  If you want a guarantee that the charge is made with a certain exchange rate
  you expect is current, you can pass in `exchange_rate` to charges endpoints.
  If the value is no longer up to date, the charge won't go through. Please
  refer to our [Exchange Rates API](https://stripe.com/docs/exchange-rates) guide for more
  details.

  **:id** :: *:string*

  Unique identifier for the object. Represented as the three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:rates** :: *:map*

  Hash where the keys are supported currencies and the values are the exchange rate at which the base id currency converts to the key currency.


  """

  @primary_key false
  typed_embedded_schema do
    field(:id, :string)

    field(:object, Ecto.Enum, values: [:exchange_rate])

    field(:rates, :map)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:rates, :object, :id])
    |> validate_required([:rates, :object, :id])
  end
end