defmodule TextClient do
  defdelegate start, to: TextClient.Interact
  defdelegate start(word), to: TextClient.Interact
end
