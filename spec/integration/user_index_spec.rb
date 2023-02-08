# require 'rails_helper'
# RSpec.describe 'User index integration tests', type: :system do
#   before do
#     driven_by(:rack_test)
#   end
#   before(:all) do
#     @users = User.all
#   end
#   it 'shows all the properties (Name, photo, number of posts) of each user' do
#     visit users_path
#     @users.each do |user|
#       expect(page).to have_text(user.Name)
#       expect(page).to have_content('Number of posts')

#       expect(page).to have_text(user.PostsCounter)
#     end
#   end
#   it 'shows the number  of  posts for the user' do
#     visit '/users'
#     expect(page).to have_content('Number of posts')
#   end
# end

require 'rails_helper'

RSpec.describe 'User/index page', type: :system do
  before do
    @user1 = User.create(Name: 'Rodrigo De Paul',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         Bio: 'Industrialist.',
                         PostsCounter: 2)
    @user1 = User.create(Name: 'Nuhuel Molina',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         Bio: 'Industrialist.',
                         PostsCounter: 5)
  end

  it 'shows the username of all other users' do
    visit users_path
    expect(page).to have_content(@user1.Name)
  end

  it 'show the profile picture of each user' do
    visit users_path
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it 'shows number of posts, post counter' do
    Post.create(Title: 'Hello', Text: 'This is my first post', user: @user1)
    Post.create(Title: 'Hello2', Text: 'This is my second post', user: @user1)
    visit '/'
    expect(page).to have_content("Number of posts: #{@user1.PostsCounter}")
  end

  it 'directs you the users profile page' do
    @user3 = User.create(Name: 'Kaweesi',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         Bio: 'Industrialist.')
    visit '/'
    click_on @user3.Name

    expect(page).to have_current_path('/users/1')
  end
end
