defmodule ExOAPI.Stripe.SDK.Charges do
  @doc """
  **description**: <p>Create a refund.</p>

  """

  @spec post_charges_charge_refunds(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :reverse_transfer => boolean(),
              :refund_application_fee => boolean(),
              :reason => String.t() | :duplicate | :fraudulent | :requested_by_customer,
              :payment_intent => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :amount => integer()
            }
            | map(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge_refunds(%ExOAPI.Client{} = client, body, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/refunds")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>You can see a list of the refunds belonging to a specific charge. Note that the 10 most recent refunds are always available by default on the charge object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.</p>

  """
  @type get_charges_charge_refunds_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_charges_charge_refunds(
          client :: ExOAPI.Client.t(),
          charge :: String.t(),
          list(get_charges_charge_refunds_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_charges_charge_refunds(%ExOAPI.Client{} = client, charge, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/refunds")
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you <a href="#create_charge">created a charge</a> with the capture option set to false.</p>

  <p>Uncaptured payments expire a set number of days after they are created (<a href="/docs/charges/placing-a-hold">7 by default</a>). If they are not captured by that point in time, they will be marked as refunded and will no longer be capturable.</p>

  """

  @spec post_charges_charge_capture(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_group => String.t(),
              :transfer_data => %{:amount => integer()},
              :statement_descriptor_suffix => String.t(),
              :statement_descriptor => String.t(),
              :receipt_email => String.t(),
              :expand => [String.t()],
              :application_fee_amount => integer(),
              :application_fee => integer(),
              :amount => integer()
            }
            | map(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge_capture(%ExOAPI.Client{} = client, body, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/capture")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @spec post_charges_charge_dispute_close(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge_dispute_close(%ExOAPI.Client{} = client, body, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/dispute/close")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When you create a new refund, you must specify a Charge or a PaymentIntent object on which to create it.</p>

  <p>Creating a new refund will refund a charge that has previously been created but not yet refunded.
  Funds will be refunded to the credit or debit card that was originally charged.</p>

  <p>You can optionally refund only part of a charge.
  You can do so multiple times, until the entire charge has been refunded.</p>

  <p>Once entirely refunded, a charge can’t be refunded again.
  This method will raise an error when called on an already-refunded charge,
  or when trying to refund more money than is left on a charge.</p>

  """

  @spec post_charges_charge_refund(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :reverse_transfer => boolean(),
              :refund_application_fee => boolean(),
              :reason => String.t() | :duplicate | :fraudulent | :requested_by_customer,
              :payment_intent => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :amount => integer()
            }
            | map(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge_refund(%ExOAPI.Client{} = client, body, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/refund")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Update a specified refund.</p>

  """

  @spec post_charges_charge_refunds_refund(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          refund :: String.t(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge_refunds_refund(%ExOAPI.Client{} = client, body, refund, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/refunds/{refund}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("refund", refund)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of an existing refund.</p>

  """
  @type get_charges_charge_refunds_refund_opts :: {:expand, String.t()}
  @spec get_charges_charge_refunds_refund(
          client :: ExOAPI.Client.t(),
          refund :: String.t(),
          charge :: String.t(),
          list(get_charges_charge_refunds_refund_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_charges_charge_refunds_refund(%ExOAPI.Client{} = client, refund, charge, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/refunds/{refund}")
    |> ExOAPI.Client.replace_in_path("refund", refund)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>To charge a credit card or other payment source, you create a <code>Charge</code> object. If your API key is in test mode, the supplied payment source (e.g., card) won’t actually be charged, although everything else will occur as if in live mode. (Stripe assumes that the charge would have completed successfully).</p>

  """

  @spec post_charges(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_group => String.t(),
              :transfer_data => %{:destination => String.t(), :amount => integer()},
              :statement_descriptor_suffix => String.t(),
              :statement_descriptor => String.t(),
              :source => String.t(),
              :shipping => %{
                :tracking_number => String.t(),
                :phone => String.t(),
                :name => String.t(),
                :carrier => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :receipt_email => String.t(),
              :on_behalf_of => String.t(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :destination => String.t() | %{:amount => integer(), :account => String.t()},
              :description => String.t(),
              :customer => String.t(),
              :currency => String.t(),
              :card =>
                String.t()
                | %{
                    :object => String.t() | :card,
                    :number => String.t(),
                    :name => String.t(),
                    :metadata => map(),
                    :exp_year => integer(),
                    :exp_month => integer(),
                    :cvc => String.t(),
                    :address_zip => String.t(),
                    :address_state => String.t(),
                    :address_line2 => String.t(),
                    :address_line1 => String.t(),
                    :address_country => String.t(),
                    :address_city => String.t()
                  },
              :capture => boolean(),
              :application_fee_amount => integer(),
              :application_fee => integer(),
              :amount => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.</p>

  """
  @type get_charges_opts ::
          {:transfer_group, String.t()}
          | {:starting_after, String.t()}
          | {:payment_intent, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
  @spec get_charges(client :: ExOAPI.Client.t(), list(get_charges_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_charges(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:transfer_group, "transfer_group", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:payment_intent, "payment_intent", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_charges_charge(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_group => String.t(),
              :shipping => %{
                :tracking_number => String.t(),
                :phone => String.t(),
                :name => String.t(),
                :carrier => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :receipt_email => String.t(),
              :metadata => String.t() | map(),
              :fraud_details => %{:user_report => String.t() | :fraudulent | :safe},
              :expand => [String.t()],
              :description => String.t(),
              :customer => String.t()
            }
            | map(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge(%ExOAPI.Client{} = client, body, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.</p>

  """
  @type get_charges_charge_opts :: {:expand, String.t()}
  @spec get_charges_charge(
          client :: ExOAPI.Client.t(),
          charge :: String.t(),
          list(get_charges_charge_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_charges_charge(%ExOAPI.Client{} = client, charge, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}")
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Search for charges you’ve previously created using Stripe’s <a href="/docs/search#search-query-language">Search Query Language</a>.
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.</p>

  """
  @type get_charges_search_opts ::
          {:page, String.t()} | {:limit, String.t()} | {:expand, String.t()}
  @spec get_charges_search(
          client :: ExOAPI.Client.t(),
          query :: String.t(),
          list(get_charges_search_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_charges_search(%ExOAPI.Client{} = client, query, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/search")
    |> ExOAPI.Client.add_query("query", query)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:page, "page", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @spec post_charges_charge_dispute(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :submit => boolean(),
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :evidence => %{
                :uncategorized_text => String.t(),
                :uncategorized_file => String.t(),
                :shipping_tracking_number => String.t(),
                :shipping_documentation => String.t(),
                :shipping_date => String.t(),
                :shipping_carrier => String.t(),
                :shipping_address => String.t(),
                :service_documentation => String.t(),
                :service_date => String.t(),
                :refund_refusal_explanation => String.t(),
                :refund_policy_disclosure => String.t(),
                :refund_policy => String.t(),
                :receipt => String.t(),
                :product_description => String.t(),
                :duplicate_charge_id => String.t(),
                :duplicate_charge_explanation => String.t(),
                :duplicate_charge_documentation => String.t(),
                :customer_signature => String.t(),
                :customer_purchase_ip => String.t(),
                :customer_name => String.t(),
                :customer_email_address => String.t(),
                :customer_communication => String.t(),
                :cancellation_rebuttal => String.t(),
                :cancellation_policy_disclosure => String.t(),
                :cancellation_policy => String.t(),
                :billing_address => String.t(),
                :access_activity_log => String.t()
              }
            }
            | map(),
          charge :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_charges_charge_dispute(%ExOAPI.Client{} = client, body, charge) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/dispute")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve a dispute for a specified charge.</p>

  """
  @type get_charges_charge_dispute_opts :: {:expand, String.t()}
  @spec get_charges_charge_dispute(
          client :: ExOAPI.Client.t(),
          charge :: String.t(),
          list(get_charges_charge_dispute_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_charges_charge_dispute(%ExOAPI.Client{} = client, charge, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/charges/{charge}/dispute")
    |> ExOAPI.Client.replace_in_path("charge", charge)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end