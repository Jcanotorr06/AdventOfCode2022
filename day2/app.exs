{ :ok, input } = File.read("input.txt")


defmodule RockPaperSizors do

  # Rock = X, A
  # Paper = Y, B
  # Scissors = Z, C

  def play1(input) do
    values = %{:X => 1, :Y => 2, :Z => 3}
    results = %{:Win => 6, :Lose => 0, :Draw => 3}
    scores = String.split(input, "\n") |> Enum.map(fn round ->
        case round do
          "A X" -> results[:Draw] + values[:X]
          "A Y" -> results[:Win] + values[:Y]
          "A Z" -> results[:Lose] + values[:Z]
          "B X" -> results[:Lose] + values[:X]
          "B Y" -> results[:Draw] + values[:Y]
          "B Z" -> results[:Win] + values[:Z]
          "C X" -> results[:Win] + values[:X]
          "C Y" -> results[:Lose] + values[:Y]
          "C Z" -> results[:Draw] + values[:Z]
          _ -> 0
        end
    end)
    total = Enum.sum(scores)

    IO.puts("Total score: #{total}")
  end

  # Rock = A
  # Paper = B
  # Scissors = C
  # Loose = X
  # Draw = Y
  # Win = Z

  def play2(input) do
    values = %{:A => 1, :B => 2, :C => 3}
    results = %{:Win => 6, :Lose => 0, :Draw => 3}
    scores = String.split(input, "\n") |> Enum.map(fn round ->
        case round do
          "A X" -> results[:Lose] + values[:C]
          "A Y" -> results[:Draw] + values[:A]
          "A Z" -> results[:Win] + values[:B]
          "B X" -> results[:Lose] + values[:A]
          "B Y" -> results[:Draw] + values[:B]
          "B Z" -> results[:Win] + values[:C]
          "C X" -> results[:Lose] + values[:B]
          "C Y" -> results[:Draw] + values[:C]
          "C Z" -> results[:Win] + values[:A]
          _ -> 0
        end
    end)
    total = Enum.sum(scores)

    IO.puts("Total score: #{total}")
  end
end

RockPaperSizors.play2(input)
