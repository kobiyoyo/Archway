require 'rails_helper'
require_relative '../support/login_form'

feature 'Create friendship by' do
  let(:chubi) { FactoryBot.create(:user) }
  let(:dan) { FactoryBot.create(:user_two) }
  let(:friendship) { FactoryBot.create(:friendship, user_id: chubi.id, friend_id: dan.id) }
  let(:login_form) { LoginForm.new }

  scenario 'sending friend request' do
    login_form.visit_page.login_as(chubi)
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content 'Find Friends'
    visit(users_path)
    expect do
      expect(page).to have_content chubi.first_name
      click_link('Add Friend')
      expect(page).to have_content("Friend request has been sent to #{dan.first_name} #{dan.last_name}.")
    end
  end
  scenario 'accepting friend request' do
    login_form.visit_page.login_as(dan)
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content 'Find Friends'
    visit(friends_path)
    expect do
      expect(page).to have_content chubi.first_name
      click_link('Accept')
      expect(page).to have_content("Friend request from #{dan.email} has been accepted.")
    end
  end
end
