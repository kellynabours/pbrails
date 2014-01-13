class ChangelogsController < ApplicationController

  def index
        @changelogs=Changelog.where("model=? and model_id=?",params[:model],params[:model_id]).order("created_at DESC")
    	render :action=>"form", :layout=>"home"
  end

  # GET /product/form/1
  def form
        @changelogs=Changelog.where("model=? and model_id=?",params[:model],params[:model_id]).order("created_at DESC")
        render :layout=>false;
  end

end



