class Bisac < ApplicationModel
	set_table_name "pb_bisacs"
        default_scope where(:deleted=>0)

end
