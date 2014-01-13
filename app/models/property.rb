class Property < ApplicationModel
	set_table_name "pb_properties"
	has_many :series 
	scope :title_like, lambda {|str| where( 'lower(title) like ?' , "%"+str.downcase+"%" ).order("title") } 

	default_scope where(:deleted=>0)
end
