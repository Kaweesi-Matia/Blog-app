require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Like model' do
    before(:each) do
      @comment = Comment.new(text: 'ggg', post_id: 6)
    end

    before { @comment }

    it 'if text is present' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'if post_id is present' do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end
  end
end
