class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @posts = Post.all
    @post = @current_user.posts.build(post_params)
    @post.save
    @post.post_imgname = "#{@post.id}_postimage.jpg"
    image = params[:image]
    File.binwrite("public/post_images/#{@post.post_imgname}", image.read)
    if @post.save
      flash[:notice] = "投稿を保存しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "投稿内容に誤りがあります。"
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html {redirect_back(fallback_location: posts_path)}
      format.js
    end  
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
    respond_to do |format|
      format.html {redirect_back(fallback_location: posts_path)}
      format.js
    end  
  end


  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html {redirect_back(fallback_location: posts_path)}
      format.js
    end
  end 

  private
  def post_params #post_paramsの定義（ないとエラーになる）
    params.require(:post).permit(
      :item_name,
      :price,
      :comment,
    )
  end

end
