defmodule ExOAPI.Stripe.Schemas.InvoiceSettingCustomField do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:name** :: *:string*

  The name of the custom field.


  **:value** :: *:string*

  The value of the custom field.


  """

  @primary_key false
  typed_embedded_schema do
    field(:name, :string)

    field(:value, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:value, :name])
    |> validate_required([:value, :name])
  end
end