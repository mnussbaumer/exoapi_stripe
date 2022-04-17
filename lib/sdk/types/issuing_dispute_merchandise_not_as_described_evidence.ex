defmodule ExOAPI.Stripe.Schemas.IssuingDisputeMerchandiseNotAsDescribedEvidence do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:additional_documentation** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.


  **:explanation** :: *:string*

  Explanation of why the cardholder is disputing this transaction.


  **:received_at** :: *:integer*

  Date when the product was received.


  **:return_description** :: *:string*

  Description of the cardholder's attempt to return the product.


  **:return_status** :: *:string*

  Result of cardholder's attempt to return the product.


  **:returned_at** :: *:integer*

  Date when the product was returned or attempted to be returned.


  """

  @primary_key false
  typed_embedded_schema do
    field(:additional_documentation, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.File]
    )

    field(:explanation, :string)

    field(:received_at, :integer)

    field(:return_description, :string)

    field(:return_status, Ecto.Enum, values: [:successful, :merchant_rejected])

    field(:returned_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :returned_at,
      :return_status,
      :return_description,
      :received_at,
      :explanation,
      :additional_documentation
    ])
  end
end