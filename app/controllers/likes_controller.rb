class LikesController < ApplicationController
  def create
    @blazo = Blazo.find(params[:id])
    @like = Like.where(blazo: @blazo, user: current_user)
    if !@like.empty?
      Like.destroy(@like[0].id)
    else
      Like.create(blazo: @blazo, user: current_user)
    end  
    redirect_back(fallback_location: root_path)
  end
end
