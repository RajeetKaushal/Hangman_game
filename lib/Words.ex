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

  def check_word(originalw_list, guess_list, guess) do
    index =
      originalw_list
      |> Enum.find_index(fn x -> x == guess end)

    if index do
      guess_list = update_guess_list(originalw_list, guess_list, index)

      change_originalw_list(originalw_list, index)
      |> check_word(guess_list, guess)
    else
      {originalw_list, guess_list}
    end
  end

  def update_guess_list(originalw_list, guess_list, index) do
    len = length(guess_list)

    Enum.map(0..(len - 1), fn x ->
      if x != index, do: Enum.at(guess_list, x), else: Enum.at(originalw_list, x)
    end)
  end

  def change_originalw_list(originalw_list, index) do
    len = length(originalw_list)
    Enum.map(0..(len - 1), fn x -> if x == index, do: "*", else: Enum.at(originalw_list, x) end)
  end

  def guess_word(), do: IO.gets("ENTER A CHARACTER: ") |> String.trim()

  def match_guess(originalw_list, guess_list, chance) do
    guess = guess_word()

    if guess in originalw_list do
      check_word(originalw_list, guess_list, guess) |> next_chance(chance)
    else
      next_chance({originalw_list, guess_list}, chance - 1)
    end
  end

  def next_chance({originalw_list, guess_list}, 0) do
    # show(0, originalw_list, guess_list)
  end

  def next_chance({originalw_list, guess_list}, chance) do
    if(
      "*" in guess_list,
      do: match_guess(originalw_list, guess_list, chance),
      else: IO.puts("#{guess_list}")
    )
  end

  def game_play(word) do
    originalw_list = String.graphemes(word)

    guess_list = word |> String.graphemes() |> Enum.map(fn _x -> "*" end) |> IO.inspect()

    match_guess(originalw_list, guess_list, 6)
  end
end

Words.take_word()
