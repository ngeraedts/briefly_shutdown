defmodule BrieflyTest do
  use Application

  def start(_type, _args) do
    BrieflyTest.Supervisor.start_link()
  end
end

defmodule BrieflyTest.Supervisor do
  use Supervisor
  import Supervisor.Spec

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [worker(BrieflyTest.Worker, [])]
    supervise(children, strategy: :one_for_one)
  end
end

defmodule BrieflyTest.Worker do
  use GenServer

  require Logger

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, path} = Briefly.create
    Logger.debug "Created path: #{path}"
    {:ok, %{}}
  end
end
