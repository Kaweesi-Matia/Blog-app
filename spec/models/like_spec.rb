require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations For the Like model' do
    before(:each) do
      @like = Like.new(user_id: 1, post_id: 6)
    end

    before { @like }

    it 'if user_id is present' do
      @like.user_id = false
      expect(@like).to_not be_valid
    end

    it 'if post_id is present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end
  end
end
