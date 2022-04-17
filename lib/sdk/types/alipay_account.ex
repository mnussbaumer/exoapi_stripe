defmodule ExOAPI.Stripe.Schemas.AlipayAccount do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:customer** :: *ExOAPI.Stripe.Schemas.DeletedCustomer | ExOAPI.Stripe.Schemas.Customer | :string*

  The ID of the customer associated with this Alipay Account.


  **:fingerprint** :: *:string*

  Uniquely identifies the account and will be the same across all Alipay account objects that are linked to the same Alipay account.


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:payment_amount** :: *:integer*

  If the Alipay account object is not reusable, the exact amount that you can create a charge for.


  **:payment_currency** :: *:string*

  If the Alipay account object is not reusable, the exact currency that you can create a charge for.


  **:reusable** :: *:boolean*

  True if you can create multiple payments using this account. If the account is reusable, then you can freely choose the amount of each payment.


  **:used** :: *:boolean*

  Whether this Alipay account object has ever been used for a payment.


  **:username** :: *:string*

  The username for the Alipay account.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:customer, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Customer, ExOAPI.Stripe.Schemas.DeletedCustomer]
    )

    field(:fingerprint, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:object, Ecto.Enum, values: [:alipay_account])

    field(:payment_amount, :integer)

    field(:payment_currency, :string)

    field(:reusable, :boolean)

    field(:used, :boolean)

    field(:username, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :username,
      :used,
      :reusable,
      :payment_currency,
      :payment_amount,
      :object,
      :metadata,
      :livemode,
      :id,
      :fingerprint,
      :customer,
      :created
    ])
    |> validate_required([
      :username,
      :used,
      :reusable,
      :object,
      :livemode,
      :id,
      :fingerprint,
      :created
    ])
  end
end