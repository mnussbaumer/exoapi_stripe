defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayDisplayQrCode do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:data** :: *:string*

  The data being used to generate QR code


  **:image_data_url** :: *:string*

  The base64 image data for a pre-generated QR code


  **:image_url_png** :: *:string*

  The image_url_png string used to render QR code


  **:image_url_svg** :: *:string*

  The image_url_svg string used to render QR code


  """

  @primary_key false
  typed_embedded_schema do
    field(:data, :string)

    field(:image_data_url, :string)

    field(:image_url_png, :string)

    field(:image_url_svg, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:image_url_svg, :image_url_png, :image_data_url, :data])
    |> validate_required([:image_url_svg, :image_url_png, :image_data_url, :data])
  end
end