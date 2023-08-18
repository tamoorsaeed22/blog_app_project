require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(name: 'Tom', photo: 'image.png', bio: 'Teacher from Mexico', post_counter: 0)
      @post = Post.new(author: @user, title: 'Test', text: 'testing', likes_counter: 6, comments_counter: 1)
    end

    before { @post.save }

    it 'if there is title' do
      @post.title = true
      expect(@post).to be_valid
    end

    it 'if there is max 250 characters' do
      @post.title = 'Testing'
      expect(@post).to be_valid
    end

    it 'if likes counter is integer' do
      @post.likes_counter = 5
      expect(@post).to be_valid
    end

    it 'if likes counter greater than or equal to zero' do
      @post.likes_counter = -9
      expect(@post).to_not be_valid
    end

    it 'if comments counter greater than or equal to zero.' do
      @post.comments_counter = -5
      expect(@post).to_not be_valid
    end

    it 'if comments counter is integer' do
      @post.comments_counter = 8
      expect(@post).to be_valid
    end

    # Test for the custom method: recent_comments
    it 'returns recent comments' do
      comment = Comment.create(text: 'Recent comment', author: @user, post: @post)
      recent_comments = @post.recent_comments
      expect(recent_comments).to include(comment)
    end

    # Test for the custom method: update_author_counter
    it 'updates author post counter when saved' do
      expect { @post.save }.to change { @user.reload.post_counter }.by(1)
    end
  end
end
