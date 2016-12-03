class VendorsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(set_params)
    if @vendor.save
      redirect_to @vendor
    else
      flash.now[:alert] = 'Não é possível cadastrar fornecedor'
      render :new
    end
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
