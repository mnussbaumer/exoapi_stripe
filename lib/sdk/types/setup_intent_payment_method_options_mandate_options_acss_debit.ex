defmodule ExOAPI.Stripe.Schemas.SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:custom_mandate_url** :: *:string*

  A URL for custom mandate text


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
    field(:custom_mandate_url, :string)

    field(:default_for, {:array, :string})

    field(:interval_description, :string)

    field(:payment_schedule, Ecto.Enum, values: [:sporadic, :interval, :combined])

    field(:transaction_type, Ecto.Enum, values: [:personal, :business])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :transaction_type,
      :payment_schedule,
      :interval_description,
      :default_for,
      :custom_mandate_url
    ])
  end
end