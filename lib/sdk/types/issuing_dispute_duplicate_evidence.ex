defmodule ExOAPI.Stripe.Schemas.IssuingDisputeDuplicateEvidence do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:additional_documentation** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.


  **:card_statement** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card statement showing that the product had already been paid for.


  **:cash_receipt** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt showing that the product had been paid for in cash.


  **:check_image** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and back of the check that was used to pay for the product.


  **:explanation** :: *:string*

  Explanation of why the cardholder is disputing this transaction.


  **:original_transaction** :: *:string*

  Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one.


  """

  @primary_key false
  typed_embedded_schema do
    field(:additional_documentation, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.File]
    )

    field(:card_statement, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:cash_receipt, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:check_image, ExOAPI.EctoTypes.AnyOf, types: [:string, ExOAPI.Stripe.Schemas.File])

    field(:explanation, :string)

    field(:original_transaction, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :original_transaction,
      :explanation,
      :check_image,
      :cash_receipt,
      :card_statement,
      :additional_documentation
    ])
  end
end