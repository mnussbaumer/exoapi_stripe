defmodule ExOAPI.Stripe.Schemas.IssuingAuthorizationMerchantData do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:category** :: *:string*

  A categorization of the seller's type of business. See our [merchant categories guide](https://stripe.com/docs/issuing/merchant-categories) for a list of possible values.


  **:category_code** :: *:string*

  The merchant category code for the seller’s business


  **:city** :: *:string*

  City where the seller is located


  **:country** :: *:string*

  Country where the seller is located


  **:name** :: *:string*

  Name of the seller


  **:network_id** :: *:string*

  Identifier assigned to the seller by the card brand


  **:postal_code** :: *:string*

  Postal code where the seller is located


  **:state** :: *:string*

  State where the seller is located


  """

  @primary_key false
  typed_embedded_schema do
    field(:category, :string)

    field(:category_code, :string)

    field(:city, :string)

    field(:country, :string)

    field(:name, :string)

    field(:network_id, :string)

    field(:postal_code, :string)

    field(:state, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :state,
      :postal_code,
      :network_id,
      :name,
      :country,
      :city,
      :category_code,
      :category
    ])
    |> validate_required([:network_id, :category_code, :category])
  end
end