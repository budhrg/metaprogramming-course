class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :product_id

  def self.search(params)
    products = DynamicDelegator.new(scoped)
    products = products.where("name like ?", "%" + params[:name] + "%") if params[:name]
    products = products.where("price > ?", params[:price_gt]) if params[:price_gt]
    products = products.where("price < ?", params[:price_lt]) if params[:price_lt]
    products
  end
end
