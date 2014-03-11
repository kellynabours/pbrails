class Isbn < ApplicationModel
	set_table_name "z_isbns"
        default_scope where(:deleted=>0)
end
