class Role < ApplicationModel
	set_table_name "z_roles"
	belongs_to :series
	belongs_to :contact
        default_scope where(:deleted=>0)
end
