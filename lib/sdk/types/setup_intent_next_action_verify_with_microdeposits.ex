defmodule ExOAPI.Stripe.Schemas.SetupIntentNextActionVerifyWithMicrodeposits do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:arrival_date** :: *:integer*

  The timestamp when the microdeposits are expected to land.


  **:hosted_verification_url** :: *:string*

  The URL for the hosted verification page, which allows customers to verify their bank account.


  **:microdeposit_type** :: *:string*

  The type of the microdeposit sent to the customer. Used to distinguish between different verification methods.


  """

  @primary_key false
  typed_embedded_schema do
    field(:arrival_date, :integer)

    field(:hosted_verification_url, :string)

    field(:microdeposit_type, Ecto.Enum, values: [:descriptor_code, :amounts])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:microdeposit_type, :hosted_verification_url, :arrival_date])
    |> validate_required([:hosted_verification_url, :arrival_date])
  end
end