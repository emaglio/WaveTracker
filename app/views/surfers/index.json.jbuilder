json.array!(@surfers) do |surfer|
  json.extract! surfer, 
  json.url surfer_url(surfer, format: :json)
end
