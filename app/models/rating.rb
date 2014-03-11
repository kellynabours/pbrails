class Rating < ApplicationModel
	set_table_name "z_ratings"
        default_scope where(:deleted=>0)

end
