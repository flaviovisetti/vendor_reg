require 'rails_helper'

feature 'user edit a vendor' do
  scenario 'successfully to edit' do
    user = create(:user)
    vendor = create(:vendor)

    login_as(user)

    visit edit_vendor_path(vendor)

    fill_in 'Razão Social', with: 'IBM do Brasil'
    fill_in 'Endereço', with: 'Rua das orquideas 125'
    fill_in 'Telefone', with: '19 5522-7978'
    fill_in 'Contato', with: 'Carmen Lucia'
    fill_in 'Email', with: 'carmenl@ibm.com.br'

    click_on 'Atualizar'

    expect(page).to have_content('IBM do Brasil')
    expect(page).to have_content('Rua das orquideas 125')
    expect(page).to have_content('19 5522-7978')
    expect(page).to have_content('Carmen Lucia')
    expect(page).to have_content('carmenl@ibm.com.br')
  end

  scenario 'try edit vendor with the same information' do
    user = create(:user)
    vendor = create(:vendor)

    login_as(user)

    visit edit_vendor_path(vendor)

    fill_in 'Razão Social', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Contato', with: ''
    fill_in 'Email', with: ''

    click_on 'Atualizar'

    expect(page).to have_content('Não é possível atualizar fornecedor')
  end
end
