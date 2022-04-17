defmodule ExOAPI.Stripe.Schemas.SourceRedirectFlow do
  use TypedEctoSchema
  import Ecto.Changeset

  @type params :: map()

  @moduledoc """
  **:failure_reason** :: *:string*

  The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`.


  **:return_url** :: *:string*

  The URL you provide to redirect the customer to after they authenticated their payment.


  **:status** :: *:string*

  The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused).


  **:url** :: *:string*

  The URL provided to you to redirect a customer to as part of a `redirect` authentication flow.


  """

  @primary_key false
  typed_embedded_schema do
    field(:failure_reason, :string)

    field(:return_url, :string)

    field(:status, :string)

    field(:url, :string)
  end

  @spec changeset(params()) :: Ecto.Changeset.t()
  @spec changeset(__MODULE__.t(), params()) :: Ecto.Changeset.t()
  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:url, :status, :return_url, :failure_reason])
    |> validate_required([:url, :status, :return_url])
  end
end