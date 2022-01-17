defmodule Calculadora do

    def sum(valor), do: GenServer.cast(CalcServer, {:sum, valor})
    def sub(valor), do: GenServer.cast(CalcServer, {:sub, valor})
    def mult(valor), do: GenServer.cast(CalcServer, {:mult, valor})
    def div(valor), do: GenServer.cast(CalcServer, {:div, valor})
    def result, do: GenServer.call(CalcServer, :result)
end
