defmodule ExOAPI.Stripe.Schemas.RadarReviewResourceSession do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:browser** :: *:string*

  The browser used in this browser session (e.g., `Chrome`).


  **:device** :: *:string*

  Information about the device used for the browser session (e.g., `Samsung SM-G930T`).


  **:platform** :: *:string*

  The platform for the browser session (e.g., `Macintosh`).


  **:version** :: *:string*

  The version for the browser session (e.g., `61.0.3163.100`).


  """

  @primary_key false
  typed_embedded_schema do
    field(:browser, :string)

    field(:device, :string)

    field(:platform, :string)

    field(:version, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:version, :platform, :device, :browser])
  end
end