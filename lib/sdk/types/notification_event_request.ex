defmodule ExOAPI.Stripe.Schemas.NotificationEventRequest do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:id** :: *:string*

  ID of the API request that caused the event. If null, the event was automatic (e.g., Stripe's automatic subscription handling). Request logs are available in the [dashboard](https://dashboard.stripe.com/logs), but currently not in the API.


  **:idempotency_key** :: *:string*

  The idempotency key transmitted during the request, if any. *Note: This property is populated only for events on or after May 23, 2017*.


  """

  @primary_key false
  typed_embedded_schema do
    field(:id, :string)

    field(:idempotency_key, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:idempotency_key, :id])
  end
end