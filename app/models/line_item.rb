class LineItem < ActiveRecord::Base

  attr_accessible(:cart_id, :product_id, :quantity, :product)

  def total_price
    return product.price * quantity
  end

  belongs_to(:product)
  belongs_to(:cart)
end
