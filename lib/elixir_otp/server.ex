defmodule Server do
    use GenServer

    def init(arg \\ 0), do: {:ok, arg}
    def start_link(arg \\ 0) do
        IO.puts "Starting Server ..."
        GenServer.start_link(__MODULE__, arg, name: CalcServer)
    end

    def handle_cast({:sum, valor}, state), do: {:noreply, state + valor}

    def handle_cast({:mult, valor}, state), do: {:noreply, state * valor}

    def handle_cast({:sub, valor}, state), do: {:noreply, state - valor}

    def handle_cast({:div, valor}, state), do: {:noreply, state / valor}

    def handle_call(:result, _from, valor) do
        {:reply, valor, valor}
    end

end
