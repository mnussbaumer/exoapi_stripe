defmodule ExOAPI.Stripe.Schemas.PortalBusinessProfile do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:headline** :: *:string*

  The messaging shown to customers in the portal.


  **:privacy_policy_url** :: *:string*

  A link to the business’s publicly available privacy policy.


  **:terms_of_service_url** :: *:string*

  A link to the business’s publicly available terms of service.


  """

  @primary_key false
  typed_embedded_schema do
    field(:headline, :string)

    field(:privacy_policy_url, :string)

    field(:terms_of_service_url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:terms_of_service_url, :privacy_policy_url, :headline])
  end
end