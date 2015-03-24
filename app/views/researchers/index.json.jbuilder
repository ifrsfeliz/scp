json.array!(@researchers) do |researcher|
  json.extract! researcher, :id, :nome, :cpf, :rg, :email, :telefone, :celular
  json.url researcher_url(researcher, format: :json)
end
