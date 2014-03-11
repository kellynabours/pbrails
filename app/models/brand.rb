class Brand < ApplicationModel
	set_table_name "z_brands"
        default_scope where(:deleted=>0)

end
