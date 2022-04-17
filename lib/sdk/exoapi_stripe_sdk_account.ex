defmodule ExOAPI.Stripe.SDK.Account do
  @doc """
  **description**: <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.</p>

  """

  @spec delete_account_persons_person(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          person :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedPerson.t() | map()}
          | {:error, any()}
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
          body ::
            %{
              :verification => %{
                :document => %{:front => String.t(), :back => String.t()},
                :additional_document => %{:front => String.t(), :back => String.t()}
              },
              :ssn_last_4 => String.t(),
              :relationship => %{
                :title => String.t(),
                :representative => boolean(),
                :percent_ownership => String.t() | number(),
                :owner => boolean(),
                :executive => boolean(),
                :director => boolean()
              },
              :political_exposure => String.t(),
              :phone => String.t(),
              :person_token => String.t(),
              :nationality => String.t(),
              :metadata => String.t() | map(),
              :maiden_name => String.t(),
              :last_name_kanji => String.t(),
              :last_name_kana => String.t(),
              :last_name => String.t(),
              :id_number => String.t(),
              :gender => String.t(),
              :full_name_aliases => String.t() | [String.t()],
              :first_name_kanji => String.t(),
              :first_name_kana => String.t(),
              :first_name => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :documents => %{
                :visa => %{:files => [String.t()]},
                :passport => %{:files => [String.t()]},
                :company_authorization => %{:files => [String.t()]}
              },
              :dob => String.t() | %{:year => integer(), :month => integer(), :day => integer()},
              :address_kanji => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address_kana => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address => %{
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :account => String.t()
            }
            | map(),
          person :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Person.t() | map()}
          | {:error, any()}
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
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Person.t() | map()}
          | {:error, any()}
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
          body :: %{:requested => boolean(), :expand => [String.t()]} | map(),
          capability :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Capability.t() | map()}
          | {:error, any()}
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
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Capability.t() | map()}
          | {:error, any()}
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
          body :: %{} | map(),
          id :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedExternalAccount.t()
           | map()}
          | {:error, any()}
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
          body ::
            %{
              :name => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :exp_year => String.t(),
              :exp_month => String.t(),
              :default_for_currency => boolean(),
              :address_zip => String.t(),
              :address_state => String.t(),
              :address_line2 => String.t(),
              :address_line1 => String.t(),
              :address_country => String.t(),
              :address_city => String.t(),
              :account_type => String.t() | :checking | :futsu | :savings | :toza,
              :account_holder_type => String.t() | :company | :individual,
              :account_holder_name => String.t()
            }
            | map(),
          id :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ExternalAccount.t() | map()}
          | {:error, any()}
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
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ExternalAccount.t() | map()}
          | {:error, any()}
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

  @spec post_account_persons(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :verification => %{
                :document => %{:front => String.t(), :back => String.t()},
                :additional_document => %{:front => String.t(), :back => String.t()}
              },
              :ssn_last_4 => String.t(),
              :relationship => %{
                :title => String.t(),
                :representative => boolean(),
                :percent_ownership => String.t() | number(),
                :owner => boolean(),
                :executive => boolean(),
                :director => boolean()
              },
              :political_exposure => String.t(),
              :phone => String.t(),
              :person_token => String.t(),
              :nationality => String.t(),
              :metadata => String.t() | map(),
              :maiden_name => String.t(),
              :last_name_kanji => String.t(),
              :last_name_kana => String.t(),
              :last_name => String.t(),
              :id_number => String.t(),
              :gender => String.t(),
              :full_name_aliases => String.t() | [String.t()],
              :first_name_kanji => String.t(),
              :first_name_kana => String.t(),
              :first_name => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :documents => %{
                :visa => %{:files => [String.t()]},
                :passport => %{:files => [String.t()]},
                :company_authorization => %{:files => [String.t()]}
              },
              :dob => String.t() | %{:year => integer(), :month => integer(), :day => integer()},
              :address_kanji => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address_kana => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address => %{
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :account => String.t()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Person.t() | map()}
          | {:error, any()}
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
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Person.t()]
             }
           | map()}
          | {:error, any()}
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
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Capability.t()]
             }
           | map()}
          | {:error, any()}
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

  @spec post_account_people(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :verification => %{
                :document => %{:front => String.t(), :back => String.t()},
                :additional_document => %{:front => String.t(), :back => String.t()}
              },
              :ssn_last_4 => String.t(),
              :relationship => %{
                :title => String.t(),
                :representative => boolean(),
                :percent_ownership => String.t() | number(),
                :owner => boolean(),
                :executive => boolean(),
                :director => boolean()
              },
              :political_exposure => String.t(),
              :phone => String.t(),
              :person_token => String.t(),
              :nationality => String.t(),
              :metadata => String.t() | map(),
              :maiden_name => String.t(),
              :last_name_kanji => String.t(),
              :last_name_kana => String.t(),
              :last_name => String.t(),
              :id_number => String.t(),
              :gender => String.t(),
              :full_name_aliases => String.t() | [String.t()],
              :first_name_kanji => String.t(),
              :first_name_kana => String.t(),
              :first_name => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :documents => %{
                :visa => %{:files => [String.t()]},
                :passport => %{:files => [String.t()]},
                :company_authorization => %{:files => [String.t()]}
              },
              :dob => String.t() | %{:year => integer(), :month => integer(), :day => integer()},
              :address_kanji => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address_kana => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address => %{
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :account => String.t()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Person.t() | map()}
          | {:error, any()}
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
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Person.t()]
             }
           | map()}
          | {:error, any()}
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
          body :: %{} | map(),
          id :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedExternalAccount.t()
           | map()}
          | {:error, any()}
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
          body ::
            %{
              :name => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :exp_year => String.t(),
              :exp_month => String.t(),
              :default_for_currency => boolean(),
              :address_zip => String.t(),
              :address_state => String.t(),
              :address_line2 => String.t(),
              :address_line1 => String.t(),
              :address_country => String.t(),
              :address_city => String.t(),
              :account_type => String.t() | :checking | :futsu | :savings | :toza,
              :account_holder_type => String.t() | :company | :individual,
              :account_holder_name => String.t()
            }
            | map(),
          id :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ExternalAccount.t() | map()}
          | {:error, any()}
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
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ExternalAccount.t() | map()}
          | {:error, any()}
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

  @spec post_account_external_accounts(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => map(),
              :external_account => String.t(),
              :expand => [String.t()],
              :default_for_currency => boolean(),
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_type => String.t() | :checking | :futsu | :savings | :toza,
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  }
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ExternalAccount.t() | map()}
          | {:error, any()}
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
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Card.t() | ExOAPI.Stripe.Schemas.BankAccount.t()]
             }
           | map()}
          | {:error, any()}
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
          body :: %{} | map(),
          person :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedPerson.t() | map()}
          | {:error, any()}
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
          body ::
            %{
              :verification => %{
                :document => %{:front => String.t(), :back => String.t()},
                :additional_document => %{:front => String.t(), :back => String.t()}
              },
              :ssn_last_4 => String.t(),
              :relationship => %{
                :title => String.t(),
                :representative => boolean(),
                :percent_ownership => String.t() | number(),
                :owner => boolean(),
                :executive => boolean(),
                :director => boolean()
              },
              :political_exposure => String.t(),
              :phone => String.t(),
              :person_token => String.t(),
              :nationality => String.t(),
              :metadata => String.t() | map(),
              :maiden_name => String.t(),
              :last_name_kanji => String.t(),
              :last_name_kana => String.t(),
              :last_name => String.t(),
              :id_number => String.t(),
              :gender => String.t(),
              :full_name_aliases => String.t() | [String.t()],
              :first_name_kanji => String.t(),
              :first_name_kana => String.t(),
              :first_name => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :documents => %{
                :visa => %{:files => [String.t()]},
                :passport => %{:files => [String.t()]},
                :company_authorization => %{:files => [String.t()]}
              },
              :dob => String.t() | %{:year => integer(), :month => integer(), :day => integer()},
              :address_kanji => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address_kana => %{
                :town => String.t(),
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :address => %{
                :state => String.t(),
                :postal_code => String.t(),
                :line2 => String.t(),
                :line1 => String.t(),
                :country => String.t(),
                :city => String.t()
              },
              :account => String.t()
            }
            | map(),
          person :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Person.t() | map()}
          | {:error, any()}
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
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Person.t() | map()}
          | {:error, any()}
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

  @spec delete_account(client :: ExOAPI.Client.t(), body :: %{:account => String.t()} | map()) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.DeletedAccount.t() | map()}
          | {:error, any()}
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

  @spec post_account(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :tos_acceptance => %{
                :user_agent => String.t(),
                :service_agreement => String.t(),
                :ip => String.t(),
                :date => integer()
              },
              :settings => %{
                :payouts => %{
                  :statement_descriptor => String.t(),
                  :schedule => %{
                    :weekly_anchor =>
                      String.t()
                      | :friday
                      | :monday
                      | :saturday
                      | :sunday
                      | :thursday
                      | :tuesday
                      | :wednesday,
                    :monthly_anchor => integer(),
                    :interval => String.t() | :daily | :manual | :monthly | :weekly,
                    :delay_days => integer() | String.t() | :minimum
                  },
                  :debit_negative_balances => boolean()
                },
                :payments => %{
                  :statement_descriptor_kanji => String.t(),
                  :statement_descriptor_kana => String.t(),
                  :statement_descriptor => String.t()
                },
                :card_payments => %{
                  :statement_descriptor_prefix => String.t(),
                  :decline_on => %{:cvc_failure => boolean(), :avs_failure => boolean()}
                },
                :card_issuing => %{
                  :tos_acceptance => %{
                    :user_agent => String.t(),
                    :ip => String.t(),
                    :date => integer()
                  }
                },
                :branding => %{
                  :secondary_color => String.t(),
                  :primary_color => String.t(),
                  :logo => String.t(),
                  :icon => String.t()
                }
              },
              :metadata => String.t() | map(),
              :individual => %{
                :verification => %{
                  :document => %{:front => String.t(), :back => String.t()},
                  :additional_document => %{:front => String.t(), :back => String.t()}
                },
                :ssn_last_4 => String.t(),
                :political_exposure => String.t() | :existing | :none,
                :phone => String.t(),
                :metadata => String.t() | map(),
                :maiden_name => String.t(),
                :last_name_kanji => String.t(),
                :last_name_kana => String.t(),
                :last_name => String.t(),
                :id_number => String.t(),
                :gender => String.t(),
                :full_name_aliases => String.t() | [String.t()],
                :first_name_kanji => String.t(),
                :first_name_kana => String.t(),
                :first_name => String.t(),
                :email => String.t(),
                :dob =>
                  String.t() | %{:year => integer(), :month => integer(), :day => integer()},
                :address_kanji => %{
                  :town => String.t(),
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :address_kana => %{
                  :town => String.t(),
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :external_account => String.t(),
              :expand => [String.t()],
              :email => String.t(),
              :documents => %{
                :proof_of_registration => %{:files => [String.t()]},
                :company_tax_id_verification => %{:files => [String.t()]},
                :company_registration_verification => %{:files => [String.t()]},
                :company_ministerial_decree => %{:files => [String.t()]},
                :company_memorandum_of_association => %{:files => [String.t()]},
                :company_license => %{:files => [String.t()]},
                :bank_account_ownership_verification => %{:files => [String.t()]}
              },
              :default_currency => String.t(),
              :company => %{
                :verification => %{:document => %{:front => String.t(), :back => String.t()}},
                :vat_id => String.t(),
                :tax_id_registrar => String.t(),
                :tax_id => String.t(),
                :structure =>
                  String.t()
                  | :free_zone_establishment
                  | :free_zone_llc
                  | :government_instrumentality
                  | :governmental_unit
                  | :incorporated_non_profit
                  | :limited_liability_partnership
                  | :llc
                  | :multi_member_llc
                  | :private_company
                  | :private_corporation
                  | :private_partnership
                  | :public_company
                  | :public_corporation
                  | :public_partnership
                  | :single_member_llc
                  | :sole_establishment
                  | :sole_proprietorship
                  | :tax_exempt_government_instrumentality
                  | :unincorporated_association
                  | :unincorporated_non_profit,
                :registration_number => String.t(),
                :phone => String.t(),
                :ownership_declaration => %{
                  :user_agent => String.t(),
                  :ip => String.t(),
                  :date => integer()
                },
                :owners_provided => boolean(),
                :name_kanji => String.t(),
                :name_kana => String.t(),
                :name => String.t(),
                :executives_provided => boolean(),
                :directors_provided => boolean(),
                :address_kanji => %{
                  :town => String.t(),
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :address_kana => %{
                  :town => String.t(),
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :capabilities => %{
                :us_bank_account_ach_payments => %{:requested => boolean()},
                :transfers => %{:requested => boolean()},
                :tax_reporting_us_1099_misc => %{:requested => boolean()},
                :tax_reporting_us_1099_k => %{:requested => boolean()},
                :sofort_payments => %{:requested => boolean()},
                :sepa_debit_payments => %{:requested => boolean()},
                :paynow_payments => %{:requested => boolean()},
                :p24_payments => %{:requested => boolean()},
                :oxxo_payments => %{:requested => boolean()},
                :legacy_payments => %{:requested => boolean()},
                :konbini_payments => %{:requested => boolean()},
                :klarna_payments => %{:requested => boolean()},
                :jcb_payments => %{:requested => boolean()},
                :ideal_payments => %{:requested => boolean()},
                :grabpay_payments => %{:requested => boolean()},
                :giropay_payments => %{:requested => boolean()},
                :fpx_payments => %{:requested => boolean()},
                :eps_payments => %{:requested => boolean()},
                :cartes_bancaires_payments => %{:requested => boolean()},
                :card_payments => %{:requested => boolean()},
                :card_issuing => %{:requested => boolean()},
                :boleto_payments => %{:requested => boolean()},
                :bank_transfer_payments => %{:requested => boolean()},
                :bancontact_payments => %{:requested => boolean()},
                :bacs_debit_payments => %{:requested => boolean()},
                :au_becs_debit_payments => %{:requested => boolean()},
                :afterpay_clearpay_payments => %{:requested => boolean()},
                :acss_debit_payments => %{:requested => boolean()}
              },
              :business_type =>
                String.t() | :company | :government_entity | :individual | :non_profit,
              :business_profile => %{
                :url => String.t(),
                :support_url => String.t(),
                :support_phone => String.t(),
                :support_email => String.t(),
                :support_address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                },
                :product_description => String.t(),
                :name => String.t(),
                :mcc => String.t()
              },
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_type => String.t() | :checking | :futsu | :savings | :toza,
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  },
              :account_token => String.t()
            }
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Account.t() | map()}
          | {:error, any()}
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
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Account.t() | map()}
          | {:error, any()}
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

  @spec post_account_login_links(
          client :: ExOAPI.Client.t(),
          body ::
            %{:redirect_url => String.t(), :expand => [String.t()], :account => String.t()}
            | map()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.LoginLink.t() | map()}
          | {:error, any()}
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

  @spec post_account_bank_accounts(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => map(),
              :external_account => String.t(),
              :expand => [String.t()],
              :default_for_currency => boolean(),
              :bank_account =>
                String.t()
                | %{
                    :routing_number => String.t(),
                    :object => String.t() | :bank_account,
                    :currency => String.t(),
                    :country => String.t(),
                    :account_type => String.t() | :checking | :futsu | :savings | :toza,
                    :account_number => String.t(),
                    :account_holder_type => String.t() | :company | :individual,
                    :account_holder_name => String.t()
                  }
            }
            | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ExternalAccount.t() | map()}
          | {:error, any()}
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