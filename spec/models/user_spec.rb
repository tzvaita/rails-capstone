require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(username: 'Foobar', fullname: 'foo bar')
  end

  context 'with valid details' do
    it 'should create a user' do
      expect(@user).to be_valid
    end
    
    it 'should have a fullname' do
      expect(@user.fullname).to be_present
    end

    it 'should have a username' do
      expect(@user.username).to be_present
    end

    
  end

  context 'with invalid details' do
    it 'fullname should not be too long' do
      @user.fullname = "a" * 51
      expect(@user).not_to be_valid
    end

    it 'username should not be too long' do
      @user.username = "a" * 51
      expect(@user).not_to be_valid
    end

    it 'username cannot be spaces' do
      @user.username = '    '
      expect(@user).not_to be_valid
    end

    it 'fullname cannot be spaces' do
      @user.fullname = '    '
      expect(@user).not_to be_valid
    end
  end
  
end
