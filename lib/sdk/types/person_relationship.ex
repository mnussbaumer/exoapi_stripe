defmodule ExOAPI.Stripe.Schemas.PersonRelationship do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:director** :: *:boolean*

  Whether the person is a director of the account's legal entity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.


  **:executive** :: *:boolean*

  Whether the person has significant responsibility to control, manage, or direct the organization.


  **:owner** :: *:boolean*

  Whether the person is an owner of the account’s legal entity.


  **:percent_ownership** :: *:number*

  The percent owned by the person of the account's legal entity.


  **:representative** :: *:boolean*

  Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.


  **:title** :: *:string*

  The person's title (e.g., CEO, Support Engineer).


  """

  @primary_key false
  typed_embedded_schema do
    field(:director, :boolean)

    field(:executive, :boolean)

    field(:owner, :boolean)

    field(:percent_ownership, :float)

    field(:representative, :boolean)

    field(:title, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:title, :representative, :percent_ownership, :owner, :executive, :director])
  end
end