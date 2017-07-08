defmodule TestClient.Prompter do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO

  alias TextClient.{Prompter, State}

  test "can handle appropriate input and update guess" do
    capture_io("a", fn ->
      game = Prompter.accept_move(%State{ guess: ""})
      assert game.guess == "a"
    end)
  end

  test "exits when you give up" do
      assert capture_io(fn -> Prompter.accept_move(%State{ tally: %{ letters: ["a","b"], turns_left: 7}, game_service: nil, guess: "" }) end) ==
      """
      Your guess: Looks like you gave up...
      EXIT
      """
  end

end
