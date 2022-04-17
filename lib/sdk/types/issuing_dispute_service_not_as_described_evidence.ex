defmodule ExOAPI.Stripe.Schemas.IssuingDisputeServiceNotAsDescribedEvidence do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:additional_documentation** :: *ExOAPI.Stripe.Schemas.File | :string*

  (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.


  **:canceled_at** :: *:integer*

  Date when order was canceled.


  **:cancellation_reason** :: *:string*

  Reason for canceling the order.


  **:explanation** :: *:string*

  Explanation of why the cardholder is disputing this transaction.


  **:received_at** :: *:integer*

  Date when the product was received.


  """

  @primary_key false
  typed_embedded_schema do
    field(:additional_documentation, ExOAPI.EctoTypes.AnyOf,
      types: [:string, ExOAPI.Stripe.Schemas.File]
    )

    field(:canceled_at, :integer)

    field(:cancellation_reason, :string)

    field(:explanation, :string)

    field(:received_at, :integer)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :received_at,
      :explanation,
      :cancellation_reason,
      :canceled_at,
      :additional_documentation
    ])
  end
end