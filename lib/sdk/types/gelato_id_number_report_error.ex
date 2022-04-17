defmodule ExOAPI.Stripe.Schemas.GelatoIdNumberReportError do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:code** :: *:string*

  A short machine-readable string giving the reason for the verification failure.


  **:reason** :: *:string*

  A human-readable message giving the reason for the failure. These messages can be shown to your users.


  """

  @primary_key false
  typed_embedded_schema do
    field(:code, Ecto.Enum,
      values: [
        :id_number_unverified_other,
        :id_number_mismatch,
        :id_number_insufficient_document_data
      ]
    )

    field(:reason, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:reason, :code])
  end
end