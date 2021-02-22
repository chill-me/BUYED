class PostsController < ApplicationController

  before_action :set_current_user

  def index
    @posts = Post.all
    @post = Post.new

  end

  def new
    @post = Post.new
  end

  def create
      @post = Post.new(
      user_id:  @current_user.id,
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
  end

  
  
end
