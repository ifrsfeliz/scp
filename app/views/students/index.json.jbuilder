json.array!(@students) do |student|
  json.extract! student, :id, :nome, :cpf, :rg, :email, :telefone, :celular
  json.url student_url(student, format: :json)
end
