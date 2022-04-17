defmodule ExOAPI.Stripe.Schemas.AccountUnificationAccountController do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:is_controller** :: *:boolean*

  `true` if the Connect application retrieving the resource controls the account and can therefore exercise [platform controls](https://stripe.com/docs/connect/platform-controls-for-standard-accounts). Otherwise, this field is null.


  **:type** :: *:string*

  The controller type. Can be `application`, if a Connect application controls the account, or `account`, if the account controls itself.


  """

  @primary_key false
  typed_embedded_schema do
    field(:is_controller, :boolean)

    field(:type, Ecto.Enum, values: [:application, :account])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:type, :is_controller])
    |> validate_required([:type])
  end
end