10.times.each do |i|
  Product.create! do |product|
    product.product_id = i+1
    product.name = "Product #{i+1}"
    product.price  = 20 * (i+1)
    product.description = "Description of Product #{i+1}"
  end
end