defmodule ExOAPI.Stripe.SDK.Account do
  @doc """
  **description**: <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

  """

  @spec delete_account_persons_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_account_persons_person(%ExOAPI.Client{} = client, body, person) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/persons/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing person.</p>

  """

  @spec post_account_persons_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_account_persons_person(%ExOAPI.Client{} = client, body, person) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/persons/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an existing person.</p>

  """
  @type get_account_persons_person_opts :: {:expand, String.t()}
  @spec get_account_persons_person(
          client :: ExOAPI.Client.t(),
          person :: String.t(),
          list(get_account_persons_person_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_persons_person(%ExOAPI.Client{} = client, person, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/persons/{person}")
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing Account Capability.</p>

  """

  @spec post_account_capabilities_capability(
          client :: ExOAPI.Client.t(),
          body :: map(),
          capability :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_account_capabilities_capability(%ExOAPI.Client{} = client, body, capability) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/capabilities/{capability}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("capability", capability)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves information about the specified Account Capability.</p>

  """
  @type get_account_capabilities_capability_opts :: {:expand, String.t()}
  @spec get_account_capabilities_capability(
          client :: ExOAPI.Client.t(),
          capability :: String.t(),
          list(get_account_capabilities_capability_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_capabilities_capability(%ExOAPI.Client{} = client, capability, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/capabilities/{capability}")
    |> ExOAPI.Client.replace_in_path("capability", capability)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a specified external account for a given account.</p>

  """

  @spec delete_account_external_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_account_external_accounts_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/external_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the metadata, account holder name, account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>

  <p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

  """

  @spec post_account_external_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_account_external_accounts_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/external_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a specified external account for a given account.</p>

  """
  @type get_account_external_accounts_id_opts :: {:expand, String.t()}
  @spec get_account_external_accounts_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_account_external_accounts_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_external_accounts_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/external_accounts/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new person.</p>

  """

  @spec post_account_persons(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_account_persons(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/persons")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

  """
  @type get_account_persons_opts ::
          {:starting_after, String.t()}
          | {:relationship, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_account_persons(client :: ExOAPI.Client.t(), list(get_account_persons_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_account_persons(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/persons")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:relationship, "relationship", "deepObject", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.</p>

  """
  @type get_account_capabilities_opts :: {:expand, String.t()}
  @spec get_account_capabilities(
          client :: ExOAPI.Client.t(),
          list(get_account_capabilities_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_capabilities(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/capabilities")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new person.</p>

  """

  @spec post_account_people(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_account_people(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/people")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

  """
  @type get_account_people_opts ::
          {:starting_after, String.t()}
          | {:relationship, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_account_people(client :: ExOAPI.Client.t(), list(get_account_people_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_account_people(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/people")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:relationship, "relationship", "deepObject", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a specified external account for a given account.</p>

  """

  @spec delete_account_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_account_bank_accounts_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/bank_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the metadata, account holder name, account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>

  <p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

  """

  @spec post_account_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_account_bank_accounts_id(%ExOAPI.Client{} = client, body, id) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/bank_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a specified external account for a given account.</p>

  """
  @type get_account_bank_accounts_id_opts :: {:expand, String.t()}
  @spec get_account_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          list(get_account_bank_accounts_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_bank_accounts_id(%ExOAPI.Client{} = client, id, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/bank_accounts/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Create an external account for a given account.</p>

  """

  @spec post_account_external_accounts(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_account_external_accounts(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/external_accounts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List external accounts for an account.</p>

  """
  @type get_account_external_accounts_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_account_external_accounts(
          client :: ExOAPI.Client.t(),
          list(get_account_external_accounts_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_external_accounts(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/external_accounts")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

  """

  @spec delete_account_people_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_account_people_person(%ExOAPI.Client{} = client, body, person) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/people/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing person.</p>

  """

  @spec post_account_people_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_account_people_person(%ExOAPI.Client{} = client, body, person) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/people/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an existing person.</p>

  """
  @type get_account_people_person_opts :: {:expand, String.t()}
  @spec get_account_people_person(
          client :: ExOAPI.Client.t(),
          person :: String.t(),
          list(get_account_people_person_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_account_people_person(%ExOAPI.Client{} = client, person, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/people/{person}")
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>With <a href="/docs/connect">Connect</a>, you can delete accounts you manage.</p>

  <p>Accounts created using test-mode keys can be deleted at any time. Standard accounts created using live-mode keys cannot be deleted. Custom or Express accounts created using live-mode keys can only be deleted once all balances are zero.</p>

  <p>If you want to delete your own account, use the <a href="https://dashboard.stripe.com/account">account information tab in your account settings</a> instead.</p>

  """

  @spec delete_account(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def delete_account(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a <a href="/docs/connect/accounts">connected account</a> by setting the values of the parameters passed. Any parameters not provided are left unchanged. Most parameters can be changed only for Custom accounts. (These are marked <strong>Custom Only</strong> below.) Parameters marked <strong>Custom and Express</strong> are not supported for Standard accounts.</p>

  <p>To update your own account, use the <a href="https://dashboard.stripe.com/account">Dashboard</a>. Refer to our <a href="/docs/connect/updating-accounts">Connect</a> documentation to learn more about updating accounts.</p>

  """

  @spec post_account(client :: ExOAPI.Client.t(), body :: map()) :: {:ok, any()} | {:error, any()}
  def post_account(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an account.</p>

  """
  @type get_account_opts :: {:expand, String.t()}
  @spec get_account(client :: ExOAPI.Client.t(), list(get_account_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_account(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a single-use login link for an Express account to access their Stripe dashboard.</p>

  <p><strong>You may only create login links for <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.</p>

  """

  @spec post_account_login_links(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_account_login_links(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/login_links")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Create an external account for a given account.</p>

  """

  @spec post_account_bank_accounts(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_account_bank_accounts(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/account/bank_accounts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end
end