defmodule ExOAPI.Stripe.Schemas.Capability do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This is an object representing a capability for a Stripe account.

  Related guide: [Account capabilities](https://stripe.com/docs/connect/account-capabilities).

  **:account** :: *ExOAPI.Stripe.Schemas.Account | :string*

  The account for which the capability enables functionality.


  **:future_requirements** :: *ExOAPI.Stripe.Schemas.AccountCapabilityFutureRequirements*


  **:id** :: *:string*

  The identifier for the capability.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:requested** :: *:boolean*

  Whether the capability has been requested.


  **:requested_at** :: *:integer*

  Time at which the capability was requested. Measured in seconds since the Unix epoch.


  **:requirements** :: *ExOAPI.Stripe.Schemas.AccountCapabilityRequirements*


  **:status** :: *:string*

  The status of the capability. Can be `active`, `inactive`, `pending`, or `unrequested`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:account, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Account])

    embeds_one(:future_requirements, ExOAPI.Stripe.Schemas.AccountCapabilityFutureRequirements)

    field(:id, :string)

    field(:object, Ecto.Enum, values: [:capability])

    field(:requested, :boolean)

    field(:requested_at, :integer)

    embeds_one(:requirements, ExOAPI.Stripe.Schemas.AccountCapabilityRequirements)

    field(:status, Ecto.Enum, values: [:unrequested, :pending, :inactive, :disabled, :active])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:status, :requested_at, :requested, :object, :id, :account])
    |> validate_required([:status, :requested, :object, :id, :account])
    |> cast_embed(:requirements)
    |> cast_embed(:future_requirements)
  end
end