defmodule ExOAPI.Stripe.Schemas.IssuingDisputeEvidence do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:canceled** :: *ExOAPI.Stripe.Schemas.IssuingDisputeCanceledEvidence*


  **:duplicate** :: *ExOAPI.Stripe.Schemas.IssuingDisputeDuplicateEvidence*


  **:fraudulent** :: *ExOAPI.Stripe.Schemas.IssuingDisputeFraudulentEvidence*


  **:merchandise_not_as_described** :: *ExOAPI.Stripe.Schemas.IssuingDisputeMerchandiseNotAsDescribedEvidence*


  **:not_received** :: *ExOAPI.Stripe.Schemas.IssuingDisputeNotReceivedEvidence*


  **:other** :: *ExOAPI.Stripe.Schemas.IssuingDisputeOtherEvidence*


  **:reason** :: *:string*

  The reason for filing the dispute. Its value will match the field containing the evidence.


  **:service_not_as_described** :: *ExOAPI.Stripe.Schemas.IssuingDisputeServiceNotAsDescribedEvidence*


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:canceled, ExOAPI.Stripe.Schemas.IssuingDisputeCanceledEvidence)

    embeds_one(:duplicate, ExOAPI.Stripe.Schemas.IssuingDisputeDuplicateEvidence)

    embeds_one(:fraudulent, ExOAPI.Stripe.Schemas.IssuingDisputeFraudulentEvidence)

    embeds_one(
      :merchandise_not_as_described,
      ExOAPI.Stripe.Schemas.IssuingDisputeMerchandiseNotAsDescribedEvidence
    )

    embeds_one(:not_received, ExOAPI.Stripe.Schemas.IssuingDisputeNotReceivedEvidence)

    embeds_one(:other, ExOAPI.Stripe.Schemas.IssuingDisputeOtherEvidence)

    field(:reason, Ecto.Enum,
      values: [
        :service_not_as_described,
        :other,
        :not_received,
        :merchandise_not_as_described,
        :fraudulent,
        :duplicate,
        :canceled
      ]
    )

    embeds_one(
      :service_not_as_described,
      ExOAPI.Stripe.Schemas.IssuingDisputeServiceNotAsDescribedEvidence
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reason])
    |> validate_required([:reason])
    |> cast_embed(:service_not_as_described)
    |> cast_embed(:other)
    |> cast_embed(:not_received)
    |> cast_embed(:merchandise_not_as_described)
    |> cast_embed(:fraudulent)
    |> cast_embed(:duplicate)
    |> cast_embed(:canceled)
  end
end