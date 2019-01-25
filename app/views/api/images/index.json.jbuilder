json.array! @images.each do |image|
  json.partial! "image.json.jbuilder", image: image
end