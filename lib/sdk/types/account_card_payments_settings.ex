defmodule ExOAPI.Stripe.Schemas.AccountCardPaymentsSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:decline_on** :: *ExOAPI.Stripe.Schemas.AccountDeclineChargeOn*


  **:statement_descriptor_prefix** :: *:string*

  The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion.


  """

  @primary_key false
  typed_embedded_schema do
    embeds_one(:decline_on, ExOAPI.Stripe.Schemas.AccountDeclineChargeOn)

    field(:statement_descriptor_prefix, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:statement_descriptor_prefix])
    |> cast_embed(:decline_on)
  end
end