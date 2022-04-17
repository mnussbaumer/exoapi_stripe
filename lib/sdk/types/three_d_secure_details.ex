defmodule ExOAPI.Stripe.Schemas.ThreeDSecureDetails do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:authentication_flow** :: *:string*

  For authenticated transactions: how the customer was authenticated by
  the issuing bank.


  **:result** :: *:string*

  Indicates the outcome of 3D Secure authentication.


  **:result_reason** :: *:string*

  Additional information about why 3D Secure succeeded or failed based
  on the `result`.


  **:version** :: *:string*

  The version of 3D Secure that was used.


  """

  @primary_key false
  typed_embedded_schema do
    field(:authentication_flow, Ecto.Enum, values: [:frictionless, :challenge])

    field(:result, Ecto.Enum,
      values: [:processing_error, :not_supported, :failed, :authenticated, :attempt_acknowledged]
    )

    field(:result_reason, Ecto.Enum,
      values: [
        :rejected,
        :protocol_error,
        :network_not_supported,
        :card_not_enrolled,
        :canceled,
        :bypassed,
        :abandoned
      ]
    )

    field(:version, Ecto.Enum, values: [:"2.2.0", :"2.1.0", :"1.0.2"])
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:version, :result_reason, :result, :authentication_flow])
  end
end