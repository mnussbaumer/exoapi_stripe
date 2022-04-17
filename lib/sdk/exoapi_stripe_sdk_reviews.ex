defmodule ExOAPI.Stripe.SDK.Reviews do
  @doc """
  **description**: <p>Retrieves a <code>Review</code> object.</p>

  """
  @type get_reviews_review_opts :: {:expand, String.t()}
  @spec get_reviews_review(
          client :: ExOAPI.Client.t(),
          review :: String.t(),
          list(get_reviews_review_opts())
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Review.t() | map()}
          | {:error, any()}
  def get_reviews_review(%ExOAPI.Client{} = client, review, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reviews/{review}")
    |> ExOAPI.Client.replace_in_path("review", review)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of <code>Review</code> objects that have <code>open</code> set to <code>true</code>. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_reviews_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_reviews(client :: ExOAPI.Client.t(), list(get_reviews_opts())) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.Review.t()]
             }
           | map()}
          | {:error, any()}
  def get_reviews(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reviews")
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
  **description**: <p>Approves a <code>Review</code> object, closing it and removing it from the list of reviews.</p>

  """

  @spec post_reviews_review_approve(
          client :: ExOAPI.Client.t(),
          body :: %{:expand => [String.t()]} | map(),
          review :: String.t()
        ) ::
          {:ok, ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.Review.t() | map()}
          | {:error, any()}
  def post_reviews_review_approve(%ExOAPI.Client{} = client, body, review) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reviews/{review}/approve")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("review", review)
    |> ExOAPI.Client.request()
  end
end