defmodule ExOAPI.Stripe.SDK.ApplePay do
  @doc """
  **description**: <p>Create an apple pay domain.</p>

  """

  @spec post_apple_pay_domains(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()], :domain_name => String.t()} | map()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ApplePayDomain.t() | map()}
          | {:error, any()}
  def post_apple_pay_domains(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/apple_pay/domains")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>List apple pay domains.</p>

  """
  @type get_apple_pay_domains_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:domain_name, String.t()}
  @spec get_apple_pay_domains(client :: ExOAPI.Client.t(), list(get_apple_pay_domains_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.ApplePayDomain.t()]
             }
           | map()}
          | {:error, any()}
  def get_apple_pay_domains(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/apple_pay/domains")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:domain_name, "domain_name", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Delete an apple pay domain.</p>

  """

  @spec delete_apple_pay_domains_domain(
          client :: ExOAPI.Client.t(),
          body :: %{} | map(),
          domain :: String.t()
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | ExOAPI.Stripe.Schemas.DeletedApplePayDomain.t()
           | map()}
          | {:error, any()}
  def delete_apple_pay_domains_domain(%ExOAPI.Client{} = client, body, domain) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:delete)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/apple_pay/domains/{domain}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("domain", domain)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieve an apple pay domain.</p>

  """
  @type get_apple_pay_domains_domain_opts :: {:expand, String.t()}
  @spec get_apple_pay_domains_domain(
          client :: ExOAPI.Client.t(),
          domain :: String.t(),
          list(get_apple_pay_domains_domain_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ApplePayDomain.t() | map()}
          | {:error, any()}
  def get_apple_pay_domains_domain(%ExOAPI.Client{} = client, domain, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/apple_pay/domains/{domain}")
    |> ExOAPI.Client.replace_in_path("domain", domain)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end