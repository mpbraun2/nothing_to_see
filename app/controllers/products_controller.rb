class ProductsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @product = Product.all
        render 'index'
    end
    def dashboard
        @user = User.find(session[:user_id])
        @product = Product.all
        render 'dashboard'
    end
    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @user = User.find(session[:user_id])
        @product.user = @user

        if @product.save
        redirect_to "/dashboard", notice: "You have successfully created a Product!"
        else
        flash[:errors] = @product.errors.full_messages
        redirect_to "/dashboard"
    end
  end

#     def create
#         product = Product.new(name:params[:name], 
#         if message.save
#             redirect_to '/messages/show/outbox'  
#         else
#             flash[:errors] = message.errors.full_messages
#             redirect_to '/messages/new'
#         end
#     end               
# end

  private
    def product_params
       params.require(:product).permit(:name, :amount)
    end
end