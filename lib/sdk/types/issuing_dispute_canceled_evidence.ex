defmodule ExOAPI.Stripe.Schemas.IssuingDisputeCanceledEvidence do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:additional_documentation** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.


  **:canceled_at** :: *:integer*

  Date when order was canceled.


  **:cancellation_policy_provided** :: *:boolean*

  Whether the cardholder was provided with a cancellation policy.


  **:cancellation_reason** :: *:string*

  Reason for canceling the order.


  **:expected_at** :: *:integer*

  Date when the cardholder expected to receive the product.


  **:explanation** :: *:string*

  Explanation of why the cardholder is disputing this transaction.


  **:product_description** :: *:string*

  Description of the merchandise or service that was purchased.


  **:product_type** :: *:string*

  Whether the product was a merchandise or service.


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

    field(:canceled_at, :integer)

    field(:cancellation_policy_provided, :boolean)

    field(:cancellation_reason, :string)

    field(:expected_at, :integer)

    field(:explanation, :string)

    field(:product_description, :string)

    field(:product_type, Ecto.Enum, values: [:service, :merchandise])

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
      :product_type,
      :product_description,
      :explanation,
      :expected_at,
      :cancellation_reason,
      :cancellation_policy_provided,
      :canceled_at,
      :additional_documentation
    ])
  end
end