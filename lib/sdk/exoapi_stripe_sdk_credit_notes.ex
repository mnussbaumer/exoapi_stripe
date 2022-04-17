defmodule ExOAPI.Stripe.SDK.CreditNotes do
  @doc """
  **description**: <p>Marks a credit note as void. Learn more about <a href="/docs/billing/invoices/credit-notes#voiding">voiding credit notes</a>.</p>

  """

  @spec post_credit_notes_id_void(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_credit_notes_id_void(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes/{id}/void")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Issue a credit note to adjust the amount of a finalized invoice. For a <code>status=open</code> invoice, a credit note reduces
  its <code>amount_due</code>. For a <code>status=paid</code> invoice, a credit note does not affect its <code>amount_due</code>. Instead, it can result
  in any combination of the following:</p>

  <ul>
  <li>Refund: create a new refund (using <code>refund_amount</code>) or link an existing refund (using <code>refund</code>).</li>
  <li>Customer balance credit: credit the customer’s balance (using <code>credit_amount</code>) which will be automatically applied to their next invoice when it’s finalized.</li>
  <li>Outside of Stripe credit: record the amount that is or will be credited outside of Stripe (using <code>out_of_band_amount</code>).</li>
  </ul>

  <p>For post-payment credit notes the sum of the refund, credit and outside of Stripe amounts must equal the credit note total.</p>

  <p>You may issue multiple credit notes for an invoice. Each credit note will increment the invoice’s <code>pre_payment_credit_notes_amount</code>
  or <code>post_payment_credit_notes_amount</code> depending on its <code>status</code> at the time of credit note creation.</p>

  """

  @spec post_credit_notes(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_credit_notes(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of credit notes.</p>

  """
  @type get_credit_notes_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:invoice, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
  @spec get_credit_notes(client :: ExOAPI.Client.t(), list(get_credit_notes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_credit_notes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:invoice, "invoice", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving a credit note preview, you’ll get a <strong>lines</strong> property containing the first handful of those items. This URL you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_credit_notes_preview_lines_opts ::
          {:starting_after, String.t()}
          | {:refund_amount, String.t()}
          | {:refund, String.t()}
          | {:reason, String.t()}
          | {:out_of_band_amount, String.t()}
          | {:metadata, String.t()}
          | {:memo, String.t()}
          | {:lines, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:credit_amount, String.t()}
          | {:amount, String.t()}
  @spec get_credit_notes_preview_lines(
          client :: ExOAPI.Client.t(),
          invoice :: String.t(),
          list(get_credit_notes_preview_lines_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_credit_notes_preview_lines(%ExOAPI.Client{} = client, invoice, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes/preview/lines")
    |> ExOAPI.Client.add_query("invoice", invoice)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:refund_amount, "refund_amount", "form", true},
      {:refund, "refund", "form", true},
      {:reason, "reason", "form", true},
      {:out_of_band_amount, "out_of_band_amount", "form", true},
      {:metadata, "metadata", "deepObject", true},
      {:memo, "memo", "form", true},
      {:lines, "lines", "deepObject", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:credit_amount, "credit_amount", "form", true},
      {:amount, "amount", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing credit note.</p>

  """

  @spec post_credit_notes_id(client :: ExOAPI.Client.t(), body :: map(), id :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_credit_notes_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the credit note object with the given identifier.</p>

  """
  @type get_credit_notes_id_opts :: {:expand, String.t()}
  @spec get_credit_notes_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_credit_notes_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_credit_notes_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Get a preview of a credit note without creating it.</p>

  """
  @type get_credit_notes_preview_opts ::
          {:refund_amount, String.t()}
          | {:refund, String.t()}
          | {:reason, String.t()}
          | {:out_of_band_amount, String.t()}
          | {:metadata, String.t()}
          | {:memo, String.t()}
          | {:lines, String.t()}
          | {:expand, String.t()}
          | {:credit_amount, String.t()}
          | {:amount, String.t()}
  @spec get_credit_notes_preview(
          client :: ExOAPI.Client.t(),
          invoice :: String.t(),
          list(get_credit_notes_preview_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_credit_notes_preview(%ExOAPI.Client{} = client, invoice, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes/preview")
    |> ExOAPI.Client.add_query("invoice", invoice)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:refund_amount, "refund_amount", "form", true},
      {:refund, "refund", "form", true},
      {:reason, "reason", "form", true},
      {:out_of_band_amount, "out_of_band_amount", "form", true},
      {:metadata, "metadata", "deepObject", true},
      {:memo, "memo", "form", true},
      {:lines, "lines", "deepObject", true},
      {:expand, "expand", "deepObject", true},
      {:credit_amount, "credit_amount", "form", true},
      {:amount, "amount", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving a credit note, you’ll get a <strong>lines</strong> property containing the the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_credit_notes_credit_note_lines_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_credit_notes_credit_note_lines(
          client :: ExOAPI.Client.t(),
          credit_note :: String.t(),
          list(get_credit_notes_credit_note_lines_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_credit_notes_credit_note_lines(%ExOAPI.Client{} = client, credit_note, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/credit_notes/{credit_note}/lines")
    |> ExOAPI.Client.replace_in_path("credit_note", credit_note)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end