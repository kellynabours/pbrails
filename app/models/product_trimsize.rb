class ProductTrimsize < ApplicationModel
	set_table_name "pb_product_trimsizes"
        default_scope where(:deleted=>0)
end
