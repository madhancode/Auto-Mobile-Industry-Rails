class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, except: [:index]

  def index
    @shops = Shop.all
  end

  def show_requests
    @requests = Request.where(supplier_id: @shop.id).order("created_at DESC")
  end

  def show
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='products"+@shop.id.to_s+".xlsx'"
      }
      format.html { render :show }
      format.pdf {
        render pdf: "products",
        template: "shops/show.html.erb",
        layout: 'pdf.html'
      }
    end
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end
end
