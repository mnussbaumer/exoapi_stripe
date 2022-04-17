defmodule ExOAPI.Stripe.SDK.Sigma do
  @doc """
  **description**: <p>Retrieves the details of an scheduled query run.</p>

  """
  @type get_sigma_scheduled_query_runs_scheduled_query_run_opts :: {:expand, String.t()}
  @spec get_sigma_scheduled_query_runs_scheduled_query_run(
          client :: ExOAPI.Client.t(),
          scheduled_query_run :: String.t(),
          list(get_sigma_scheduled_query_runs_scheduled_query_run_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t() | ExOAPI.Stripe.Schemas.ScheduledQueryRun.t() | map()}
          | {:error, any()}
  def get_sigma_scheduled_query_runs_scheduled_query_run(
        %ExOAPI.Client{} = client,
        scheduled_query_run,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sigma/scheduled_query_runs/{scheduled_query_run}")
    |> ExOAPI.Client.replace_in_path("scheduled_query_run", scheduled_query_run)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of scheduled query runs.</p>

  """
  @type get_sigma_scheduled_query_runs_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
  @spec get_sigma_scheduled_query_runs(
          client :: ExOAPI.Client.t(),
          list(get_sigma_scheduled_query_runs_opts())
        ) ::
          {:ok,
           ExOAPI.Stripe.Schemas.Error.t()
           | %{
               :url => String.t(),
               :object => String.t() | :list,
               :has_more => boolean(),
               :data => [ExOAPI.Stripe.Schemas.ScheduledQueryRun.t()]
             }
           | map()}
          | {:error, any()}
  def get_sigma_scheduled_query_runs(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/sigma/scheduled_query_runs")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true}
    ])
    |> ExOAPI.Client.request()
  end
end