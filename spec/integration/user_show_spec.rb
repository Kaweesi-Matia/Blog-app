require 'rails_helper'

RSpec.describe 'users_show', type: :feature do
  before :each do
    # create user
    @user = User.create(Name: 'Kaweesi', Bio: 'He wants to get a remote job.:fake',
                        PostsCounter: 45)

    # create posts
    @post = Post.create(Title: 'Title 1', Text: 'Lorem ipsum dolor sit', user_id: User.first.id, comments_counter: 0,
                        likes_counter: 0)
    Post.create(Title: 'Title 2', Text: 'Lorem ipsum dolor sit', user_id: User.first.id, comments_counter: 0,
                likes_counter: 0)
    Post.create(Title: 'Title 3', Text: 'Lorem ipsum dolor sit', user_id: User.first.id, comments_counter: 0,
                likes_counter: 0)
    Post.create(Title: 'Title 4', Text: 'Lorem ipsum dolor sit', user_id: User.first.id, comments_counter: 0,
                likes_counter: 0)
    Post.create(Title: 'Title 5', Text: 'Lorem ipsum dolor sit', user_id: User.first.id, comments_counter: 0,
                likes_counter: 0)

    visit user_url(User.first)
  end

  it 'displays page header' do
    visit user_path(User.first)
    expect(page).to have_text('')
  end

  it "display user's username" do
    expect(page).to have_text('Kaweesi')
  end

  it 'has the number of posts the user has written' do
    expect(page).to have_text('Number of posts: 45')
  end

  it "displays user's bio" do
    expect(page).to have_content 'He wants to get a remote job.:fake'
  end
  it 'shows the username' do
    expect(page).to have_content(@user.Name)
  end

  it 'shows number of posts written by user' do
    expect(page).to have_content("Number of posts: #{@user.PostsCounter}")
  end
  it 'displays page header' do
    visit user_path(User.last)
    expect(page).to have_text('User has no posts yet')
  end

  it 'displays page button' do
    visit user_path(User.last)
    expect(page).to have_text('See all posts')
  end
end
