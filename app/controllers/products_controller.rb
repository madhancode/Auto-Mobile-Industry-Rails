class ProductsController < ApplicationController
    before_action :set_shop

    def create
        @product = @shop.products.new(product_params)
        if @product.save
            redirect_to @shop
        else
            render 'new'
        end
    end

    def new
        @product = Product.new
    end

    private
        def set_shop
            @shop = Shop.find(params[:shop_id])
        end

        def product_params
            params.required(:product).permit(:name, :quantity)
        end
end
