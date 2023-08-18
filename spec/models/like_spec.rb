require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations For the Like model' do
    it 'requires author_id to be present' do
      like = Like.new(post_id: 7)
      expect(like).to_not be_valid
      expect(like.errors[:author_id]).to include("can't be blank")
    end

    it 'requires post_id to be present' do
      like = Like.new(author_id: 2)
      expect(like).to_not be_valid
      expect(like.errors[:post_id]).to include("can't be blank")
    end
  end

  describe 'Custom Methods' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'avatar.png', bio: 'User bio', post_counter: 0)
      @post = Post.create(author: @user, title: 'Test Post', text: 'This is a test post', comments_counter: 0,
                          likes_counter: 0)
      @like = Like.new(author: @user, post: @post)
    end

    before { @like.save }

    # Test for the custom method: update_counter
    it 'updates counter using update_counter method' do
      expect { @like.update_counter }.to change { @post.reload.likes_counter }.by(1)
    end
  end
end
