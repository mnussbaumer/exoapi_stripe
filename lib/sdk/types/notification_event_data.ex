defmodule ExOAPI.Stripe.Schemas.NotificationEventData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:object** :: *:map*

  Object containing the API resource relevant to the event. For example, an `invoice.created` event will have a full [invoice object](https://stripe.com/docs/api#invoice_object) as the value of the object key.


  **:previous_attributes** :: *:map*

  Object containing the names of the attributes that have changed, and their previous values (sent along only with *.updated events).


  """

  @primary_key false
  typed_embedded_schema do
    field(:object, :map)

    field(:previous_attributes, :map)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:previous_attributes, :object])
    |> validate_required([:object])
  end
end