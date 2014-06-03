class Admin::PostsController < AdminController
  prepend_before_filter :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /a/blog/posts
  # GET /a/blog/posts.json
  def index
    @posts = Post.all
  end

  # GET /a/blog/posts/1
  # GET /a/blog/posts/1.json
  def show
  end

  # GET /a/blog/posts/new
  def new
    @post = Post.new
  end

  # GET /a/blog/posts/1/edit
  def edit
  end

  # POST /a/blog/posts
  # POST /a/blog/posts.json
  def create
    @post = Post.new(params[:post])
    flash[:notice] = "Post was successfully created." if @post.save
    respond_with @post, location: admin_posts_path
  end

  # PATCH/PUT /a/blog/posts/1
  # PATCH/PUT /a/blog/posts/1.json
  def update
    flash[:notice] = 'Post was successfully updated.' if @post.update(params[:post])
    respond_with @post, location: admin_post_path(@post)
  end

  # DELETE /a/blog/posts/1
  # DELETE /a/blog/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.friendly.find(params[:id])
    end
end
