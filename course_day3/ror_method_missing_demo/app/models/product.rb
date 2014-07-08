class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :product_id

  def self.search(params)
    products = scope_builder
    products.where("name like ?", "%" + params[:name] + "%") if params[:name]
    products.where("price > ?", params[:price_gt]) if params[:price_gt]
    products.where("price < ?", params[:price_lt]) if params[:price_lt]
    products
  end

  def self.scope_builder
    DynamicDelegator.new(scoped)
  end
end

# Do like this in Rails Console
# Product.send(*[:where, "name like ?", "soap"])
# Product.send(*[:where, "price > ?", "120"])
# Product.send(*[:where, "price < ?", "120"])

