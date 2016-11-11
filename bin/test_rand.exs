defmodule TestUtils do
  def start do
    spawn(TestUtils, :loop, [])
  end

  def rand_digit(server) do
    send server, {self(), :digit}
  end

  def await_digit() do
    receive do
      {:ok, digit} -> digit
    after 500 -> IO.puts "Impatient"
    end
  end

  def loop do
    receive do
        {requester, :digit} ->
          IO.puts "Wranglin' a digit"
          send requester, {:ok, :rand.uniform(10) - 1}
        message -> 
          IO.puts(message)
    end 
    loop
  end
end

