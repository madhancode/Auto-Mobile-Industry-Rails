class RequestsController < ApplicationController
    before_action :set_shop, :set_product
    before_action :set_request, only: [:update]

    def create
        @product.requests.create(create_params.merge( supplier_id: @shop.id, buyer_id: current_user.shop.id, status: "Not Processed"))
        redirect_to @shop
    end

    def update
        if update_params["given_quantity"].to_i != 0
            @request.update(update_params.merge( status: "Recieved " + update_params["given_quantity"]))

            quan = @product.quantity.to_i - update_params["given_quantity"].to_i
            @product.update( quantity: quan )
        else
            @request.update(update_params.merge( status: "Declined"))
        end


        redirect_to shop_requests_path(current_user.shop.id)
    end

    private
        def set_shop
            @shop = Shop.find(params[:shop_id])
        end

        def set_product
            @product = Product.find(params[:product_id])
        end

        def set_request
            @request = Request.find(params[:id])
        end

        def create_params
            params.required(:request).permit( :req_quantity )
        end

        def update_params
            params.require(:request).permit(:given_quantity)
        end
end
