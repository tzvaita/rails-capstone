require 'rails_helper'

RSpec.feature "Thoughts", type: :feature do
  before :each do
    visit signup_path
    expect(page.current_path).to eq '/signup'
    page.fill_in 'Fullname', with: 'foobar'
    page.fill_in 'Username', with: 'bar'
    click_button 'Create my account'
    expect(page).to have_text 'Welcome to the App!'
    expect(page.current_path).to eq '/home'
  end

  scenario 'create a thought' do
    within('form') do
      fill_in 'Text', with: 'First thought'
    end
    click_button 'Post'
    expect(page).to have_text 'Thought created!'
  end
end
