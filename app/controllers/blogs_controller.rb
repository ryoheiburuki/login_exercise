class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :identify_user, only: [:new, :edit, :show, :destroy]
  before_action :current_user_name

  def top
  end

  def index
    @blogs = Blog.all
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    current_user
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to @blog, notice: 'ブログが登録されました'
    else
      render "new"
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログが更新されました'
    else
      render "edit"
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'ブログが削除されました'
  end

  def identify_user
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def current_user_name
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
