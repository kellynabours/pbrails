class Contact < ApplicationModel
	set_table_name "pb_contacts"
	has_many :roles
        default_scope where(:deleted=>0)
end
