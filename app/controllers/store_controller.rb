class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)

    if session[:counter].nil?
      @counter = 1
    else
      @counter = session[:counter]
      @counter +=1
    end
      session[:counter] = @counter

  end
end
