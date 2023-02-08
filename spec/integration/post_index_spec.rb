require 'rails_helper'
RSpec.describe 'Users/posts/ page', type: :system do
  before do
    @user1 = User.create(Name: 'Rodrigo De Paul',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         Bio: 'Industrialist.',
                         PostsCounter: 2)
    @first_post = Post.create(Title: 'Helloween', Text: 'This is my first post', user_id: @user1.id,
                              comments_counter: 3, likes_counter: 2)
    @second_post = Post.create(Title: 'Musically', Text: 'Micheal Jackson is the best ever', user_id: @user1.id,
                               comments_counter: 3, likes_counter: 2)
  end

  it 'shows the username of the user' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Home')
  end

  it 'shows number of posts, post counter' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content("Number of posts: #{@user1.PostsCounter}")
  end

  it 'shows post\'s title' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@first_post.Title)
  end

  it 'shows post\'s body' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@first_post.Text)
    expect(page).to have_content(@second_post.Text)
    expect(page).not_to have_content('michael')
  end

  it 'shows post\'s first comment' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@first_post.Text)
  end

  it 'shows how many likes a post, likes_counter' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'shows pagination button' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Pagination')
  end

  it 'redirects me to that post\'s show page' do
    visit "/users/#{@user1.id}/posts"
    click_on @first_post.Title
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@first_post.id}")
  end
end
