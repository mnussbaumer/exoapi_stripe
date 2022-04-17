defmodule ExOAPI.Stripe.Schemas.PaymentMethodSofort do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:country** :: *:string*

  Two-letter ISO code representing the country the bank account is located in.


  """

  @primary_key false
  typed_embedded_schema do
    field(:country, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:country])
  end
end