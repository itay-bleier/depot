class CombineItemsInCart < ActiveRecord::Migration
  def self.up
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(:product_id=>product_id).delete_all
          # replace with a single item
          cart.line_items.create(:product_id=>product_id, :quantity=>quantity)
        end
      end
    end
  end

  def self.down
    LineItem.where("quantity>1").each do |item|
      # add individual items
      item.quantity.times do
        LineItem.create :cart_id=>item.cart_id,
                        :product_id=>item.product_id, :quantity=>1
      end
      # remove original item
      item.destroy
    end
  end
end
