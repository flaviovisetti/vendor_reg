class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create; end
end
