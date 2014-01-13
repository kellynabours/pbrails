class ProductTerritory < ApplicationModel
	set_table_name "pb_product_territories"
        default_scope where(:deleted=>0)
	belongs_to :product
	belongs_to :territory
end
