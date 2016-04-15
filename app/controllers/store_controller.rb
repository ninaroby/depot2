class StoreController < ApplicationController
    skip_before_action :authorize
    
    include CurrentCart
    before_action :set_cart
    def index
      	@products = Product.order(:title)


      	if session[:counter].nil?

      		@visit = 1

      	else
      		@visit = session[:counter]+1

      	end

      	session[:counter] = @visit
    end
end
