defmodule FireguardUmbrella.MixProject do
  @moduledoc """
  Welcome to the FireGuard Elixir Umbrella Project
  """

  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        cf_http: [
          applications: [cf_http: :permanent],
          include_executables_for: [:unix],
          cookie: System.get_env("ERL_COOKIE")
        ],
        cf_wall: [
          applications: [cf_wall: :permanent],
          include_executables_for: [:unix],
          cookie: System.get_env("ERL_COOKIE")
        ]
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
