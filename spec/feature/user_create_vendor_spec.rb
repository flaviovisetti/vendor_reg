require 'rails_helper'

feature 'user create vendor' do
  scenario 'successfully' do
    vendor_one = build(:vendor)

    visit root_path
    click_on 'Novo Fornecedor'

    fill_in 'Razão Social', with: vendor_one.company_name
    fill_in 'Endereço', with: vendor_one.address
    fill_in 'Telefone', with: vendor_one.phone
    fill_in 'Contato', with: vendor_one.contact_name
    fill_in 'Email', with: vendor_one.email

    click_on 'Registrar'

    expect(current_path).to eq(vendors_path(vendor_one))
    expect(page).to have_content(vendor_one.company_name)
    expect(page).to have_content(vendor_one.address)
    expect(page).to have_content(vendor_one.phone)
    expect(page).to have_content(vendor_one.contact_name)
    expect(page).to have_content(vendor_one.email)
  end
end
