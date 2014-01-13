class RoleController < ApplicationController
	def new
		r=Role.new
		r.series_id=params[:series_id]
		r.contact_id=params[:contact_id]
		r.role=params[:role]
		r.save
		r.contact
		@r=r
		render :layout=>false
	end

	def newcontact
		c=Contact.new
		c.first_name=params[:first_name]
		c.last_name=params[:last_name]
		c.save
		r=Role.new
		r.series_id=params[:series_id]
		r.contact_id=c.id
		r.role=params[:role]
		r.save
		@r=r
		render :layout=>false, :action=>"new"
	end

	def delete
		r=Role.find_by_id(params[:id])
		r.deleted=1
		r.save
		render :nothing=>true
	end

end



