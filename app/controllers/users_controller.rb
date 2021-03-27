class UsersController < ApplicationController
  
  
  def index
  end

  def login_form
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
    flash[:notice] = "ログアウトしました"
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email],password: params[:password],name: params[:name])
    if @user.save
      flash[:notice] = "新規登録が完了しました"
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      @email = params[:email]
      @name = params[:name]
      @password = params[:password]
      @error_message = "入力内容に不備があります"
      render("/users/new")
    end
  end

  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      flash[:notice] = "メールアドレスか、パスワードに誤りがあります"
      @email = params[:email]
      @password = params[:password]
      render("/home/top")
    end
  end

end


