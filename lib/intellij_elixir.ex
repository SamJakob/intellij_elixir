defmodule IntellijElixir do

  use Application

  @spec start(Application.start_type(), []) :: {:ok, pid}
  def start(_type, _args) do
    children = [
      IntellijElixir.Quoter
    ]

    # Tuned based on intellij-elixir processing 1019 tests in 4 seconds, which is 254.75 tests per second.  Although
    # most tests are not expected to cause exits, just tuning to the test rate is less coupled than tuning to the
    # expected exit rate as expected exit is a new assertion for testing.
    {:ok, _pid} = Supervisor.start_link(children, max_restarts: 1000, max_seconds: 4, strategy: :one_for_one)
  end

end
