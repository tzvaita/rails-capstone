require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    @user = User.create!(username: 'Foobar', fullname: 'foo bar')
    @user1 = User.create!(username: 'Foo', fullname: 'bar')
    @following = Following.new(follower_id: @user.id,
                                     followed_id: @user1.id)
  end

  context "with valid details" do
    it "should be valid" do
      expect(@following).to be_valid
    end
  end

  context 'with invalid parameters' do

    it "should require a follower_id" do
      @following.follower_id = nil
      expect(@following).not_to be_valid
    end

    it "should require a followed_id" do
      @following.followed_id = nil
      expect(@following).not_to be_valid
    end
  end
end
