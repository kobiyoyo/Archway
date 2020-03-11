require 'rails_helper'
require_relative '../support/login_form'

feature 'create post' do
  let(:user) { FactoryBot.create(:user) }
  let(:login_form) { LoginForm.new }
  background do
    login_form.visit_page.login_as(user)
  end
  scenario 'successfully' do
    expect(page).to have_content('Signed in successfully')
    click_on('New Post')
    fill_in('Content', with: 'read a file please')
    click_on('Create Post')
    expect(page).to have_content('Post was successfully created')
    expect(Post.last.content).to eq('read a file please')
  end

  scenario 'unsuccessfully' do
    expect(page).to have_content('Signed in successfully')
    click_on('New Post')
    click_on('Create Post')
    expect(page).to have_content("can't be blank")
  end
end
