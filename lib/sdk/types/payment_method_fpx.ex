defmodule ExOAPI.Stripe.Schemas.PaymentMethodFpx do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:bank** :: *:string*

  The customer's bank, if provided. Can be one of `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.


  """

  @primary_key false
  typed_embedded_schema do
    field(:bank, Ecto.Enum,
      values: [
        :uob,
        :standard_chartered,
        :rhb,
        :public_bank,
        :pb_enterprise,
        :ocbc,
        :maybank2u,
        :maybank2e,
        :kfh,
        :hsbc,
        :hong_leong_bank,
        :deutsche_bank,
        :cimb,
        :bsn,
        :bank_rakyat,
        :bank_muamalat,
        :bank_islam,
        :ambank,
        :alliance_bank,
        :agrobank,
        :affin_bank
      ]
    )
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:bank])
    |> validate_required([:bank])
  end
end