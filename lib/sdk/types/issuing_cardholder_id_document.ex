defmodule ExOAPI.Stripe.Schemas.IssuingCardholderIdDocument do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:back** :: *ExOAPI.Stripe.Schemas.File | :string*

  The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.


  **:front** :: *ExOAPI.Stripe.Schemas.File | :string*

  The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:back, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:front, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:front, :back])
  end
end