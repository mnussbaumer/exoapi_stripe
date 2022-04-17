defmodule ExOAPI.Stripe.Schemas.SetupIntentNextActionRedirectToUrl do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:return_url** :: *:string*

  If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.


  **:url** :: *:string*

  The URL you must redirect your customer to in order to authenticate.


  """

  @primary_key false
  typed_embedded_schema do
    field(:return_url, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :return_url])
  end
end