class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_cart
    Cart.find(session[:cartId])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cartId] = cart.id
    cart
  end
end
