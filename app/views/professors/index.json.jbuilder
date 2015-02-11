json.array!(@professors) do |professor|
  json.extract! professor, :id, :nome, :cpf, :rg, :email, :telefone, :celular
  json.url professor_url(professor, format: :json)
end
