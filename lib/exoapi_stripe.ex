defmodule ExOAPI.Stripe do
  @moduledoc """
  The SDK for ExOAPI.Stripe.
  Endpoint modules and the schemas generated from the OpenAPI spec can be found under
  the `./sdk` directory.

  One usecase for this module is to wrap the SDK Client struct instantiation, 
  for instance, setting base url for the API calls, adding authorization headers, 
  middleware, default parameters, etc, and returning the prepared `ExOAPI.Client.t()`
  struct to the caller so they can use it in subsequent calls.
  """

  @doc """
  Sample function for returning a properly usable client.
  """
  @spec new(String.t() | nil, String.t()) :: ExOAPI.Client.t()
  def new(api_base_url \\ nil, auth_bearer_key) do
    %ExOAPI.Client{}
    |> ExOAPI.Client.add_base_url(api_base_url)
    |> ExOAPI.Client.add_header("Authorization", "Basic #{Base.encode64(auth_bearer_key)}")
  end
end
