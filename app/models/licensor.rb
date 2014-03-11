class Licensor < ApplicationModel
        set_table_name "z_licensors"

        scope :name_like, lambda {|str| where( 'lower(name) like ?' , "%"+str.downcase+"%" ) }
        default_scope where(:deleted=>0)


end
