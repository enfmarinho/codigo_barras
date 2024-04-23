defmodule Codigobarras.Encoder do
  # digito 1 a 3
  defp ler_codigo_banco() do
    IO.puts("Digite o código do banco: ")
    # input = IO.gets("")
    # |> String.trim()
    # |> String.split("" , trim: true)
    # |> Enum.map(&String.to_integer/1)

    # case length(input) == 3 do
    #   true -> {:ok , input} #
    #   false -> {:error , "Número incorreto "}
    # end
    # TODO retornar lista
    [] # TODO remove this, just a STUB
  end

  #digito 4
  defp ler_moeda() do

    IO.puts("Digite o código da moeda: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == 1 do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end 
  end
  
  # fator de vencimento, digitos 6 a 9
  defp ler_data_vencimento() do
    IO.puts("Digite a data de vencimento DD/MM/AAAA: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("/" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO calcular e retornar valor de vencimento

    # TODO retornar lista
    case length(input) == 8 do
      true -> {:ok , input}
      false -> {:error , "Número incorreto"}
    end
  end
  
  # digitos 10 a 19
  defp ler_valor() do
    IO.puts("Digite o valor: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    # TODO fill with 0s
    {:ok , input}
  end


  # digitos 20 a 30
  defp ler_convenio() do
    IO.puts("Digite o tipo de convênio: ")
     IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    # case length(input) == size do
    #   true -> {:ok , input}
    #   false -> {:error , "Número incorreto "}
    # end
  end

  # digitos 31, 44
  defp ler_dados_especificos() do
      IO.puts("Digite os dados_especificos: ")
     IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)
    # TODO retornar lista
    # case length(input) == size do
    #   true -> {:ok , input}
    #   false -> {:error , "Número incorreto "}
    # end
  end


  defp calcular_dv_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end


  defp calcular_dv_campo1(codigo_banco, moeda, convenio) do
    # TODO
    1
  end

  defp calcular_dv_campo2(convenio, dados_especificos) do
    # TODO
    1
  end

  defp calcular_dv_campo3(data_vencimento, valor) do
    # TODO
    1
  end

  defp imprimir_campo_1(codigo_banco, moeda, digitos) do
    codigo_banco |> IO.inspect
    moeda |> IO.puts
    [head | tail] = digitos
    head |> IO.puts
    '.' |> IO.puts
    tail |> IO.inspect
    calcular_dv_campo1(codigo_banco, moeda, digitos) |> IO.puts
    " " |> IO.puts
  end

  defp imprimir_campo_2(dados_especificos, convenio) do
    { _head, rest } = Enum.slice(convenio, 5)
    { before_dot, after_dot } = Enum.slice(rest, 5)
    before_dot |> IO.inspect
    '.' |> IO.puts
    after_dot |> IO.inspect
    { head, _ } = Enum.split(dados_especificos, 3)
    head |> IO.inspect
    calcular_dv_campo2(dados_especificos, convenio) |> IO.write
    " " |> IO.puts
  end

  defp imprimir_campo_3(convenio, dados_especificos) do
    { _, tail } = Enum.split(dados_especificos, 6)
    tail |> IO.inspect
    calcular_dv_campo3(convenio, dados_especificos) |> IO.write
    " " |> IO.puts
  end

  defp imprimir_campo_5(data_vencimento, valor) do
    data_vencimento |> IO.inspect
    valor |> IO.inspect
    " " |> IO.puts
  end

  defp imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) do
    "Linha digital: " |> IO.write
    imprimir_campo_1(codigo_banco, moeda, convenio)
    imprimir_campo_2(convenio, dados_especificos)
    imprimir_campo_3(convenio, dados_especificos)
    "#{dv} " |> IO.puts
    imprimir_campo_5(data_vencimento, valor)
  end

  defp gerar_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) do 
     # TODO gerar png com o codigo de barra
  end

  def ler_registros() do
    codigo_banco = ler_codigo_banco()
    moeda = ler_moeda()
    data_vencimento = ler_data_vencimento()
    valor = ler_valor()
    convenio = ler_convenio()
    dados_especificos = ler_dados_especificos()
    dv = calcular_dv_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos)
     
    imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) 
    gerar_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv)
  end
end
