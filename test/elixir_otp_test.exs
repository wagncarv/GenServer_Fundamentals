defmodule ElixirOtpTest do
  use ExUnit.Case
  doctest ElixirOtp

  test "greets the world" do
    assert ElixirOtp.hello() == :world
  end
end
