defmodule ExOAPI.Stripe.Schemas.SourceTypeKlarna do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:background_image_url** :: *:string*


  **:client_token** :: *:string*


  **:first_name** :: *:string*


  **:last_name** :: *:string*


  **:locale** :: *:string*


  **:logo_url** :: *:string*


  **:page_title** :: *:string*


  **:pay_later_asset_urls_descriptive** :: *:string*


  **:pay_later_asset_urls_standard** :: *:string*


  **:pay_later_name** :: *:string*


  **:pay_later_redirect_url** :: *:string*


  **:pay_now_asset_urls_descriptive** :: *:string*


  **:pay_now_asset_urls_standard** :: *:string*


  **:pay_now_name** :: *:string*


  **:pay_now_redirect_url** :: *:string*


  **:pay_over_time_asset_urls_descriptive** :: *:string*


  **:pay_over_time_asset_urls_standard** :: *:string*


  **:pay_over_time_name** :: *:string*


  **:pay_over_time_redirect_url** :: *:string*


  **:payment_method_categories** :: *:string*


  **:purchase_country** :: *:string*


  **:purchase_type** :: *:string*


  **:redirect_url** :: *:string*


  **:shipping_delay** :: *:integer*


  **:shipping_first_name** :: *:string*


  **:shipping_last_name** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:background_image_url, :string)

    field(:client_token, :string)

    field(:first_name, :string)

    field(:last_name, :string)

    field(:locale, :string)

    field(:logo_url, :string)

    field(:page_title, :string)

    field(:pay_later_asset_urls_descriptive, :string)

    field(:pay_later_asset_urls_standard, :string)

    field(:pay_later_name, :string)

    field(:pay_later_redirect_url, :string)

    field(:pay_now_asset_urls_descriptive, :string)

    field(:pay_now_asset_urls_standard, :string)

    field(:pay_now_name, :string)

    field(:pay_now_redirect_url, :string)

    field(:pay_over_time_asset_urls_descriptive, :string)

    field(:pay_over_time_asset_urls_standard, :string)

    field(:pay_over_time_name, :string)

    field(:pay_over_time_redirect_url, :string)

    field(:payment_method_categories, :string)

    field(:purchase_country, :string)

    field(:purchase_type, :string)

    field(:redirect_url, :string)

    field(:shipping_delay, :integer)

    field(:shipping_first_name, :string)

    field(:shipping_last_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :shipping_last_name,
      :shipping_first_name,
      :shipping_delay,
      :redirect_url,
      :purchase_type,
      :purchase_country,
      :payment_method_categories,
      :pay_over_time_redirect_url,
      :pay_over_time_name,
      :pay_over_time_asset_urls_standard,
      :pay_over_time_asset_urls_descriptive,
      :pay_now_redirect_url,
      :pay_now_name,
      :pay_now_asset_urls_standard,
      :pay_now_asset_urls_descriptive,
      :pay_later_redirect_url,
      :pay_later_name,
      :pay_later_asset_urls_standard,
      :pay_later_asset_urls_descriptive,
      :page_title,
      :logo_url,
      :locale,
      :last_name,
      :first_name,
      :client_token,
      :background_image_url
    ])
  end
end