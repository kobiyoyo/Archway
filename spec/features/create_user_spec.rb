require 'rails_helper'

feature 'create user' do

  let(:user) { FactoryBot.create(:user_two, email: 'joeboy@gmail.com') }

  scenario 'successfully' do
    visit signup_path
    fill_in('First name', with: user.first_name)
    fill_in('Last name', with: user.last_name)
    fill_in('Gender', with: user.gender)
    fill_in('Date of birth', with: user.date_of_birth)
    fill_in('Email', with: 'looku@girl.com')
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password_confirmation)
    click_on('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'unsuccessfully' do
    visit signup_path
    click_on('Sign up')
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end
