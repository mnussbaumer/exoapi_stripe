defmodule ExOAPI.Stripe.Schemas.SourceTypeAlipay do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:data_string** :: *:string*


  **:native_url** :: *:string*


  **:statement_descriptor** :: *:string*


  """

  @primary_key false
  typed_embedded_schema do
    field(:data_string, :string)

    field(:native_url, :string)

    field(:statement_descriptor, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:statement_descriptor, :native_url, :data_string])
  end
end