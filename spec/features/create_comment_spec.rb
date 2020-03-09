require 'rails_helper'
require_relative '../support/login_form'

feature 'create post' do
  let(:user) { FactoryBot.create(:user) }
  let(:login_form) { LoginForm.new }
  scenario 'successfully' do
    login_form.visit_page.login_as(user)
    expect(page).to have_content('Signed in successfully')
    click_on('New Post')
    fill_in('Content', with: 'read a file please')
    click_on('Create Post')
    expect(page).to have_content('Post was successfully created')
    expect(Post.last.content).to eq('read a file please')
    fill_in('Content', with: 'hello girl')
    click_on('Create Comment')
    expect(page).to have_content('hello girl')
  end
  scenario 'Unsuccessfully' do
    login_form.visit_page.login_as(user)
    expect(page).to have_content('Signed in successfully')
    click_on('New Post')
    fill_in('Content', with: 'read a file please')
    click_on('Create Post')
    expect(page).to have_content('Post was successfully created')
    expect(Post.last.content).to eq('read a file please')
    fill_in('Content', with: '')
    click_on('Create Comment')
    expect(page).to have_content('Comment not created')
  end
end
