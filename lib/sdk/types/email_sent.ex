defmodule ExOAPI.Stripe.Schemas.EmailSent do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:email_sent_at** :: *:integer*

  The timestamp when the email was sent.


  **:email_sent_to** :: *:string*

  The recipient's email address.


  """

  @primary_key false
  typed_embedded_schema do
    field(:email_sent_at, :integer)

    field(:email_sent_to, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:email_sent_to, :email_sent_at])
    |> validate_required([:email_sent_to, :email_sent_at])
  end
end