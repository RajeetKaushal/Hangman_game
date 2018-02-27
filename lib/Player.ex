defmodule Hangman.Player do
  def left(chance, guess_list) do
    IO.puts(drawing(chance))
    IO.puts("#/{guess_list}")
  end

  def left(0, guess_list, originalw_list) do
    IO.puts(drawing(0))

    correct =
      Enum.map(0..(length(guess_list) - 1), fn x ->
        if Enum.at(guess_list, x) == "*",
          do: Enum.at(originalw_list, x),
          else: Enum.at(guess_list, x)
      end)

    IO.puts("GAME OVER!!")
    IO.puts("Actual word: #{correct}")
  end

  defp drawing(0) do
    """
    HANGMAN   :(
       ____
      |    |
      |    ⊗
      |   /|\\
      |    |
     _|_  / \\
    | * |______
    |__________|
    """
  end

  defp drawing(1) do
    """
    HANGMAN: Moves left 1
       ____
      |    |
      |    ⃝
      |   /|\\
      |    |
     _|_
    |   |______
    |__________|
    """
  end

  defp drawing(2) do
    """
    HANGMAN: Moves left 2
       ____
      |    |
      |    ⃝
      |    |
      |    |
     _|_
    |   |______
    |__________|
    """
  end

  defp drawing(3) do
    """
    HANGMAN: Moves left 3
       ____
      |    |
      |    ⃝
      |    |
      |
     _|_
    |   |______
    |__________|
    """
  end

  defp drawing(4) do
    """
    HANGMAN: Moves left 4
       ____
      |    |
      |    ⃝
      |
      |
     _|_
    |   |______
    |__________|
    """
  end

  defp drawing(5) do
    """
    HANGMAN: Moves left 5
       ____
      |    |
      |
      |
      |
     _|_
    |   |______
    |__________|
    """
  end

  defp drawing(6) do
    """
    HANGMAN: Moves left 6
       ____
      |
      |
      |
      |
     _|_
    |   |______
    |__________|
    """
  end
end
