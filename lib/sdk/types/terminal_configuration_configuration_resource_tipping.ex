defmodule ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceTipping do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:aud** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:cad** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:chf** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:dkk** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:eur** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:gbp** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:hkd** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:myr** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:nok** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:nzd** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:sek** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:sgd** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  **:usd** :: *ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(
      :aud,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :cad,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :chf,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :dkk,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :eur,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :gbp,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :hkd,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :myr,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :nok,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :nzd,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :sek,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :sgd,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )

    embeds_one(
      :usd,
      ExOAPI.Stripe.Schemas.TerminalConfigurationConfigurationResourceCurrencySpecificConfig
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [])
    |> cast_embed(:usd)
    |> cast_embed(:sgd)
    |> cast_embed(:sek)
    |> cast_embed(:nzd)
    |> cast_embed(:nok)
    |> cast_embed(:myr)
    |> cast_embed(:hkd)
    |> cast_embed(:gbp)
    |> cast_embed(:eur)
    |> cast_embed(:dkk)
    |> cast_embed(:chf)
    |> cast_embed(:cad)
    |> cast_embed(:aud)
  end
end