require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations For the Like model' do
    before(:each) do
      @like = Like.new(author_id: 2, post_id: 7)
    end

    it 'requires author_id to be present' do
      @like.author_id = nil
      expect(@like).to_not be_valid
    end

    it 'requires post_id to be present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end
  end
end
