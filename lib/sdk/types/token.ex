defmodule ExOAPI.Stripe.Schemas.Token do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Tokenization is the process Stripe uses to collect sensitive card or bank
  account details, or personally identifiable information (PII), directly from
  your customers in a secure manner. A token representing this information is
  returned to your server to use. You should use our
  [recommended payments integrations](https://stripe.com/docs/payments) to perform this process
  client-side. This ensures that no sensitive card data touches your server,
  and allows your integration to operate in a PCI-compliant way.

  If you cannot use client-side tokenization, you can also create tokens using
  the API with either your publishable or secret API key. Keep in mind that if
  your integration uses this method, you are responsible for any PCI compliance
  that may be required, and you must keep your secret API key safe. Unlike with
  client-side tokenization, your customer's information is not sent directly to
  Stripe, so we cannot determine how it is handled or stored.

  Tokens cannot be stored or used more than once. To store card or bank account
  information for later use, you can create [Customer](https://stripe.com/docs/api#customers)
  objects or [Custom accounts](https://stripe.com/docs/api#external_accounts). Note that
  [Radar](https://stripe.com/docs/radar), our integrated solution for automatic fraud protection,
  performs best with integrations that use client-side tokenization.

  Related guide: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token)

  **:bank_account** :: *ExOAPI.Stripe.Schemas.BankAccount*


  **:card** :: *ExOAPI.Stripe.Schemas.Card*


  **:client_ip** :: *:string*

  IP address of the client that generated the token.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:type** :: *:string*

  Type of the token: `account`, `bank_account`, `card`, or `pii`.


  **:used** :: *:boolean*

  Whether this token has already been used (tokens can be used only once).


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:bank_account, ExOAPI.Stripe.Schemas.BankAccount)

    embeds_one(:card, ExOAPI.Stripe.Schemas.Card)

    field(:client_ip, :string)

    field(:created, :integer)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:token])

    field(:type, :string)

    field(:used, :boolean)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:used, :type, :object, :livemode, :id, :created, :client_ip])
    |> validate_required([:used, :type, :object, :livemode, :id, :created])
    |> cast_embed(:card)
    |> cast_embed(:bank_account)
  end
end