defmodule Hangman_game do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :Hangman_game)
  end

  def init(args) do
    {:ok, args}
  end

  def show() do
    GenServer.call(:Hangman_game, {:display})
  end

  def handle_cast({:display}, state) do
    {:noreply, state}
  end
end
