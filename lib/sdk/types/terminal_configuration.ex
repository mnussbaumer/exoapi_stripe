defmodule ExOAPI.Stripe.Schemas.Terminal_configuration do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: A Configurations object represents how features should be configured for terminal readers.

  **:bbpos_wisepos_e** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig*


  **:id** :: *:string*

  Unique identifier for the object.


  **:is_account_default** :: *:boolean*

  Whether this Configuration is the default for your account


  **:livemode** :: *:boolean*

  Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:tipping** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceTipping*


  **:verifone_P400** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :bbpos_wisepos_e,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig
    )

    field(:id, :string)

    field(:is_account_default, :boolean)

    field(:livemode, :boolean)

    field(:object, Ecto.Enum, values: [:"terminal.configuration"])

    embeds_one(:tipping, ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceTipping)

    embeds_one(
      :verifone_P400,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceDeviceTypeSpecificConfig
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:object, :livemode, :is_account_default, :id])
    |> validate_required([:object, :livemode, :id])
    |> cast_embed(:verifone_P400)
    |> cast_embed(:tipping)
    |> cast_embed(:bbpos_wisepos_e)
  end
end