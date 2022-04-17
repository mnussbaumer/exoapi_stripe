defmodule ExOAPI.Stripe.SDK.Disputes do
  @doc """
  **description**: <p>Returns a list of your disputes.</p>

  """
  @type get_disputes_opts ::
          {:starting_after, String.t()}
          | {:payment_intent, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:charge, String.t()}
  @spec get_disputes(client :: ExOAPI.Client.t(), list(get_disputes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_disputes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/disputes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:payment_intent, "payment_intent", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:charge, "charge", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Closing the dispute for a charge indicates that you do not have any evidence to submit and are essentially dismissing the dispute, acknowledging it as lost.</p>

  <p>The status of the dispute will change from <code>needs_response</code> to <code>lost</code>. <em>Closing a dispute is irreversible</em>.</p>

  """

  @spec post_disputes_dispute_close(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          dispute :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_disputes_dispute_close(%ExOAPI.Client{} = client, body, dispute) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/disputes/{dispute}/close")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>When you get a dispute, contacting your customer is always the best first step. If that doesn’t work, you can submit evidence to help us resolve the dispute in your favor. You can do this in your <a href="https://dashboard.stripe.com/disputes">dashboard</a>, but if you prefer, you can use the API to submit evidence programmatically.</p>

  <p>Depending on your dispute type, different evidence fields will give you a better chance of winning your dispute. To figure out which evidence fields to provide, see our <a href="/docs/disputes/categories">guide to dispute types</a>.</p>

  """

  @spec post_disputes_dispute(
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
          dispute :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_disputes_dispute(%ExOAPI.Client{} = client, body, dispute) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/disputes/{dispute}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the dispute with the given ID.</p>

  """
  @type get_disputes_dispute_opts :: {:expand, String.t()}
  @spec get_disputes_dispute(
          client :: ExOAPI.Client.t(),
          dispute :: String.t(),
          list(get_disputes_dispute_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_disputes_dispute(%ExOAPI.Client{} = client, dispute, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/disputes/{dispute}")
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end