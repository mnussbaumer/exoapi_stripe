defmodule ExOAPI.Stripe.Schemas.AccountBrandingSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:icon** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px.


  **:logo** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px.


  **:primary_color** :: *:string*

  A CSS hex color value representing the primary branding color for this account


  **:secondary_color** :: *:string*

  A CSS hex color value representing the secondary branding color for this account


  """

  @primary_key false
  typed_embedded_schema do
    field(:icon, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:logo, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:primary_color, :string)

    field(:secondary_color, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:secondary_color, :primary_color, :logo, :icon])
  end
end