class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_post, only: [:edit, :update, :show]
  before_action :check_user, only: [:edit, :update]

  def index
    @posts = params[:username].present? ? Post.for_user(params[:username]) : Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
  end

  def get_post
    @post = Post.find(params[:id])
  end

  private
  def check_user
    redirect_to root_path unless @post.is_author?(current_user)
  end
end
