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

  def inc_counter
    if(session[:counter].nil?)
      session[:counter] = 0
    end

    session[:counter] += 1

    return session[:counter]
  end

  def current_counter
    return session[:counter]
  end

  def reset_counter
    session[:counter] = 0
  end

end
