class Vendor < ApplicationRecord
  validates :company_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :contact_name, presence: true
  validates :email, presence: true
end
