class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all
    serialized_posts = @posts.map { |post| PostSerializer.new(post).serializable_hash[:data][:attributes] }
    render json: serialized_posts
  end


  # GET /posts/1
  def show
    render json: {
      post: @post,
      image_url: url_for(@post.image)
    }
  end


  # POST /posts
  def create
    @post = Post.new(post_params)
    image = params[:post][:image]
    @post.image.attach(image) if image

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :category, :artist, :image)      #image was added
    end
end
