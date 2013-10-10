json.array!(@wetsuites) do |wetsuite|
  json.extract! wetsuite, 
  json.url wetsuite_url(wetsuite, format: :json)
end
