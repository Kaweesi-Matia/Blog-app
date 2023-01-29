require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Matia', PostsCounter: 4) }

  before { subject.save }

  it 'Name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be present' do
    subject.PostsCounter = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should allow valid values' do
    subject.PostsCounter = 20
    expect(subject).to_not be_valid
  end
end
