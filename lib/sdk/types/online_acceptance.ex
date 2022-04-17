defmodule ExOAPI.Stripe.Schemas.OnlineAcceptance do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:ip_address** :: *:string*

  The IP address from which the Mandate was accepted by the customer.


  **:user_agent** :: *:string*

  The user agent of the browser from which the Mandate was accepted by the customer.


  """

  @primary_key false
  typed_embedded_schema do
    field(:ip_address, :string)

    field(:user_agent, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:user_agent, :ip_address])
  end
end