class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @curTime = Time.new;
  end
end
