defmodule ExOAPI.Stripe.Schemas.ThreeDSecure do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Cardholder authentication via 3D Secure is initiated by creating a `3D Secure`
  object. Once the object has been created, you can use it to authenticate the
  cardholder and create a charge.

  **:amount** :: *:integer*

  Amount of the charge that you will create when authentication completes.


  **:authenticated** :: *:boolean*

  True if the cardholder went through the authentication flow and their bank indicated that authentication succeeded.


  **:card** :: *ExOAPI.Stripe.Schemas.Card*


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:currency** :: *:string*

  Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:redirect_url** :: *:string*

  If present, this is the URL that you should send the cardholder to for authentication. If you are going to use Stripe.js to display the authentication page in an iframe, you should use the value "_callback".


  **:status** :: *:string*

  Possible values are `redirect_pending`, `succeeded`, or `failed`. When the cardholder can be authenticated, the object starts with status `redirect_pending`. When liability will be shifted to the cardholder's bank (either because the cardholder was successfully authenticated, or because the bank has not implemented 3D Secure, the object wlil be in status `succeeded`. `failed` indicates that authentication was attempted unsuccessfully.


  """

  @primary_key false
  typed_embedded_schema do
    field(:amount, :integer)

    field(:authenticated, :boolean)

    embeds_one(:card, ExOAPI.Stripe.Schemas.Card)

    field(:created, :integer)

    field(:currency, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:three_d_secure])

    field(:redirect_url, :string)

    field(:status, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :status,
      :redirect_url,
      :object,
      :livemode,
      :id,
      :currency,
      :created,
      :authenticated,
      :amount
    ])
    |> validate_required([
      :status,
      :object,
      :livemode,
      :id,
      :currency,
      :created,
      :authenticated,
      :amount
    ])
    |> cast_embed(:card, required: true)
  end
end