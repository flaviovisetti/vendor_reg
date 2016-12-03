require 'rails_helper'

feature 'user visit index' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome')
  end
end
