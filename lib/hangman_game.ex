defmodule Hangman_game do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :Hangman_game)
  end

  def init([]) do
    {:ok, []}
  end

  def start() do
    GenServer.cast(:Hangman_game, {:start})
  end

  def handle_cast({:start}, state) do
    Hangman.Words.take_word()
    {:noreply, state}
  end
end
