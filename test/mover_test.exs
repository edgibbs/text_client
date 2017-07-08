defmodule TextClient.MoverTest do
  use ExUnit.Case

  alias TextClient.{State, Mover}

  test "can make a move" do
    game = Hangman.new_game("word")
    game_state = %State{ game_service: game, tally: nil, guess: "w"}
    game_state = Mover.move(game_state)
    assert game_state.tally.game_state == :good_guess
  end
end
