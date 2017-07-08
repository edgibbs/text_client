defmodule TextClientTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "can play a real hangman game" do
    assert capture_io([input: "o\nh\n"], fn -> TextClient.start("oh") end) ==
    """

    Word so far: _ _
    Guess left: 7
    Letters used: 

    Your guess: Good guess!

    Word so far: o _
    Guess left: 7
    Letters used: o

    Your guess: You WON!
    EXIT
    """
  end

  test "can lose a real hangman game" do
    assert capture_io([input: "a\na\nb\nd\nf\ng\ni\nj\n"], fn -> TextClient.start("tech") end) ==
    """

    Word so far: _ _ _ _
    Guess left: 7
    Letters used: 

    Your guess: Sorry, that isn't in this word

    Word so far: _ _ _ _
    Guess left: 6
    Letters used: a

    Your guess: You've already used that letter

    Word so far: _ _ _ _
    Guess left: 6
    Letters used: a

    Your guess: Sorry, that isn't in this word

    Word so far: _ _ _ _
    Guess left: 5
    Letters used: a b

    Your guess: Sorry, that isn't in this word

    Word so far: _ _ _ _
    Guess left: 4
    Letters used: a b d

    Your guess: Sorry, that isn't in this word

    Word so far: _ _ _ _
    Guess left: 3
    Letters used: a b d f

    Your guess: Sorry, that isn't in this word

    Word so far: _ _ _ _
    Guess left: 2
    Letters used: a b d f g

    Your guess: Sorry, that isn't in this word

    Word so far: _ _ _ _
    Guess left: 1
    Letters used: a b d f g i

    Your guess: Sorry, you lost
    EXIT
    """
  end

end
