defmodule ExOAPI.Stripe.Schemas.CardIssuingAccountTermsOfService do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:date** :: *:integer*

  The Unix timestamp marking when the account representative accepted the service agreement.


  **:ip** :: *:string*

  The IP address from which the account representative accepted the service agreement.


  **:user_agent** :: *:string*

  The user agent of the browser from which the account representative accepted the service agreement.


  """

  @primary_key false
  typed_embedded_schema do
    field(:date, :integer)

    field(:ip, :string)

    field(:user_agent, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:user_agent, :ip, :date])
  end
end