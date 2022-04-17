defmodule ExOAPI.Stripe.Schemas.TaxIdVerification do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:status** :: *:string*

  Verification status, one of `pending`, `verified`, `unverified`, or `unavailable`.


  **:verified_address** :: *:string*

  Verified address.


  **:verified_name** :: *:string*

  Verified name.


  """

  @primary_key false
  typed_embedded_schema do
    field(:status, Ecto.Enum, values: [:verified, :unverified, :unavailable, :pending])

    field(:verified_address, :string)

    field(:verified_name, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:verified_name, :verified_address, :status])
    |> validate_required([:status])
  end
end