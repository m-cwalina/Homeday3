class SellersController < ApplicationController
  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to seller_path(@seller), notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def show
    @seller = Seller.find(params[:id])
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :phone)
  end
end
