class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :company_name
      t.string :address
      t.string :phone
      t.string :contact_name
      t.string :email

      t.timestamps
    end
  end
end
