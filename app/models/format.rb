class Format < ApplicationModel
	set_table_name "z_formats"
        default_scope where(:deleted=>0)

end
