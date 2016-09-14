require "rails_helper"

describe 'Posts' do
  describe 'For a given user' do
    it 'should show posts of a user' do
      create_user_and_posts
      visit root_path(username: @user.username)
      expect(page).to have_css('h4', text: @user_post.title)
      expect(page).to_not have_css('h4', text: @other_post.title)
    end
  end


  describe 'Unregistered user' do
    before(:all) do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post, user: @user)
    end

    it 'should see all posts' do
      visit '/'
      within '.post' do
        expect(page).to have_css('h4', text: @post.title)
        expect(page).to have_css('p', text: @post.body)
      end
    end

    it 'should redirect to post page' do
      visit '/'
      click_link(@post.title)
      expect(page).to have_title("#{@post.title} | My blog")
    end

    it 'should not edit post' do
      visit edit_post_path(@post)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'should not create post' do
      visit new_post_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  describe 'Registered user' do
    before(:all) do
      create_user_and_posts
      login @user
    end

    it 'should edit his post' do
      visit edit_post_path(@user_post)
      expect(page).to have_title('Edit post | My blog')
      expect(page).to have_css("input#post_title")
      expect(page).to have_css("textarea#post_body")
    end

    it 'should not edit post other posts' do
      visit edit_post_path(@other_post)
      expect(page).to_not have_css("input#post_title")
      expect(page).to_not have_css("textarea#post_body")
    end
  end

  def create_user_and_posts
    @user = FactoryGirl.create(:user)
    @user_post = FactoryGirl.create(:post, user: @user)
    @other_post = FactoryGirl.create(:post)
  end
end
