class ApplicationModel < ActiveRecord::Base
	log=true

	before_save :log_save

	alias :destroy! :destroy
	alias :delete! :delete

	def log_save
		if (self.changed && self.changes.to_s!="{}")
	
			cl=Changelog.create
			cl.created_at=Time.now
			cl.model_id=self.id
			cl.model=self.class.to_s
			cl.changelog=self.changes.to_s
			if @user
				cl.user_id=@user.id
			end
			cl.save
		end
 	end


	# prevent deletes, just set deleted=1

	def destroy
		run_callbacks(:destroy) { delete } 
	end

	def delete 
		return if new_record?
		destroyed? ? destroy! : update_attribute(:deleted,1)
	end

	def destroyed?
		return deleted==1
	end
	
	alias :deleted? :destroyed?
end
