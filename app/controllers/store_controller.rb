class StoreController < ApplicationController
  def index
    @products = Product.all

    @cur_counter = inc_counter()

    @cart = current_cart()

  end

end
