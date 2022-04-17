defmodule ExOAPI.Stripe.Schemas.AccountLink do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **description**: Account Links are the means by which a Connect platform grants a connected account permission to access
  Stripe-hosted applications, such as Connect Onboarding.

  Related guide: [Connect Onboarding](https://stripe.com/docs/connect/connect-onboarding).

  **:created** :: *:integer*

  Time at which the object was created. Measured in seconds since the Unix epoch.


  **:expires_at** :: *:integer*

  The timestamp at which this account link will expire.


  **:object** :: *:string*

  String representing the object's type. Objects of the same type share the same value.


  **:url** :: *:string*

  The URL for the account link.


  """

  @primary_key false
  typed_embedded_schema do
    field(:created, :integer)

    field(:expires_at, :integer)

    field(:object, Ecto.Enum, values: [:account_link])

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :object, :expires_at, :created])
    |> validate_required([:url, :object, :expires_at, :created])
  end
end