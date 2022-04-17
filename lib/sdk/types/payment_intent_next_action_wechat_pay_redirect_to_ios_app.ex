defmodule ExOAPI.Stripe.Schemas.PaymentIntentNextActionWechatPayRedirectToIosApp do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:native_url** :: *:string*

  An universal link that redirect to WeChat Pay app


  """

  @primary_key false
  typed_embedded_schema do
    field(:native_url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:native_url])
    |> validate_required([:native_url])
  end
end