json.array!(@boards) do |board|
  json.extract! board, 
  json.url board_url(board, format: :json)
end
