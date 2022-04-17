defmodule ExOAPI.Stripe.Schemas.ApplePayDomain do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:domain_name** :: *:string*


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:domain_name, :string)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:apple_pay_domain])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :livemode, :id, :domain_name, :created])
    |> validate_required([:object, :livemode, :id, :domain_name, :created])
  end
end