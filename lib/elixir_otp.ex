defmodule ElixirOtp do
  def start, do: spawn(fn -> loop(:rand.uniform(1000)) end)

  def loop(conn) do
    receive do
      {:executa, pid, query} ->
        resultado = executa_query(conn, query)
        send(pid, {:resultado, resultado})
    end

    loop(conn)
  end

  def async_executa_query(server_pid, query), do: send(server_pid, {:executa, self(), query})

  def resultado do
    receive do
      {:resultado, resultado} ->
        resultado
    after
      5000 -> "Problemas na execução da query"
    end
  end

  def executa_query(conn, query) do
    :timer.sleep(2000)
    "Conexão #{conn}, resultado: #{query}"
  end
end
