defmodule ExOAPI.Stripe.Schemas.PaymentMethodDetailsMultibanco do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:entity** :: *:string*

  Entity number associated with this Multibanco payment.


  **:reference** :: *:string*

  Reference number associated with this Multibanco payment.


  """

  @primary_key false
  typed_embedded_schema do
    field(:entity, :string)

    field(:reference, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reference, :entity])
  end
end