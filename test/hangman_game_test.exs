defmodule HangmanGameTest do
  use ExUnit.Case
  doctest Hangman.Words

  test "letter found at two indexes" do
    assert Hangman.Words.check_word(["A", "P", "P", "L", "E"], ["*", "*", "*", "*", "*"], "P") ==
             {["A", "*", "*", "L", "E"], ["*", "P", "P", "*", "*"]}
  end

  test "letter is not in word" do
    assert Hangman.Words.check_word(["B", "A", "N", "K", "S"], ["*", "*", "*", "*", "*"], "P") ==
             {["B", "A", "N", "K", "S"], ["*", "*", "*", "*", "*"]}
  end

  test "one letter is present other is not" do
    assert Hangman.Words.check_word(["A", "P", "P", "L", "E"], ["*", "*", "P", "*", "*"], "P") ==
             {["A", "*", "*", "L", "E"], ["*", "P", "P", "*", "*"]}
  end

  test "All leters are same" do
    assert Hangman.Words.check_word(["A", "A", "A", "A", "A"], ["*", "*", "*", "*", "*"], "A") ==
             {["*", "*", "*", "*", "*"], ["A", "A", "A", "A", "A"]}
  end

  test "original word has one character" do
    assert Hangman.Words.check_word(["E"], ["*"], "E") == {["*"], ["E"]}
  end
end
