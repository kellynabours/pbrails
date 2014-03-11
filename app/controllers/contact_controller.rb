class ContactController < ApplicationController

  def index
    render :action=>"form", :layout=>"home"
  end
 
  # GET /product/form/1
  def form
	@contact=Contact.find_by_id(params[:id]) if !params[:id].nil?
	render :layout=>false;
  end


  def new
  end

  def delete
    @contact=Contact.find_by_id(params[:id])
    if !@contact
        render :text=>"Error Contact Not Found"
	return
    end
    @contact.delete
    render :nothing=>true
  end

  def save
    @contact=Contact.find_by_id(params[:id])
    if !@contact
        render :text=>"Error Contact Not Found"
	return
    end
    params[:contact].each_pair do |key, val|
        @contact[key]=val
    end
    @contact.save!
    render :action=>"form", :layout=>false
  end

end
