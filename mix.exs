defmodule MnesiaCrud.MixProject do
  use Mix.Project

  def project do
    [
      app: :mnesia_crud,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MnesiaCrud.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:amnesia, "~> 0.2.8"},
      { :elixir_uuid, "~> 1.2" }
    ]
  end
end
