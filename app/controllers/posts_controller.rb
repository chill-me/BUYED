class PostsController < ApplicationController

  before_action :set_current_user

  def set_current_user
    current_user = User.find_by(id: session[:user_id])
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
      @posts = Post.all
      @post = Post.new(
      user_id:  current_user.id,
      item_name: params[:item_name],
      price: params[:price],
      comment: params[:comment] ,
      )
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

   # def liked_by?
   #   @post = Post.find(id: params[:id])
   #   likes = Like.all
   #   @post.likes.where(user_id: @current_user.id).exists?
   # end
  end

end
