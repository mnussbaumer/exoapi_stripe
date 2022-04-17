defmodule ExOAPI.Stripe.Schemas.MandateSepaDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:reference** :: *:string*

  The unique reference of the mandate.


  **:url** :: *:string*

  The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.


  """

  @primary_key false
  typed_embedded_schema do
    field(:reference, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :reference])
    |> validate_required([:url, :reference])
  end
end