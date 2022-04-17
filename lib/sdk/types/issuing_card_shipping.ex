defmodule ExOAPI.Stripe.Schemas.IssuingCardShipping do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*


  **:carrier** :: *:string*

  The delivery company that shipped a card.


  **:eta** :: *:integer*

  A unix timestamp representing a best estimate of when the card will be delivered.


  **:name** :: *:string*

  Recipient name.


  **:service** :: *:string*

  Shipment service, such as `standard` or `express`.


  **:status** :: *:string*

  The delivery status of the card.


  **:tracking_number** :: *:string*

  A tracking number for a card shipment.


  **:tracking_url** :: *:string*

  A link to the shipping carrier's site where you can view detailed information about a card shipment.


  **:type** :: *:string*

  Packaging options.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:address, ExOAPI.Stripe.Schemas.Address)

    field(:carrier, Ecto.Enum, values: [:usps, :royal_mail, :fedex, :dhl])

    field(:eta, :integer)

    field(:name, :string)

    field(:service, Ecto.Enum, values: [:standard, :priority, :express])

    field(:status, Ecto.Enum,
      values: [:shipped, :returned, :pending, :failure, :delivered, :canceled]
    )

    field(:tracking_number, :string)

    field(:tracking_url, :string)

    field(:type, Ecto.Enum, values: [:individual, :bulk])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :tracking_url,
      :tracking_number,
      :status,
      :service,
      :name,
      :eta,
      :carrier
    ])
    |> validate_required([:type, :service, :name])
    |> cast_embed(:address, required: true)
  end
end