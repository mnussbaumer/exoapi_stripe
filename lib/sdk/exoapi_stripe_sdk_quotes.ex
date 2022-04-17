defmodule ExOAPI.Stripe.SDK.Quotes do
  @doc """
  **description**: <p>Accepts the specified quote.</p>

  """

  @spec post_quotes_quote_accept(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          quote :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_quotes_quote_accept(%ExOAPI.Client{} = client, body, quote) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}/accept")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A quote models prices and services for a customer.</p>

  """

  @spec post_quotes_quote(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data =>
                String.t()
                | %{:destination => String.t(), :amount_percent => number(), :amount => integer()},
              :subscription_data => %{
                :trial_period_days => String.t() | integer(),
                :effective_date => String.t() | integer() | String.t() | :current_period_end
              },
              :on_behalf_of => String.t(),
              :metadata => map(),
              :line_items => [
                %{
                  :tax_rates => String.t() | [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :recurring => %{
                      :interval_count => integer(),
                      :interval => String.t() | :day | :month | :week | :year
                    },
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t(),
                  :id => String.t()
                }
              ],
              :invoice_settings => %{:days_until_due => integer()},
              :header => String.t(),
              :footer => String.t(),
              :expires_at => integer(),
              :expand => [String.t()],
              :discounts => String.t() | [%{:discount => String.t(), :coupon => String.t()}],
              :description => String.t(),
              :default_tax_rates => String.t() | [String.t()],
              :customer => String.t(),
              :collection_method => String.t() | :charge_automatically | :send_invoice,
              :automatic_tax => %{:enabled => boolean()},
              :application_fee_percent => String.t() | number(),
              :application_fee_amount => String.t() | integer()
            }
            | map(),
          quote :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_quotes_quote(%ExOAPI.Client{} = client, body, quote) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the quote with the given ID.</p>

  """
  @type get_quotes_quote_opts :: {:expand, String.t()}
  @spec get_quotes_quote(
          client :: ExOAPI.Client.t(),
          quote :: String.t(),
          list(get_quotes_quote_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_quotes_quote(%ExOAPI.Client{} = client, quote, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}")
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Download the PDF for a finalized quote</p>

  """
  @type get_quotes_quote_pdf_opts :: {:expand, String.t()}
  @spec get_quotes_quote_pdf(
          client :: ExOAPI.Client.t(),
          quote :: String.t(),
          list(get_quotes_quote_pdf_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_quotes_quote_pdf(%ExOAPI.Client{} = client, quote, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}/pdf")
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving a quote, there is an includable <a href="https://stripe.com/docs/api/quotes/object#quote_object-computed-upfront-line_items"><strong>computed.upfront.line_items</strong></a> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of upfront line items.</p>

  """
  @type get_quotes_quote_computed_upfront_line_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_quotes_quote_computed_upfront_line_items(
          client :: ExOAPI.Client.t(),
          quote :: String.t(),
          list(get_quotes_quote_computed_upfront_line_items_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_quotes_quote_computed_upfront_line_items(%ExOAPI.Client{} = client, quote, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}/computed_upfront_line_items")
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Cancels the quote.</p>

  """

  @spec post_quotes_quote_cancel(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          quote :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_quotes_quote_cancel(%ExOAPI.Client{} = client, body, quote) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}/cancel")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>A quote models prices and services for a customer. Default options for <code>header</code>, <code>description</code>, <code>footer</code>, and <code>expires_at</code> can be set in the dashboard via the <a href="https://dashboard.stripe.com/settings/billing/quote">quote template</a>.</p>

  """

  @spec post_quotes(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transfer_data =>
                String.t()
                | %{:destination => String.t(), :amount_percent => number(), :amount => integer()},
              :test_clock => String.t(),
              :subscription_data => %{
                :trial_period_days => String.t() | integer(),
                :effective_date => String.t() | integer() | String.t() | :current_period_end
              },
              :on_behalf_of => String.t(),
              :metadata => map(),
              :line_items => [
                %{
                  :tax_rates => String.t() | [String.t()],
                  :quantity => integer(),
                  :price_data => %{
                    :unit_amount_decimal => String.t(),
                    :unit_amount => integer(),
                    :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                    :recurring => %{
                      :interval_count => integer(),
                      :interval => String.t() | :day | :month | :week | :year
                    },
                    :product => String.t(),
                    :currency => String.t()
                  },
                  :price => String.t()
                }
              ],
              :invoice_settings => %{:days_until_due => integer()},
              :header => String.t(),
              :from_quote => %{:quote => String.t(), :is_revision => boolean()},
              :footer => String.t(),
              :expires_at => integer(),
              :expand => [String.t()],
              :discounts => String.t() | [%{:discount => String.t(), :coupon => String.t()}],
              :description => String.t(),
              :default_tax_rates => String.t() | [String.t()],
              :customer => String.t(),
              :collection_method => String.t() | :charge_automatically | :send_invoice,
              :automatic_tax => %{:enabled => boolean()},
              :application_fee_percent => String.t() | number(),
              :application_fee_amount => String.t() | integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_quotes(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your quotes.</p>

  """
  @type get_quotes_opts ::
          {:test_clock, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
  @spec get_quotes(client :: ExOAPI.Client.t(), list(get_quotes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_quotes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:test_clock, "test_clock", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When retrieving a quote, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>

  """
  @type get_quotes_quote_line_items_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_quotes_quote_line_items(
          client :: ExOAPI.Client.t(),
          quote :: String.t(),
          list(get_quotes_quote_line_items_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_quotes_quote_line_items(%ExOAPI.Client{} = client, quote, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}/line_items")
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Finalizes the quote.</p>

  """

  @spec post_quotes_quote_finalize(
          client :: ExOAPI.Client.t(),
          body :: %{:expires_at => integer(), :expand => [String.t()]} | map(),
          quote :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_quotes_quote_finalize(%ExOAPI.Client{} = client, body, quote) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/quotes/{quote}/finalize")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("quote", quote)
    |> ExOAPI.Client.request()
  end
end