class Upc < ApplicationModel
	set_table_name "z_upcs"
        default_scope where(:deleted=>0)
end
