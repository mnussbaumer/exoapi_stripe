defmodule ExOAPI.Stripe.Schemas.SourceReceiverFlow do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*

  The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.


  **:amount_charged** :: *:integer*

  The total amount that was moved to your balance. This is almost always equal to the amount charged. In rare cases when customers deposit excess funds and we are unable to refund those, those funds get moved to your balance and show up in amount_charged as well. The amount charged is expressed in the source's currency.


  **:amount_received** :: *:integer*

  The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` should be true for consumed sources unless customers deposit excess funds. The amount received is expressed in the source's currency.


  **:amount_returned** :: *:integer*

  The total amount that was returned to the customer. The amount returned is expressed in the source's currency.


  **:refund_attributes_method** :: *:string*

  Type of refund attribute method, one of `email`, `manual`, or `none`.


  **:refund_attributes_status** :: *:string*

  Type of refund attribute status, one of `missing`, `requested`, or `available`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:address, :string)

    field(:amount_charged, :integer)

    field(:amount_received, :integer)

    field(:amount_returned, :integer)

    field(:refund_attributes_method, :string)

    field(:refund_attributes_status, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :refund_attributes_status,
      :refund_attributes_method,
      :amount_returned,
      :amount_received,
      :amount_charged,
      :address
    ])
    |> validate_required([
      :refund_attributes_status,
      :refund_attributes_method,
      :amount_returned,
      :amount_received,
      :amount_charged
    ])
  end
end