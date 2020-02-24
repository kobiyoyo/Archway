require 'rails_helper'

feature 'create post' do
  let(:user) { FactoryBot.create(:user) }

  scenario 'successfully' do
    visit user_session_path
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_on('Log in')
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
end
