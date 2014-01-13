class Brand < ApplicationModel
	set_table_name "pb_brands"
        default_scope where(:deleted=>0)

end
