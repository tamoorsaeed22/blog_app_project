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
end
