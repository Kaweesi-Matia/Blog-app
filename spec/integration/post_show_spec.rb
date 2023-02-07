require 'rails_helper'
RSpec.describe 'Users/posts/ page', type: :system do
  before do
    @user1 = User.create(Name: 'Rodrigo De Paul',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         Bio: 'Industrialist.',
                         PostsCounter: 2)
    @first_post = Post.create(Title: 'Helloween', Text: 'This is my first post', user_id: @user1.id, comments_counter: 3,
                              likes_counter: 2)
    @second_post = Post.create(Title: 'Musically', Text: 'Micheal Jackson is the best ever', user_id: @user1.id,
                               comments_counter: 3, likes_counter: 2)
  end

  it 'shows the Home link' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Home')
  end
  it 'shows the Comments of the user' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Comments')
  end

  it 'shows the Post Show of the user' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Post Show')
  end
  it 'shows the Likes of the user' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Likes')
  end
  it 'shows post\'s Text' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.Text)
  end
  it 'shows post\'s title' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.Title)
  end
  it 'shows post\'s comment counter' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.comments_counter)
  end
  it 'shows post\'s likes counter' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.likes_counter)
  end
end
