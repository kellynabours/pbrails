class Territory < ApplicationModel
	set_table_name "z_territories"
        default_scope where(:deleted=>0)

end
