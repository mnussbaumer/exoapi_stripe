defmodule ExOAPI.Stripe.SDK.Issuing do
  @doc """
  **description**: <p>Updates the specified Issuing <code>Authorization</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_authorizations_authorization(
          client :: ExOAPI.Client.t(),
          body :: map(),
          authorization :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_authorizations_authorization(%ExOAPI.Client{} = client, body, authorization) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Authorization</code> object.</p>

  """
  @type get_issuing_authorizations_authorization_opts :: {:expand, String.t()}
  @spec get_issuing_authorizations_authorization(
          client :: ExOAPI.Client.t(),
          authorization :: String.t(),
          list(get_issuing_authorizations_authorization_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_authorizations_authorization(
        %ExOAPI.Client{} = client,
        authorization,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}")
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Card</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_cards_card(client :: ExOAPI.Client.t(), body :: map(), card :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def post_issuing_cards_card(%ExOAPI.Client{} = client, body, card) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards/{card}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("card", card)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Card</code> object.</p>

  """
  @type get_issuing_cards_card_opts :: {:expand, String.t()}
  @spec get_issuing_cards_card(
          client :: ExOAPI.Client.t(),
          card :: String.t(),
          list(get_issuing_cards_card_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_cards_card(%ExOAPI.Client{} = client, card, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards/{card}")
    |> ExOAPI.Client.replace_in_path("card", card)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Settlement</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_settlements_settlement(
          client :: ExOAPI.Client.t(),
          body :: map(),
          settlement :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_settlements_settlement(%ExOAPI.Client{} = client, body, settlement) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/settlements/{settlement}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("settlement", settlement)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Settlement</code> object.</p>

  """
  @type get_issuing_settlements_settlement_opts :: {:expand, String.t()}
  @spec get_issuing_settlements_settlement(
          client :: ExOAPI.Client.t(),
          settlement :: String.t(),
          list(get_issuing_settlements_settlement_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_settlements_settlement(%ExOAPI.Client{} = client, settlement, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/settlements/{settlement}")
    |> ExOAPI.Client.replace_in_path("settlement", settlement)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Settlement</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_settlements_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_issuing_settlements(client :: ExOAPI.Client.t(), list(get_issuing_settlements_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_settlements(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/settlements")
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
  **description**: <p>Returns a list of Issuing <code>Transaction</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_transactions_opts ::
          {:type, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:cardholder, String.t()}
          | {:card, String.t()}
  @spec get_issuing_transactions(
          client :: ExOAPI.Client.t(),
          list(get_issuing_transactions_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_transactions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/transactions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:cardholder, "cardholder", "form", true},
      {:card, "card", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Authorization</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_authorizations_opts ::
          {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:cardholder, String.t()}
          | {:card, String.t()}
  @spec get_issuing_authorizations(
          client :: ExOAPI.Client.t(),
          list(get_issuing_authorizations_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_authorizations(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:cardholder, "cardholder", "form", true},
      {:card, "card", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates an Issuing <code>Dispute</code> object. Individual pieces of evidence within the <code>evidence</code> object are optional at this point. Stripe only validates that required evidence is present during submission. Refer to <a href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and evidence</a> for more details about evidence requirements.</p>

  """

  @spec post_issuing_disputes(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_issuing_disputes(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Dispute</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_disputes_opts ::
          {:transaction, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_issuing_disputes(client :: ExOAPI.Client.t(), list(get_issuing_disputes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_disputes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:transaction, "transaction", "form", true},
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
  **description**: <p>Updates the specified Issuing <code>Transaction</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_transactions_transaction(
          client :: ExOAPI.Client.t(),
          body :: map(),
          transaction :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_transactions_transaction(%ExOAPI.Client{} = client, body, transaction) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/transactions/{transaction}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("transaction", transaction)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Transaction</code> object.</p>

  """
  @type get_issuing_transactions_transaction_opts :: {:expand, String.t()}
  @spec get_issuing_transactions_transaction(
          client :: ExOAPI.Client.t(),
          transaction :: String.t(),
          list(get_issuing_transactions_transaction_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_transactions_transaction(%ExOAPI.Client{} = client, transaction, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/transactions/{transaction}")
    |> ExOAPI.Client.replace_in_path("transaction", transaction)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new Issuing <code>Cardholder</code> object that can be issued cards.</p>

  """

  @spec post_issuing_cardholders(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_issuing_cardholders(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Cardholder</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_cardholders_opts ::
          {:type, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:phone_number, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:email, String.t()}
          | {:created, String.t()}
  @spec get_issuing_cardholders(client :: ExOAPI.Client.t(), list(get_issuing_cardholders_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_cardholders(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:phone_number, "phone_number", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:email, "email", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Submits an Issuing <code>Dispute</code> to the card network. Stripe validates that all evidence fields required for the dispute’s reason are present. For more details, see <a href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and evidence</a>.</p>

  """

  @spec post_issuing_disputes_dispute_submit(
          client :: ExOAPI.Client.t(),
          body :: map(),
          dispute :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_disputes_dispute_submit(%ExOAPI.Client{} = client, body, dispute) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes/{dispute}/submit")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Dispute</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Properties on the <code>evidence</code> object can be unset by passing in an empty string.</p>

  """

  @spec post_issuing_disputes_dispute(
          client :: ExOAPI.Client.t(),
          body :: map(),
          dispute :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_disputes_dispute(%ExOAPI.Client{} = client, body, dispute) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes/{dispute}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Dispute</code> object.</p>

  """
  @type get_issuing_disputes_dispute_opts :: {:expand, String.t()}
  @spec get_issuing_disputes_dispute(
          client :: ExOAPI.Client.t(),
          dispute :: String.t(),
          list(get_issuing_disputes_dispute_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_disputes_dispute(%ExOAPI.Client{} = client, dispute, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes/{dispute}")
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Approves a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real-time authorization</a> flow.</p>

  """

  @spec post_issuing_authorizations_authorization_approve(
          client :: ExOAPI.Client.t(),
          body :: map(),
          authorization :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_authorizations_authorization_approve(
        %ExOAPI.Client{} = client,
        body,
        authorization
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}/approve")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Declines a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real time authorization</a> flow.</p>

  """

  @spec post_issuing_authorizations_authorization_decline(
          client :: ExOAPI.Client.t(),
          body :: map(),
          authorization :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_authorizations_authorization_decline(
        %ExOAPI.Client{} = client,
        body,
        authorization
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}/decline")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates an Issuing <code>Card</code> object.</p>

  """

  @spec post_issuing_cards(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_issuing_cards(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Card</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_cards_opts ::
          {:type, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:last4, String.t()}
          | {:expand, String.t()}
          | {:exp_year, String.t()}
          | {:exp_month, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:cardholder, String.t()}
  @spec get_issuing_cards(client :: ExOAPI.Client.t(), list(get_issuing_cards_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_cards(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:last4, "last4", "form", true},
      {:expand, "expand", "deepObject", true},
      {:exp_year, "exp_year", "form", true},
      {:exp_month, "exp_month", "form", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:cardholder, "cardholder", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Cardholder</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_cardholders_cardholder(
          client :: ExOAPI.Client.t(),
          body :: map(),
          cardholder :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_cardholders_cardholder(%ExOAPI.Client{} = client, body, cardholder) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders/{cardholder}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("cardholder", cardholder)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Cardholder</code> object.</p>

  """
  @type get_issuing_cardholders_cardholder_opts :: {:expand, String.t()}
  @spec get_issuing_cardholders_cardholder(
          client :: ExOAPI.Client.t(),
          cardholder :: String.t(),
          list(get_issuing_cardholders_cardholder_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_cardholders_cardholder(%ExOAPI.Client{} = client, cardholder, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders/{cardholder}")
    |> ExOAPI.Client.replace_in_path("cardholder", cardholder)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end