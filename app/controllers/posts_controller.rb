class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /blog/posts
  # GET /blog/posts.json
  def index
    @posts = Post.all
  end

  # GET /blog/posts/1
  # GET /blog/posts/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
