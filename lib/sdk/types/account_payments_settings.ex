defmodule ExOAPI.Stripe.Schemas.AccountPaymentsSettings do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:statement_descriptor** :: *:string*

  The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge.


  **:statement_descriptor_kana** :: *:string*

  The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only)


  **:statement_descriptor_kanji** :: *:string*

  The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only)


  """

  @primary_key false
  typed_embedded_schema do
    field(:statement_descriptor, :string)

    field(:statement_descriptor_kana, :string)

    field(:statement_descriptor_kanji, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [
      :statement_descriptor_kanji,
      :statement_descriptor_kana,
      :statement_descriptor
    ])
  end
end