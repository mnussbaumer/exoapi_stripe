defmodule ExOAPI.Stripe.Schemas.Order do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Order objects are created to handle end customers' purchases of previously
  defined [products](https://stripe.com/docs/api#products). You can create, retrieve, and pay individual orders, as well
  as list all orders. Orders are identified by a unique, random ID.

  Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders-legacy).

  **:amount** :: *:integer*

  A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.


  **:amount_returned** :: *:integer*

  The total amount that was returned to the customer.


  **:application** :: *ExOAPI.Stripe.Schemas.Application*

  ID of the Connect Application that created the order.


  **:application_fee** :: *ExOAPI.Stripe.Schemas.ApplicationFee*

  A fee in cents that will be applied to the order and transferred to the application owner’s Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees documentation.


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  The ID of the payment used to pay for the order. Present if the order status is `paid`, `fulfilled`, or `refunded`.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The customer used for the order.


  **:email** :: *:string*

  The email address of the customer placing the order.


  **:external_coupon_code** :: *:string*

  External coupon code to load for this order.


  **:id** :: *:string*

  Unique identifier for the object.


  **::items** :: *ExOAPI.Stripe.Schemas.OrderItem*


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **::data** :: *ExOAPI.Stripe.Schemas.OrderReturn*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:selected_shipping_method** :: *:string*

  The shipping method that is currently selected for this order, if any. If present, it is equal to one of the `id`s of shipping methods in the `shipping_methods` array. At order creation time, if there are multiple shipping methods, Stripe will automatically selected the first method.


  **:shipping** :: *ExOAPI.Stripe.Schemas.Shipping*

  The shipping address for the order. Present if the order is for goods to be shipped.


  **::shipping_methods** :: *ExOAPI.Stripe.Schemas.ShippingMethod*


  **:status** :: *:string*

  Current order status. One of `created`, `paid`, `canceled`, `fulfilled`, or `returned`. More details in the [Orders Guide](https://stripe.com/docs/orders/guide#understanding-order-statuses).


  **:status_transitions** :: *ExOAPI.Stripe.Schemas.StatusTransitions*

  The timestamps at which the order status was updated.


  **:updated** :: *:integer*

  Time at which the object was last updated. Measured in seconds since the Unix epoch.


  **:upstream_id** :: *:string*

  The user's order ID if it is different from the Stripe order ID.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:amount_returned, :integer)

    field(:application, :string)

    field(:application_fee, :integer)

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:created, :integer)

    field(:currency, :string)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:email, :string)

    field(:external_coupon_code, :string)

    field(:id, :string)

    embeds_many(:items, ExOAPI.Stripe.Schemas.OrderItem)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:order])

    field(:returns, :map)

    field(:selected_shipping_method, :string)

    field(:shipping, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Shipping])

    embeds_many(:shipping_methods, ExOAPI.Stripe.Schemas.ShippingMethod)

    field(:status, :string)

    field(:status_transitions, ExOAPI.EctoTypes.AnyOf,
      types: [ExOAPI.Stripe.Schemas.StatusTransitions]
    )

    field(:updated, :integer)

    field(:upstream_id, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :upstream_id,
      :updated,
      :status_transitions,
      :status,
      :shipping,
      :selected_shipping_method,
      :returns,
      :object,
      :metadata,
      :livemode,
      :id,
      :external_coupon_code,
      :email,
      :customer,
      :currency,
      :created,
      :charge,
      :application_fee,
      :application,
      :amount_returned,
      :amount
    ])
    |> validate_required([:status, :object, :livemode, :id, :currency, :created, :amount])
    |> cast_embed(:shipping_methods)
    |> cast_embed(:items, required: true)
  end
end