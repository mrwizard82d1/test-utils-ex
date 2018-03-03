defmodule TestUtils do
  def start do
    spawn(TestUtils, :loop, [])
  end

  def rand_digit() do
    :rand.uniform(10) - 1
  end

  def rand_digits(count) do
    :rand.uniform(trunc(:math.pow(10, count))) - 1
  end

  def rand_word() do
    File.stream("latin-words.md")
    File.open("latin-words.md", [:utf8], fn(word_file) ->
      IO.read(word_file, :line)
    end)
  end
end
