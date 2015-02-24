json.array!(@scholarship_types) do |scholarship_type|
  json.extract! scholarship_type, :id, :nome
  json.url scholarship_type_url(scholarship_type, format: :json)
end
