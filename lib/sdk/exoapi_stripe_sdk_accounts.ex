defmodule ExOAPI.Stripe.SDK.Accounts do
  @doc """
  **description**: <p>With <a href="/docs/connect">Connect</a>, you can create Stripe accounts for your users.
  To do this, you’ll first need to <a href="https://dashboard.stripe.com/account/applications/settings">register your platform</a>.</p>

  """

  @spec post_accounts(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_accounts(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of accounts connected to your platform via <a href="/docs/connect">Connect</a>. If you’re not a platform, the list is empty.</p>

  """
  @type get_accounts_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_accounts(client :: ExOAPI.Client.t(), list(get_accounts_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_accounts(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

  """

  @spec delete_accounts_account_people_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_accounts_account_people_person(%ExOAPI.Client{} = client, body, person, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/people/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing person.</p>

  """

  @spec post_accounts_account_people_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_people_person(%ExOAPI.Client{} = client, body, person, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/people/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an existing person.</p>

  """
  @type get_accounts_account_people_person_opts :: {:expand, String.t()}
  @spec get_accounts_account_people_person(
          client :: ExOAPI.Client.t(),
          person :: String.t(),
          account :: String.t(),
          list(get_accounts_account_people_person_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_people_person(%ExOAPI.Client{} = client, person, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/people/{person}")
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

  """

  @spec delete_accounts_account_persons_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_accounts_account_persons_person(%ExOAPI.Client{} = client, body, person, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/persons/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing person.</p>

  """

  @spec post_accounts_account_persons_person(
          client :: ExOAPI.Client.t(),
          body :: map(),
          person :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_persons_person(%ExOAPI.Client{} = client, body, person, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/persons/{person}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an existing person.</p>

  """
  @type get_accounts_account_persons_person_opts :: {:expand, String.t()}
  @spec get_accounts_account_persons_person(
          client :: ExOAPI.Client.t(),
          person :: String.t(),
          account :: String.t(),
          list(get_accounts_account_persons_person_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_persons_person(%ExOAPI.Client{} = client, person, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/persons/{person}")
    |> ExOAPI.Client.replace_in_path("person", person)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a specified external account for a given account.</p>

  """

  @spec delete_accounts_account_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_accounts_account_bank_accounts_id(%ExOAPI.Client{} = client, body, id, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/bank_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the metadata, account holder name, account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>

  <p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

  """

  @spec post_accounts_account_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_bank_accounts_id(%ExOAPI.Client{} = client, body, id, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/bank_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a specified external account for a given account.</p>

  """
  @type get_accounts_account_bank_accounts_id_opts :: {:expand, String.t()}
  @spec get_accounts_account_bank_accounts_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          account :: String.t(),
          list(get_accounts_account_bank_accounts_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_bank_accounts_id(%ExOAPI.Client{} = client, id, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/bank_accounts/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Create an external account for a given account.</p>

  """

  @spec post_accounts_account_bank_accounts(
          client :: ExOAPI.Client.t(),
          body :: map(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_bank_accounts(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/bank_accounts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>With <a href="/docs/connect">Connect</a>, you can delete accounts you manage.</p>

  <p>Accounts created using test-mode keys can be deleted at any time. Standard accounts created using live-mode keys cannot be deleted. Custom or Express accounts created using live-mode keys can only be deleted once all balances are zero.</p>

  <p>If you want to delete your own account, use the <a href="https://dashboard.stripe.com/account">account information tab in your account settings</a> instead.</p>

  """

  @spec delete_accounts_account(client :: ExOAPI.Client.t(), body :: map(), account :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def delete_accounts_account(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates a <a href="/docs/connect/accounts">connected account</a> by setting the values of the parameters passed. Any parameters not provided are left unchanged. Most parameters can be changed only for Custom accounts. (These are marked <strong>Custom Only</strong> below.) Parameters marked <strong>Custom and Express</strong> are not supported for Standard accounts.</p>

  <p>To update your own account, use the <a href="https://dashboard.stripe.com/account">Dashboard</a>. Refer to our <a href="/docs/connect/updating-accounts">Connect</a> documentation to learn more about updating accounts.</p>

  """

  @spec post_accounts_account(client :: ExOAPI.Client.t(), body :: map(), account :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_accounts_account(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an account.</p>

  """
  @type get_accounts_account_opts :: {:expand, String.t()}
  @spec get_accounts_account(
          client :: ExOAPI.Client.t(),
          account :: String.t(),
          list(get_accounts_account_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account(%ExOAPI.Client{} = client, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}")
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete a specified external account for a given account.</p>

  """

  @spec delete_accounts_account_external_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_accounts_account_external_accounts_id(%ExOAPI.Client{} = client, body, id, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/external_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the metadata, account holder name, account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.</p>

  <p>You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.</p>

  """

  @spec post_accounts_account_external_accounts_id(
          client :: ExOAPI.Client.t(),
          body :: map(),
          id :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_external_accounts_id(%ExOAPI.Client{} = client, body, id, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/external_accounts/{id}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a specified external account for a given account.</p>

  """
  @type get_accounts_account_external_accounts_id_opts :: {:expand, String.t()}
  @spec get_accounts_account_external_accounts_id(
          client :: ExOAPI.Client.t(),
          id :: String.t(),
          account :: String.t(),
          list(get_accounts_account_external_accounts_id_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_external_accounts_id(
        %ExOAPI.Client{} = client,
        id,
        account,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/external_accounts/{id}")
    |> ExOAPI.Client.replace_in_path("id", id)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.</p>

  """
  @type get_accounts_account_capabilities_opts :: {:expand, String.t()}
  @spec get_accounts_account_capabilities(
          client :: ExOAPI.Client.t(),
          account :: String.t(),
          list(get_accounts_account_capabilities_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_capabilities(%ExOAPI.Client{} = client, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/capabilities")
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new person.</p>

  """

  @spec post_accounts_account_persons(
          client :: ExOAPI.Client.t(),
          body :: map(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_persons(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/persons")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

  """
  @type get_accounts_account_persons_opts ::
          {:starting_after, String.t()}
          | {:relationship, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_accounts_account_persons(
          client :: ExOAPI.Client.t(),
          account :: String.t(),
          list(get_accounts_account_persons_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_persons(%ExOAPI.Client{} = client, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/persons")
    |> ExOAPI.Client.replace_in_path("account", account)
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
  **description**: <p>Updates an existing Account Capability.</p>

  """

  @spec post_accounts_account_capabilities_capability(
          client :: ExOAPI.Client.t(),
          body :: map(),
          capability :: String.t(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_capabilities_capability(
        %ExOAPI.Client{} = client,
        body,
        capability,
        account
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/capabilities/{capability}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("capability", capability)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves information about the specified Account Capability.</p>

  """
  @type get_accounts_account_capabilities_capability_opts :: {:expand, String.t()}
  @spec get_accounts_account_capabilities_capability(
          client :: ExOAPI.Client.t(),
          capability :: String.t(),
          account :: String.t(),
          list(get_accounts_account_capabilities_capability_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_capabilities_capability(
        %ExOAPI.Client{} = client,
        capability,
        account,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/capabilities/{capability}")
    |> ExOAPI.Client.replace_in_path("capability", capability)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Create an external account for a given account.</p>

  """

  @spec post_accounts_account_external_accounts(
          client :: ExOAPI.Client.t(),
          body :: map(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_external_accounts(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/external_accounts")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List external accounts for an account.</p>

  """
  @type get_accounts_account_external_accounts_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_accounts_account_external_accounts(
          client :: ExOAPI.Client.t(),
          account :: String.t(),
          list(get_accounts_account_external_accounts_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_external_accounts(%ExOAPI.Client{} = client, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/external_accounts")
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a single-use login link for an Express account to access their Stripe dashboard.</p>

  <p><strong>You may only create login links for <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.</p>

  """

  @spec post_accounts_account_login_links(
          client :: ExOAPI.Client.t(),
          body :: map(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_login_links(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/login_links")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>With <a href="/docs/connect">Connect</a>, you may flag accounts as suspicious.</p>

  <p>Test-mode Custom and Express accounts can be rejected at any time. Accounts created using live-mode keys may only be rejected once all balances are zero.</p>

  """

  @spec post_accounts_account_reject(
          client :: ExOAPI.Client.t(),
          body :: map(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_reject(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/reject")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new person.</p>

  """

  @spec post_accounts_account_people(
          client :: ExOAPI.Client.t(),
          body :: map(),
          account :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_accounts_account_people(%ExOAPI.Client{} = client, body, account) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/people")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.</p>

  """
  @type get_accounts_account_people_opts ::
          {:starting_after, String.t()}
          | {:relationship, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_accounts_account_people(
          client :: ExOAPI.Client.t(),
          account :: String.t(),
          list(get_accounts_account_people_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_accounts_account_people(%ExOAPI.Client{} = client, account, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/accounts/{account}/people")
    |> ExOAPI.Client.replace_in_path("account", account)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:relationship, "relationship", "deepObject", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end