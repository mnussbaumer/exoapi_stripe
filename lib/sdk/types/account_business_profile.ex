defmodule ExOAPI.Stripe.Schemas.AccountBusinessProfile do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:mcc** :: *:string*

  [The merchant category code for the account](https://stripe.com/docs/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide.


  **:name** :: *:string*

  The customer-facing business name.


  **:product_description** :: *:string*

  Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes.


  **:support_address** :: *ExOAPI.Stripe.Schemas.Address*

  A publicly available mailing address for sending support issues to.


  **:support_email** :: *:string*

  A publicly available email address for sending support issues to.


  **:support_phone** :: *:string*

  A publicly available phone number to call with support issues.


  **:support_url** :: *:string*

  A publicly available website for handling support issues.


  **:url** :: *:string*

  The business's publicly available website.


  """

  @primary_key false
  typed_embedded_schema do
    field(:mcc, :string)

    field(:name, :string)

    field(:product_description, :string)

    field(:support_address, ExOAPI.EctoTypes.AnyOf, types: [ExOAPI.Stripe.Schemas.Address])

    field(:support_email, :string)

    field(:support_phone, :string)

    field(:support_url, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :url,
      :support_url,
      :support_phone,
      :support_email,
      :support_address,
      :product_description,
      :name,
      :mcc
    ])
  end
end