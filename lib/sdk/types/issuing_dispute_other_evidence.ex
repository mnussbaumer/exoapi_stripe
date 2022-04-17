defmodule ExOAPI.Stripe.Schemas.IssuingDisputeOtherEvidence do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:additional_documentation** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.


  **:explanation** :: *:string*

  Explanation of why the cardholder is disputing this transaction.


  **:product_description** :: *:string*

  Description of the merchandise or service that was purchased.


  **:product_type** :: *:string*

  Whether the product was a merchandise or service.


  """

  @primary_key false
  typed_embedded_schema do
    field(:additional_documentation, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.File]
    )

    field(:explanation, :string)

    field(:product_description, :string)

    field(:product_type, Ecto.Enum, values: [:service, :merchandise])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:product_type, :product_description, :explanation, :additional_documentation])
  end
end