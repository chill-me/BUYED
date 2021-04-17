class LikesController < ApplicationController
    def create
        like = current_user.likes.build(post_id: params[:post_id])
        like.save
      end
    
      def destroy
        like = Like.find_by(post_id: params[:post_id], user_id: @current_user.id)
        like.destroy

end
