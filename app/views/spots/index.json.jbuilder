json.array!(@spots) do |spot|
  json.extract! spot, 
  json.url spot_url(spot, format: :json)
end
