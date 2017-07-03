defmodule TextClient.SummaryTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias TextClient.{Summary, State}

  test "displays the text client" do
    assert capture_io(fn -> Summary.display(%State{ tally: %{ letters: ["a","b"], turns_left: 7}, game_service: nil, guess: "" }) end) ==
      """

      Word so far: a b
      Guess left: 7

      """
  end

  test "returns the game" do
    capture_io(fn ->
      game = Summary.display(%State{ tally: %{ letters: ["a","b"], turns_left: 7}, game_service: nil, guess: "" })
      assert game == %State{ tally: %{ letters: ["a","b"], turns_left: 7}, game_service: nil, guess: "" }
    end)
  end
end
