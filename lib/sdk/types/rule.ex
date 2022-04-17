defmodule ExOAPI.Stripe.Schemas.Rule do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:action** :: *:string*

  The action taken on the payment.


  **:id** :: *:string*

  Unique identifier for the object.


  **:predicate** :: *:string*

  The predicate to evaluate the payment against.


  """

  @primary_key false
  typed_embedded_schema do
    field(:action, :string)

    field(:id, :string)

    field(:predicate, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:predicate, :id, :action])
    |> validate_required([:predicate, :id, :action])
  end
end