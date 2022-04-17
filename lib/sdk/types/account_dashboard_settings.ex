defmodule ExOAPI.Stripe.Schemas.AccountDashboardSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:display_name** :: *:string*

  The display name for this account. This is used on the Stripe Dashboard to differentiate between accounts.


  **:timezone** :: *:string*

  The timezone used in the Stripe Dashboard for this account. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones).


  """

  @primary_key false
  typed_embedded_schema do
    field(:display_name, :string)

    field(:timezone, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:timezone, :display_name])
  end
end