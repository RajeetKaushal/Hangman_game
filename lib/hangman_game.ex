defmodule Hangman do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :Hangman_game)
  end

  def init() do
  end

  def show() do
    GenServer.call(:Hangman_game, {:display})
  end

  def handle_call({:display}, _from, state) do
    {:reply, state, state}
  end
end
