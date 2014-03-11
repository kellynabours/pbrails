class Bisac < ApplicationModel
	set_table_name "z_bisacs"
        default_scope where(:deleted=>0)

end
