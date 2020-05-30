require 'rails_helper'

RSpec.describe Thought, type: :model do
  before :each do
    @user = User.create!(username: 'Foobar', fullname: 'foo bar')
    @thought = @user.thoughts.build(text: "Lorem ipsum")
  end

  context "with valid details" do
    it 'thought should be valid' do
      expect(@thought).to be_valid
    end

    it 'a thought cannot be empty' do
      expect(@thought.text).to be_present
    end
    
  end

  context "with invalid details" do
    it 'thought should have an author_id' do
      @thought.author_id = nil
      expect(@thought).not_to be_valid
    end

    it 'text should be less than 140 characters' do
      @thought.text = "a" * 141
      expect(@thought).not_to be_valid
    end

    it 'does not save an empty thought' do
      @thought.text = "  "
      expect(@thought).not_to be_valid
    end
  end
end
