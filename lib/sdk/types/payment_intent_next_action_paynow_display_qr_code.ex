defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionPaynowDisplayQrCode do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:data** :: *:string*

  The raw data string used to generate QR code, it should be used together with QR code library.


  **:image_url_png** :: *:string*

  The image_url_png string used to render QR code


  **:image_url_svg** :: *:string*

  The image_url_svg string used to render QR code


  """

  @primary_key false
  typed_embedded_schema do
    field(:data, :string)

    field(:image_url_png, :string)

    field(:image_url_svg, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:image_url_svg, :image_url_png, :data])
    |> validate_required([:image_url_svg, :image_url_png, :data])
  end
end