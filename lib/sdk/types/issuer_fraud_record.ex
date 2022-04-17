defmodule ExOAPI.Stripe.Schemas.IssuerFraudRecord do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: This resource has been renamed to [Early Fraud
  Warning](#early_fraud_warning_object) and will be removed in a future API
  version.

  **:actionable** :: *:boolean*

  An IFR is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an IFR, in order to avoid receiving a dispute later.


  **:charge** :: *ExOAPI.Stripe.Schemas.Charge | :string*

  ID of the charge this issuer fraud record is for, optionally expanded.


  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:fraud_type** :: *:string*

  The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.


  **:has_liability_shift** :: *:boolean*

  If true, the associated charge is subject to [liability shift](https://stripe.com/docs/payments/3d-secure#disputed-payments).


  **:id** :: *:string*

  Unique identifier for the object.


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:post_date** :: *:integer*

  The timestamp at which the card issuer posted the issuer fraud record.


  """

  @primary_key false
  typed_embedded_schema do
    field(:actionable, :boolean)

    field(:charge, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Charge])

    field(:created, :integer)

    field(:fraud_type, :string)

    field(:has_liability_shift, :boolean)

    field(:id, :string)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:issuer_fraud_record])

    field(:post_date, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :post_date,
      :object,
      :livemode,
      :id,
      :has_liability_shift,
      :fraud_type,
      :created,
      :charge,
      :actionable
    ])
    |> validate_required([
      :post_date,
      :object,
      :livemode,
      :id,
      :has_liability_shift,
      :fraud_type,
      :created,
      :charge,
      :actionable
    ])
  end
end