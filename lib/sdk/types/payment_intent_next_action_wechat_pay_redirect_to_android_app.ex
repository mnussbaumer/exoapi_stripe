defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayRedirectToAndroidApp do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:app_id** :: *:string*

  app_id is the APP ID registered on WeChat open platform


  **:nonce_str** :: *:string*

  nonce_str is a random string


  **:package** :: *:string*

  package is static value


  **:partner_id** :: *:string*

  an unique merchant ID assigned by WeChat Pay


  **:prepay_id** :: *:string*

  an unique trading ID assigned by WeChat Pay


  **:sign** :: *:string*

  A signature


  **:timestamp** :: *:string*

  Specifies the current time in epoch format


  """

  @primary_key false
  typed_embedded_schema do
    field(:app_id, :string)

    field(:nonce_str, :string)

    field(:package, :string)

    field(:partner_id, :string)

    field(:prepay_id, :string)

    field(:sign, :string)

    field(:timestamp, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:timestamp, :sign, :prepay_id, :partner_id, :package, :nonce_str, :app_id])
    |> validate_required([
      :timestamp,
      :sign,
      :prepay_id,
      :partner_id,
      :package,
      :nonce_str,
      :app_id
    ])
  end
end