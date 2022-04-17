defmodule ExOAPI.Stripe.SDK.Invoiceitems do
  @doc """
  **description**: <p>Creates an item to be added to a draft invoice (up to 250 items per invoice). If no invoice is specified, the item will be on the next invoice created for the customer specified.</p>

  """

  @spec post_invoiceitems(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :unit_amount_decimal => String.t(),
              :unit_amount => integer(),
              :tax_rates => [String.t()],
              :subscription => String.t(),
              :quantity => integer(),
              :price_data => %{
                :unit_amount_decimal => String.t(),
                :unit_amount => integer(),
                :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                :product => String.t(),
                :currency => String.t()
              },
              :price => String.t(),
              :period => %{:start => integer(), :end => integer()},
              :metadata => String.t() | map(),
              :invoice => String.t(),
              :expand => [String.t()],
              :discounts => String.t() | [%{:discount => String.t(), :coupon => String.t()}],
              :discountable => boolean(),
              :description => String.t(),
              :customer => String.t(),
              :currency => String.t(),
              :amount => integer()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoiceitems(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoiceitems")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of your invoice items. Invoice items are returned sorted by creation date, with the most recently created invoice items appearing first.</p>

  """
  @type get_invoiceitems_opts ::
          {:starting_after, String.t()}
          | {:pending, String.t()}
          | {:limit, String.t()}
          | {:invoice, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:customer, String.t()}
          | {:created, String.t()}
  @spec get_invoiceitems(client :: ExOAPI.Client.t(), list(get_invoiceitems_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_invoiceitems(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoiceitems")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:pending, "pending", "form", true},
      {:limit, "limit", "form", true},
      {:invoice, "invoice", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:customer, "customer", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Deletes an invoice item, removing it from an invoice. Deleting invoice items is only possible when they’re not attached to invoices, or if it’s attached to a draft invoice.</p>

  """

  @spec delete_invoiceitems_invoiceitem(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          invoiceitem :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def delete_invoiceitems_invoiceitem(%ExOAPI.Client{} = client, body, invoiceitem) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoiceitems/{invoiceitem}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoiceitem", invoiceitem)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the amount or description of an invoice item on an upcoming invoice. Updating an invoice item is only possible before the invoice it’s attached to is closed.</p>

  """

  @spec post_invoiceitems_invoiceitem(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :unit_amount_decimal => String.t(),
              :unit_amount => integer(),
              :tax_rates => String.t() | [String.t()],
              :quantity => integer(),
              :price_data => %{
                :unit_amount_decimal => String.t(),
                :unit_amount => integer(),
                :tax_behavior => String.t() | :exclusive | :inclusive | :unspecified,
                :product => String.t(),
                :currency => String.t()
              },
              :price => String.t(),
              :period => %{:start => integer(), :end => integer()},
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :discounts => String.t() | [%{:discount => String.t(), :coupon => String.t()}],
              :discountable => boolean(),
              :description => String.t(),
              :amount => integer()
            }
            | map(),
          invoiceitem :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_invoiceitems_invoiceitem(%ExOAPI.Client{} = client, body, invoiceitem) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoiceitems/{invoiceitem}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("invoiceitem", invoiceitem)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the invoice item with the given ID.</p>

  """
  @type get_invoiceitems_invoiceitem_opts :: {:expand, String.t()}
  @spec get_invoiceitems_invoiceitem(
          client :: ExOAPI.Client.t(),
          invoiceitem :: String.t(),
          list(get_invoiceitems_invoiceitem_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_invoiceitems_invoiceitem(%ExOAPI.Client{} = client, invoiceitem, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/invoiceitems/{invoiceitem}")
    |> ExOAPI.Client.replace_in_path("invoiceitem", invoiceitem)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end