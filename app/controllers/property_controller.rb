class PropertyController < ApplicationController
  def index
	if params[:id]
		@prop=Property.find_by_id(params[:id])
	end
	render :action=>"form", :layout=>"home"
  end

  def form
	if params[:id]
		@prop=Property.find_by_id(params[:id])
	end
	render :layout=>false 
  end

  def new
	if params[:title].nil? 
		render :text=>"Must have a name",:status=>500 
		return
	end 
	property=Property.find_by_title(params[:title])
	if property
		render :text=>"Name must be unique",:status=>500 
		return
	end 
	property=Property.new do |p|
		p.title=params[:title]
	end
	property.save
	@prop=property
	render :action=>"form", :layout=>false
  end

  def delete
	property=Property.find_by_id(params[:id])
	if (property)
		property.deleted=1
		property.save
	end
	render :nothing=>true
  end

  def save 
	if !params[:id]
		render :text=>"Must have selected a Property", :status=>500
		return
	end
	property=Property.find_by_id(params[:id]);
	if !property
		render :text=>"No such property found", :status=>500
		return
	end
	if property.title!=params[:series][:title]
		#check that the name is not already in use.
		p2=Property.find_by_title(params[:series][:title])
		if p2
			render :text=>"Title already in use", :status=>500
			return
		end
        end

	property.title=params[:title]
        params[:property].each_pair do |key, val|
          property[key]=val
        end
	property.save
	@prop=property
	render :action=>"form", :layout=>false
  end


end



