defmodule ExOAPI.Stripe.Schemas.BitcoinReceiver do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:active** :: *:boolean*

  True when this bitcoin receiver has received a non-zero amount of bitcoin.


  **:amount** :: *:integer*

  The amount of `currency` that you are collecting as payment.


  **:amount_received** :: *:integer*

  The amount of `currency` to which `bitcoin_amount_received` has been converted.


  **:bitcoin_amount** :: *:integer*

  The amount of bitcoin that the customer should send to fill the receiver. The `bitcoin_amount` is denominated in Satoshi: there are 10^8 Satoshi in one bitcoin.


  **:bitcoin_amount_received** :: *:integer*

  The amount of bitcoin that has been sent by the customer to this receiver.


  **:bitcoin_uri** :: *:string*

  This URI can be displayed to the customer as a clickable link (to activate their bitcoin client) or as a QR code (for mobile wallets).


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which the bitcoin will be converted.


  **:customer** :: *ExOAPI.Stripe.Schemas.Customer*

  The customer ID of the bitcoin receiver.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:email** :: *:string*

  The customer's email address, set by the API call that creates the receiver.


  **:filled** :: *:boolean*

  This flag is initially false and updates to true when the customer sends the `bitcoin_amount` to this receiver.


  **:id** :: *:string*

  Unique identifier for the object.


  **:inbound_address** :: *:string*

  A bitcoin address that is specific to this receiver. The customer can send bitcoin to this address to fill the receiver.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:payment** :: *:string*

  The ID of the payment created from the receiver, if any. Hidden when viewing the receiver with a publishable key.


  **:refund_address** :: *:string*

  The refund address of this bitcoin receiver.


  **::data** :: *ExOAPI.Stripe.Schemas.BitcoinTransaction*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:uncaptured_funds** :: *:boolean*

  This receiver contains uncaptured funds that can be used for a payment or refunded.


  **:used_for_payment** :: *:boolean*

  Indicate if this source is used for payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active, :boolean)

    field(:amount, :integer)

    field(:amount_received, :integer)

    field(:bitcoin_amount, :integer)

    field(:bitcoin_amount_received, :integer)

    field(:bitcoin_uri, :string)

    field(:created, :integer)

    field(:currency, :string)

    field(:customer, :string)

    field(:description, :string)

    field(:email, :string)

    field(:filled, :boolean)

    field(:id, :string)

    field(:inbound_address, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:bitcoin_receiver])

    field(:payment, :string)

    field(:refund_address, :string)

    field(:transactions, :map)

    field(:uncaptured_funds, :boolean)

    field(:used_for_payment, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :used_for_payment,
      :uncaptured_funds,
      :transactions,
      :refund_address,
      :payment,
      :object,
      :metadata,
      :livemode,
      :inbound_address,
      :id,
      :filled,
      :email,
      :description,
      :customer,
      :currency,
      :created,
      :bitcoin_uri,
      :bitcoin_amount_received,
      :bitcoin_amount,
      :amount_received,
      :amount,
      :active
    ])
    |> validate_required([
      :uncaptured_funds,
      :object,
      :livemode,
      :inbound_address,
      :id,
      :filled,
      :currency,
      :created,
      :bitcoin_uri,
      :bitcoin_amount_received,
      :bitcoin_amount,
      :amount_received,
      :amount,
      :active
    ])
  end
end