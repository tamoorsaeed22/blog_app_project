require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Comment model' do
    before(:each) do
      @comment = Comment.new(text: 'One comment', author_id: 11, post_id: 2)
    end

    before { @comment.save }

    it 'requires a text' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id must be an integer' do
      @comment.author_id = 'W'
      expect(@comment).to_not be_valid
    end

    it 'post_id must be an integer' do
      @comment.post_id = 'Q'
      expect(@comment).to_not be_valid
    end
  end

  describe 'Custom Methods' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'avatar.png', bio: 'User bio', post_counter: 0)
      @post = Post.create(author: @user, title: 'Test Post', text: 'This is a test post', comments_counter: 0,
                          likes_counter: 0)
      @comment = Comment.new(text: 'Hello Comment', author: @user, post: @post)
    end

    before { @comment.save }

    # Test for the custom method: update_counter
    it 'updates counter using update_counter method' do
      expect { @comment.update_counter }.to change { @post.reload.comments_counter }.by(1)
    end
  end
end
