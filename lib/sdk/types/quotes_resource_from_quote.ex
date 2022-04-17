defmodule ExOAPI.Stripe.Schemas.QuotesResourceFromQuote do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:is_revision** :: *:boolean*

  Whether this quote is a revision of a different quote.


  **:quote** :: *ExOAPI.Stripe.Schemas.Quote | :string*

  The quote that was cloned.


  """

  @primary_key false
  typed_embedded_schema do
    field(:is_revision, :boolean)

    field(:quote, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.Quote])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:quote, :is_revision])
    |> validate_required([:quote, :is_revision])
  end
end