require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before :each do
    user2 = User.create!(fullname: 'Bar', username: 'fbar')
    user3 = User.create!(fullname: 'Baz', username: 'fbaz')
    visit signup_path
    expect(page.current_path).to eq '/signup'
    page.fill_in 'Fullname', with: 'foobar'
    page.fill_in 'Username', with: 'bar'
    click_button 'Create my account'
    expect(page).to have_text 'Welcome to the App!'
    expect(page.current_path).to eq '/home'
    click_on 'Bar'
  end

  scenario 'Follow someone' do
    have_button 'Follow'
    click_on 'Follow'
    expect(page).to have_button 'Unfollow'
  end

  scenario 'Follow and unfollow someone' do
    have_button 'Follow'
    click_on 'Follow'
    expect(page).to have_button 'Unfollow'
    click_on 'Unfollow'
    expect(page).to have_button 'Follow'
  end

end
