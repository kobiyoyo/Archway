require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires title' do
      post = Post.new(content: ' ')
      expect(post.valid?).to be_falsy
    end

    it { should belong_to(:user) }
  end
end



