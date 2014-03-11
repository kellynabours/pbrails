class Contact < ApplicationModel
	set_table_name "z_contacts"
	has_many :roles
        default_scope where(:deleted=>0)

	scope :name_like, lambda {|str| where( 'lower(concat(first_name,concat(" ",last_name))) like ?' , "%"+str.downcase+"%" ) }
end
