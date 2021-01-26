class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @community= Community.find(params[:community_id])
    @vote = Vote.new
    @already_voted = user_signed_in? ? Vote.where(post_id: @post.id, user_id: current_user.id).any? : false
    @is_upvote = user_signed_in? ? Vote.where(post_id: @post.id, user_id: current_user.id, upvote: 'true').any? : false
    @upvotes = Vote.where(post_id: @post.id, upvote: 'true').count
    @downvotes = Vote.where(post_id: @post.id, upvote: 'false').count
    @score = @upvotes - @downvotes
    @comments = Comment.where(post_id: @post.id)
  end

  # GET /posts/new
  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @community = Community.find(params[:community_id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.community_id = params[:community_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to community_path(@post.community_id), notice: 'Post was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        @community = Community.find(params[:community_id])
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to community_post_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @community = @post.community
    @votes = Vote.where(post_id: @post.id)
    @votes.each do |vote|
      vote.destroy
    end
    @comments = Comment.where(post_id: @post.id)
    @comments.each do |comment|
      comment.destroy
    end

    @post.destroy
    respond_to do |format|
      format.html { redirect_to community_path(@community), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:community_id, :title, :post, :image, :image_cache)
    end
end
