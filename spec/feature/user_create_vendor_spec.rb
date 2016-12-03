require 'rails_helper'

feature 'user create vendor' do
  scenario 'successfully' do
    user = create(:user)
    vendor = build(:vendor)

    login_as(user)

    visit root_path
    click_on 'Novo Fornecedor'

    fill_in 'Razão Social', with: vendor.company_name
    fill_in 'Endereço', with: vendor.address
    fill_in 'Telefone', with: vendor.phone
    fill_in 'Contato', with: vendor.contact_name
    fill_in 'Email', with: vendor.email

    click_on 'Registrar'

    expect(page).to have_content(vendor.company_name)
    expect(page).to have_content(vendor.address)
    expect(page).to have_content(vendor.phone)
    expect(page).to have_content(vendor.contact_name)
    expect(page).to have_content(vendor.email)
  end

  scenario 'try register a blank form' do
    user = create(:user)
    login_as(user)

    visit new_vendor_path
    click_on 'Registrar'

    expect(page).to have_content('Não é possível cadastrar fornecedor')
  end

  scenario 'does not access page unsinged' do
    visit new_vendor_path

    expect(current_path).to eq(new_user_session_path)
  end
end
