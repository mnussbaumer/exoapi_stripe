defmodule ExOAPI.Stripe.Schemas.Recipient do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: With `Recipient` objects, you can transfer money from your Stripe account to a
  third-party bank account or debit card. The API allows you to create, delete,
  and update your recipients. You can retrieve individual recipients as well as
  a list of all your recipients.

  **`Recipient` objects have been deprecated in favor of
  [Connect](https://stripe.com/docs/connect), specifically Connect's much more powerful
  [Account objects](https://stripe.com/docs/api#account). Stripe accounts that don't already use
  recipients can no longer begin doing so. Please use `Account` objects
  instead.**

  **:active_account** :: *ExOAPI.Stripe.Schemas.BankAccount*

  Hash describing the current account on the recipient, if there is one.


  **::data** :: *ExOAPI.Stripe.Schemas.Card*


  **:has_more** :: *:boolean*

  True if this list has another page of items after this one that can be fetched.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value. Always has the value `list`.


  **:url** :: *:string*

  The URL where this list can be accessed.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:default_card** :: *ExOAPI.Stripe.Schemas.Card | :string*

  The default card to use for creating transfers to this recipient.


  **:description** :: *:string*

  An arbitrary string attached to the object. Often useful for displaying to users.


  **:email** :: *:string*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:metadata** :: *:map*

  Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.


  **:migrated_to** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The ID of the [Custom account](https://stripe.com/docs/connect/custom-accounts) this recipient was migrated to. If set, the recipient can no longer be updated, nor can transfers be made to it: use the Custom account instead.


  **:name** :: *:string*

  Full, legal name of the recipient.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:rolled_back_from** :: *ExOAPI.Stripe.Schemas.Account | :string*


  **:type** :: *:string*

  Type of the recipient, one of `individual` or `corporation`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:active_account, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.BankAccount])

    field(:cards, :map)

    field(:created, :integer)

    field(:default_card, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Card])

    field(:description, :string)

    field(:email, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:metadata, :map)

    field(:migrated_to, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    field(:name, :string)

    field(:object, Ecto.Enum, values: [:recipient])

    field(:rolled_back_from, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.Account]
    )

    field(:type, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :type,
      :rolled_back_from,
      :object,
      :name,
      :migrated_to,
      :metadata,
      :livemode,
      :id,
      :email,
      :description,
      :default_card,
      :created,
      :cards,
      :active_account
    ])
    |> validate_required([:type, :object, :metadata, :livemode, :id, :created])
  end
end