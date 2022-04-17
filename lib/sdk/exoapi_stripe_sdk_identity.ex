defmodule ExOAPI.Stripe.SDK.Identity do
  @doc """
  **description**: <p>Redact a VerificationSession to remove all collected information from Stripe. This will redact
  the VerificationSession and all objects related to it, including VerificationReports, Events,
  request logs, etc.</p>

  <p>A VerificationSession object can be redacted when it is in <code>requires_input</code> or <code>verified</code>
  <a href="/docs/identity/how-sessions-work">status</a>. Redacting a VerificationSession in <code>requires_action</code>
  state will automatically cancel it.</p>

  <p>The redaction process may take up to four days. When the redaction process is in progress, the
  VerificationSession’s <code>redaction.status</code> field will be set to <code>processing</code>; when the process is
  finished, it will change to <code>redacted</code> and an <code>identity.verification_session.redacted</code> event
  will be emitted.</p>

  <p>Redaction is irreversible. Redacted objects are still accessible in the Stripe API, but all the
  fields that contain personal data will be replaced by the string <code>[redacted]</code> or a similar
  placeholder. The <code>metadata</code> field will also be erased. Redacted objects cannot be updated or
  used for any purpose.</p>

  <p><a href="/docs/identity/verification-sessions#redact">Learn more</a>.</p>

  """

  @spec post_identity_verification_sessions_session_redact(
          client :: ExOAPI.Client.t(),
          body :: map(),
          session :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_identity_verification_sessions_session_redact(%ExOAPI.Client{} = client, body, session) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_sessions/{session}/redact")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A VerificationSession object can be canceled when it is in <code>requires_input</code> <a href="/docs/identity/how-sessions-work">status</a>.</p>

  <p>Once canceled, future submission attempts are disabled. This cannot be undone. <a href="/docs/identity/verification-sessions#cancel">Learn more</a>.</p>

  """

  @spec post_identity_verification_sessions_session_cancel(
          client :: ExOAPI.Client.t(),
          body :: map(),
          session :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_identity_verification_sessions_session_cancel(%ExOAPI.Client{} = client, body, session) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_sessions/{session}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a VerificationSession object.</p>

  <p>After the VerificationSession is created, display a verification modal using the session <code>client_secret</code> or send your users to the session’s <code>url</code>.</p>

  <p>If your API key is in test mode, verification checks won’t actually process, though everything else will occur as if in live mode.</p>

  <p>Related guide: <a href="/docs/identity/verify-identity-documents">Verify your users’ identity documents</a>.</p>

  """

  @spec post_identity_verification_sessions(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_identity_verification_sessions(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_sessions")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of VerificationSessions</p>

  """
  @type get_identity_verification_sessions_opts ::
          {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_identity_verification_sessions(
          client :: ExOAPI.Client.t(),
          list(get_identity_verification_sessions_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_identity_verification_sessions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_sessions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an existing VerificationReport</p>

  """
  @type get_identity_verification_reports_report_opts :: {:expand, String.t()}
  @spec get_identity_verification_reports_report(
          client :: ExOAPI.Client.t(),
          report :: String.t(),
          list(get_identity_verification_reports_report_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_identity_verification_reports_report(%ExOAPI.Client{} = client, report, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_reports/{report}")
    |> ExOAPI.Client.replace_in_path("report", report)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List all verification reports.</p>

  """
  @type get_identity_verification_reports_opts ::
          {:verification_session, String.t()}
          | {:type, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_identity_verification_reports(
          client :: ExOAPI.Client.t(),
          list(get_identity_verification_reports_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_identity_verification_reports(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_reports")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:verification_session, "verification_session", "form", true},
      {:type, "type", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a VerificationSession object.</p>

  <p>When the session status is <code>requires_input</code>, you can use this method to update the
  verification check and options.</p>

  """

  @spec post_identity_verification_sessions_session(
          client :: ExOAPI.Client.t(),
          body :: map(),
          session :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_identity_verification_sessions_session(%ExOAPI.Client{} = client, body, session) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_sessions/{session}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of a VerificationSession that was previously created.</p>

  <p>When the session status is <code>requires_input</code>, you can use this method to retrieve a valid
  <code>client_secret</code> or <code>url</code> to allow re-submission.</p>

  """
  @type get_identity_verification_sessions_session_opts :: {:expand, String.t()}
  @spec get_identity_verification_sessions_session(
          client :: ExOAPI.Client.t(),
          session :: String.t(),
          list(get_identity_verification_sessions_session_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_identity_verification_sessions_session(%ExOAPI.Client{} = client, session, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/identity/verification_sessions/{session}")
    |> ExOAPI.Client.replace_in_path("session", session)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end