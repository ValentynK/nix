json.(@record) do |record|
  json.(record, :price, :image_file_name)
  json.path record.image.path
end

