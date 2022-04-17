defmodule ExOAPI.Stripe.SDK.TestHelpers do
  @doc """
  **description**: <p>Creates a new test clock that can be attached to new customers and quotes.</p>

  """

  @spec post_test_helpers_test_clocks(
          client :: ExOAPI.Client.t(),
          body ::
            %{:name => String.t(), :frozen_time => integer(), :expand => [String.t()]} | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.TestHelpers_testClock.t()
           | map()}
          | {:error, any()}
  def post_test_helpers_test_clocks(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/test_helpers/test_clocks")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your test clocks.</p>

  """
  @type get_test_helpers_test_clocks_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_test_helpers_test_clocks(
          client :: ExOAPI.Client.t(),
          list(get_test_helpers_test_clocks_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.TestHelpers_testClock.t()]
             }
           | map()}
          | {:error, any()}
  def get_test_helpers_test_clocks(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/test_helpers/test_clocks")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes a test clock.</p>

  """

  @spec delete_test_helpers_test_clocks_test_clock(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          test_clock :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedTestHelpers_testClock.t()
           | map()}
          | {:error, any()}
  def delete_test_helpers_test_clocks_test_clock(%ExOAPI.Client{} = client, body, test_clock) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/test_helpers/test_clocks/{test_clock}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("test_clock", test_clock)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves a test clock.</p>

  """
  @type get_test_helpers_test_clocks_test_clock_opts :: {:expand, String.t()}
  @spec get_test_helpers_test_clocks_test_clock(
          client :: ExOAPI.Client.t(),
          test_clock :: String.t(),
          list(get_test_helpers_test_clocks_test_clock_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.TestHelpers_testClock.t()
           | map()}
          | {:error, any()}
  def get_test_helpers_test_clocks_test_clock(%ExOAPI.Client{} = client, test_clock, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/test_helpers/test_clocks/{test_clock}")
    |> ExOAPI.Client.replace_in_path("test_clock", test_clock)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Presents a payment method on a simulated reader. Can be used to simulate accepting a payment, saving a card or refunding a transaction.</p>

  """

  @spec post_test_helpers_terminal_readers_reader_present_payment_method(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :type => String.t() | :card_present,
              :expand => [String.t()],
              :card_present => %{:number => String.t()}
            }
            | map(),
          reader :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Terminal_reader.t() | map()}
          | {:error, any()}
  def post_test_helpers_terminal_readers_reader_present_payment_method(
        %ExOAPI.Client{} = client,
        body,
        reader
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/test_helpers/terminal/readers/{reader}/present_payment_method")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("reader", reader)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Starts advancing a test clock to a specified time in the future. Advancement is done when status changes to <code>Ready</code>.</p>

  """

  @spec post_test_helpers_test_clocks_test_clock_advance(
          client :: ExOAPI.Client.t(),
          body :: %{:frozen_time => integer(), :expand => [String.t()]} | map(),
          test_clock :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.TestHelpers_testClock.t()
           | map()}
          | {:error, any()}
  def post_test_helpers_test_clocks_test_clock_advance(
        %ExOAPI.Client{} = client,
        body,
        test_clock
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/test_helpers/test_clocks/{test_clock}/advance")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("test_clock", test_clock)
    |> ExOAPI.Client.request()
  end
end