require 'rails_helper'

feature 'user sign in' do
  scenario 'user visit sign in page' do
    visit root_path

    click_on 'Entrar'

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'register an user' do
    user = create(:user)

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    within('form') do
      click_on 'Cadastrar'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Bem vindo #{user.email}")
  end

  scenario 'does not see Entrar' do
    user = create(:user)

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    within('form') do
      click_on 'Cadastrar'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Bem vindo #{user.email}")
    expect(page).to_not have_content('Entrar')
  end
end
