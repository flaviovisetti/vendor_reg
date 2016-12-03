class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(set_params)
    @vendor.save

    redirect_to @vendor
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  private

  def set_params
    params.require(:vendor).permit(:company_name, :address,
                                   :phone, :contact_name, :email)
  end
end
