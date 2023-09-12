# https://github.com/heartcombo/devise#getting-started
# https://github.com/varvet/pundit#policies

class BatatinhaController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = PostPolicy::Scope.new(current_user, Post).resolve
  end

  def new
    @post = policy_scope(Post).new

    authorize @post
  end

  def create
    @post = policy_scope(Post).new(post_params)

    authorize @post

    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end

  def edit
    @post = policy_scope(Post).find(params[:id])

    authorize @post
  end

  def update
    @post = policy_scope(Post).find(params[:id])

    authorize @post

    if @post.update(post_params)
      redirect_to posts_url
    else
      render :edit
    end
  end

  def destroy
    @post = policy_scope(Post).find(params[:id])

    authorize @post

    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
