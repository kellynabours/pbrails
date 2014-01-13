class Product < ApplicationModel
        set_table_name "pb_products"
	belongs_to :series
        has_many :product_territory
        has_many :territory, :through=>:product_territory

        belongs_to :format
        belongs_to :brand
        belongs_to :rating
        belongs_to :product_trimsize
        belongs_to :licensor


        scope :name_like, lambda {|str| where( 'lower(name) like ?' , "%"+str.downcase+"%" ) }
        default_scope where(:deleted=>0)

end

