class SeriesBisac < ApplicationModel
	set_table_name "z_series_bisacs"
        default_scope where(:deleted=>0)
	belongs_to :series
	belongs_to :bisac
end
