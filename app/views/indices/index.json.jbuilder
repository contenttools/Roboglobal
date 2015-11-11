json.array!(@indices) do |index|
  json.extract! index, :id, :index_type, :category
  json.url index_url(index, format: :json)
end
