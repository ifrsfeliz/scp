json.array!(@research_lines) do |research_line|
  json.extract! research_line, :id, :nome, :research_group_id
  json.url research_line_url(research_line, format: :json)
end
