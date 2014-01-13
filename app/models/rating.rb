class Rating < ApplicationModel
	set_table_name "pb_ratings"
        default_scope where(:deleted=>0)

end
