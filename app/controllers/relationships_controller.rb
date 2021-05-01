class RelationshipsController < ApplicationController

    def create
      @user = User.find(params[:relationship][:following_id])#→123などの特定の数字（user.idの部分）
      #form_withで作られたリクエスト情報
      @current_user.follow(@user)
      respond_to do |format|
        format.html {redirect_back(fallback_location: root_path)}
        format.js
      end
    end
    
    def destroy
      @user = User.find(params[:relationship][:following_id])
      @current_user.unfollow(@user)
      respond_to do |format|
          format.html {redirect_back(fallback_location: root_path)}
          format.js
      end
    end 
end
