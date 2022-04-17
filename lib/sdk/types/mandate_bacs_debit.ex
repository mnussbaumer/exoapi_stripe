defmodule ExOAPI.Stripe.Schemas.MandateBacsDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:network_status** :: *:string*

  The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`, or `accepted`.


  **:reference** :: *:string*

  The unique reference identifying the mandate on the Bacs network.


  **:url** :: *:string*

  The URL that will contain the mandate that the customer has signed.


  """

  @primary_key false
  typed_embedded_schema do
    field(:network_status, Ecto.Enum, values: [:revoked, :refused, :pending, :accepted])

    field(:reference, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :reference, :network_status])
    |> validate_required([:url, :reference, :network_status])
  end
end