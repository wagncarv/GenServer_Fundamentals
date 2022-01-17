defmodule Operations do
  def start, do: spawn(fn -> loop(0) end)

  def loop(valor) do
    novo_valor =
      receive do
        {:valor, caller} -> send(caller, {:resposta, valor})
        {:add, valor_passado} -> valor + valor_passado
        {:sub, valor_passado} -> valor - valor_passado
      end

    loop(novo_valor)
  end

  def add(pid, valor_passado), do: send(pid, {:add, valor_passado})
  def sub(pid, valor_passado), do: send(pid, {:sub, valor_passado})

  def get(pid) do
    send(pid, {:valor, self()})

    receive do
      {:resposta, valor} -> valor
    after
      3000 -> "Erro ao processar a resposta"
    end
  end
end
