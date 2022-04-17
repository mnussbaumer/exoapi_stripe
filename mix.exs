defmodule ExOAPI.Stripe.MixProject do
  use Mix.Project

  def project do
    [
      app: :exoapi_stripe,
      version: "0.1.1",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/mnussbaumer/exoapi_stripe",
      homepage_url: "https://hexdocs.pm/exoapi_stripe/readme.html",
      description:
        ~s(The Stripe REST API. Please see https://stripe.com/docs/api for more details.),
      package: [
        licenses: ["MIT"],
        exclude_patterns: [~r/.*~$/, ~r/#.*#$/],
        links: %{
          "github/readme" => "https://github.com/mnussbaumer/exoapi_stripe"
        }
      ],
      docs: [
        main: "ExOAPI.Stripe",
        extras: ["README.md"],
        nest_modules_by_prefix: [
          ExOAPI.Stripe.Schemas,
          ExOAPI.Stripe.SDK
        ]
      ]
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps do
    [
      {:ex_oapi, "~> 0.1.2"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end
end
