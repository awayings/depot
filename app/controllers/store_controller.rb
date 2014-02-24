class StoreController < ApplicationController
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
