defmodule ExOAPI.Stripe.SDK.Reporting do
  @doc """
  **description**: <p>Retrieves the details of a Report Type. (Certain report types require a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

  """
  @type get_reporting_report_types_report_type_opts :: {:expand, String.t()}
  @spec get_reporting_report_types_report_type(
          client :: ExOAPI.Client.t(),
          report_type :: String.t(),
          list(get_reporting_report_types_report_type_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_reporting_report_types_report_type(%ExOAPI.Client{} = client, report_type, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reporting/report_types/{report_type}")
    |> ExOAPI.Client.replace_in_path("report_type", report_type)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a full list of Report Types.</p>

  """
  @type get_reporting_report_types_opts :: {:expand, String.t()}
  @spec get_reporting_report_types(
          client :: ExOAPI.Client.t(),
          list(get_reporting_report_types_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_reporting_report_types(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reporting/report_types")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new object and begin running the report. (Certain report types require a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)</p>

  """

  @spec post_reporting_report_runs(client :: ExOAPI.Client.t(), body :: map()) ::
          {:ok, any()} | {:error, any()}
  def post_reporting_report_runs(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reporting/report_runs")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Report Runs, with the most recent appearing first.</p>

  """
  @type get_reporting_report_runs_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_reporting_report_runs(
          client :: ExOAPI.Client.t(),
          list(get_reporting_report_runs_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_reporting_report_runs(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reporting/report_runs")
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
  **description**: <p>Retrieves the details of an existing Report Run.</p>

  """
  @type get_reporting_report_runs_report_run_opts :: {:expand, String.t()}
  @spec get_reporting_report_runs_report_run(
          client :: ExOAPI.Client.t(),
          report_run :: String.t(),
          list(get_reporting_report_runs_report_run_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_reporting_report_runs_report_run(%ExOAPI.Client{} = client, report_run, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/reporting/report_runs/{report_run}")
    |> ExOAPI.Client.replace_in_path("report_run", report_run)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end