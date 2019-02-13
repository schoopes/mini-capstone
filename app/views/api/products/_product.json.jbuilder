json.id product.id
json.name product.name
json.price product.price
json.image product.images
json.description product.description
json.in_stock product.in_stock
json.supplier product.supplier.name
json.current_user current_user
json.categories product.categories

json.formatted do
  json.price number_to_currency(product.price)
  json.discounted? product.is_discounted?
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end
