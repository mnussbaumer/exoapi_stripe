defmodule ExOAPI.Stripe.Schemas.MandateAcssDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **::default_for** :: *:string*


  **:interval_description** :: *:string*

  Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.


  **:payment_schedule** :: *:string*

  Payment schedule for the mandate.


  **:transaction_type** :: *:string*

  Transaction type of the mandate.


  """

  @primary_key false
  typed_embedded_schema do
    field(:default_for, {:array, :string})

    field(:interval_description, :string)

    field(:payment_schedule, Ecto.Enum, values: [:sporadic, :interval, :combined])

    field(:transaction_type, Ecto.Enum, values: [:personal, :business])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:transaction_type, :payment_schedule, :interval_description, :default_for])
    |> validate_required([:transaction_type, :payment_schedule])
  end
end