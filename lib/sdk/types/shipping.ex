defmodule ExOAPI.Stripe.Schemas.Shipping do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:address** :: *ExOAPI.Stripe.Schemas.Address*


  **:carrier** :: *:string*

  The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.


  **:name** :: *:string*

  Recipient name.


  **:phone** :: *:string*

  Recipient phone (including extension).


  **:tracking_number** :: *:string*

  The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:address, ExOAPI.Stripe.Schemas.Address)

    field(:carrier, :string)

    field(:name, :string)

    field(:phone, :string)

    field(:tracking_number, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:tracking_number, :phone, :name, :carrier])
    |> cast_embed(:address)
  end
end