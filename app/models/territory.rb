class Territory < ApplicationModel
	set_table_name "pb_territories"
        default_scope where(:deleted=>0)

end
