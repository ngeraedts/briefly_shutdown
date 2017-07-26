defmodule BrieflyTest.Mixfile do
  use Mix.Project

  def project do
    [app: :briefly_test,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {BrieflyTest, []}
    ]
  end

  defp deps do
    [
      {:briefly, "~> 0.3.0"},
      {:distillery, "~> 1.0"},
    ]
  end
end
