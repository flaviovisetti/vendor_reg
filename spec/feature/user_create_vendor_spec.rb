require 'rails_helper'

feature 'user create vendor' do
  scenario 'successfully' do
    vendor = build(:vendor)

    visit root_path
    click_on 'Novo Fornecedor'

    fill_in 'Razão Social', with: vendor.company_name
    fill_in 'Endereço', with: vendor.address
    fill_in 'Telefone', with: vendor.phone
    fill_in 'Contato', with: vendor.contact_name
    fill_in 'Email', with: vendor.email

    click_on 'Registrar'

    expect(current_path).to eq(vendors_path(vendor))
    expect(page).to have_content(vendor.company_name)
    expect(page).to have_content(vendor.address)
    expect(page).to have_content(vendor.phone)
    expect(page).to have_content(vendor.contact_name)
    expect(page).to have_content(vendor.email)
  end
end
