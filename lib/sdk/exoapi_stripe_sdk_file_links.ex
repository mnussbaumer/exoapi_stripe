defmodule ExOAPI.Stripe.SDK.FileLinks do
  @doc """
  **description**: <p>Creates a new file link object.</p>

  """

  @spec post_file_links(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :file => String.t(),
              :expires_at => integer(),
              :expand => [String.t()]
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_file_links(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/file_links")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of file links.</p>

  """
  @type get_file_links_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:file, String.t()}
          | {:expired, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_file_links(client :: ExOAPI.Client.t(), list(get_file_links_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_file_links(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/file_links")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:file, "file", "form", true},
      {:expired, "expired", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates an existing file link object. Expired links can no longer be updated.</p>

  """

  @spec post_file_links_link(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :expires_at => String.t() | integer() | String.t() | :now,
              :expand => [String.t()]
            }
            | map(),
          link :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_file_links_link(%ExOAPI.Client{} = client, body, link) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/file_links/{link}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("link", link)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves the file link with the given ID.</p>

  """
  @type get_file_links_link_opts :: {:expand, String.t()}
  @spec get_file_links_link(
          client :: ExOAPI.Client.t(),
          link :: String.t(),
          list(get_file_links_link_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_file_links_link(%ExOAPI.Client{} = client, link, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/file_links/{link}")
    |> ExOAPI.Client.replace_in_path("link", link)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end