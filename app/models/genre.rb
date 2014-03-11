class Genre < ApplicationModel
	set_table_name "z_genres"
        default_scope where(:deleted=>0)

end
