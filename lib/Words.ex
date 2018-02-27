defmodule Words do
  @hangman_words_filepath "../data/test.txt"

  def take_word() do
    {:ok, allwords} = File.read(@hangman_words_filepath)

    allwords
    |> String.split()
    |> Enum.random()
    |> game_play()

    # {String.length(word), word}
  end

  def match_guess(word, guess) do
    Regex.scan(~r/#{letter}/, word, return: :index)
  end

  def game_play(word) do
    guess = IO.gets("ENTER A CHARACTER: ")
    word |> String.codepoints() |> Enum.map(fn _x -> "*" end) |> Enum.join() |> IO.inspect()
    match_guess(word, guess)
  end
end

Words.take_word()
