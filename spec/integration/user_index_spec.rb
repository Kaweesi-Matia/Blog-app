require 'rails_helper'
RSpec.describe 'User index integration tests', type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:all) do
    @users = User.all
  end
  it 'shows all the properties (Name, photo, number of posts) of each user' do
    visit users_path
    @users.each do |user|
      expect(page).to have_text(user.Name)
      expect(page).to have_content('Number of posts')


      expect(page).to have_text(user.PostsCounter)
    end
  end
  it 'shows the number  of  posts for the user' do
    visit '/users'
    expect(page).to have_content('Number of posts')
  end
end
