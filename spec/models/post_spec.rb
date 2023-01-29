require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'Premier League', comments_counter: 4, likes_counter: 10) }

  before { subject.save }

  it 'Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not exceed 250 characters' do
    subject.Title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be present' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likescounter should be present' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should allow valid values' do
    subject.comments_counter = 20
    expect(subject).to_not be_valid
  end
  it 'is not valid if comments_counter is less than 0' do
    post = Post.new(comments_counter: -1)
    expect(post).to_not be_valid
  end
  it 'is not valid if likes_counter is less than 0' do
    post = Post.new(likes_counter: -1)
    expect(post).to_not be_valid
  end
end
