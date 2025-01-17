defmodule Hangman.Application do
  use Application

  def start(_type, _args) do
    children = [
      %{
        id: Hangman.Server,
        start: {Hangman.Server, :start_link, []}
      }
    ]

    options = [
      name: Hangman.Supervisor,
      strategy: :simple_one_for_one
    ]

    Supervisor.start_link(children, options)
  end
end
