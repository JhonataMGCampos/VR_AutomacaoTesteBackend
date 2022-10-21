Dado('que o usuario consulte informacoes de produtos e estabelecimentos VR') do
  @get_url = 'http://portal.vr.com.br/api-web/comum/enumerations/VRPAT'
end

Quando('ele realizar a pesquisa') do
    @list_vrpat = HTTParty.get(@get_url, :verify => false)

    # puts @list_vrpat
end
  
Entao('uma lista de funcionarios deve retornar') do

# Valida se encontrou a chave 
expect(@list_vrpat.parsed_response).to include("typeOfEstablishment")


# Gera número inteiro até 55
i = rand(55)

# Imprimi um dos tipos aleatoriamente
puts @list_vrpat["typeOfEstablishment"][i]
resposta = (@list_vrpat["typeOfEstablishment"][i]).to_json

# Escrevendo no arquivo evidencia.txt o tipo de estabelecimento escolhido aleatoriamente
arq = File.new(File.join(File.dirname(__FILE__), "evidencia.txt"), "w")
arq.write resposta
end

# Observação: tentativas sem sucesso para os screenshots. Para não ficar sem o rastreio da informação, optei em salvar no arquivo txt
 