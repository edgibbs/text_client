defmodule TextClient.InteractTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "can play a very simple game" do
    assert capture_io([input: "a"], fn -> TextClient.Interact.start("a") end) ==
    """

    Word so far: _
    Guess left: 7
    Letters used: 

    Your guess: You WON!
    EXIT
    """
  end
end
