class SearchController < ApplicationController

  #called by ajax only, params are searchtype, and searchvalue
  # adv params can be isbn(10 or 13), UPC, or Catcode
  def search
	@returns=[]
  	if params['searchtype']=='property'
		#search by property
		Property.title_like(params[:searchvalue]).each do |prop|
			@returns << [ prop.id, prop.title] 
		end
        end
	if params['searchtype']=='series'
		Series.name_like(params[:searchvalue]).each do |series|
			@returns << [ series.id, series.name ] 
		end
	end
	if params['searchtype']=='product'
		Product.name_like(params[:searchvalue]).each do |prod|
			@returns << [ prod.id , prod.short_description]
		end
	end
	if params['searchtype']=='contact'
		Contact.name_like(params[:searchvalue]).each do |cont|
			@returns << [ cont.id , cont.first_name+" "+cont.last_name ]
		end
	end
        render :layout=>false;
  end

end
