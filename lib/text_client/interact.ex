defmodule TextClient.Interact do

  alias TextClient.{State, Player}

  def start() do
    Hangman.new_game()
    |> setup_state()
    |> Player.play()
  end

  def start(word) do
    Hangman.new_game(word)
    |> setup_state()
    |> Player.play()
  end

  def play(state) do
    play(state)
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game),
    }
  end
end
