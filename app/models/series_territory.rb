class SeriesTerritory < ApplicationModel
	set_table_name "pb_series_territories"
        default_scope where(:deleted=>0)
	belongs_to :series
	belongs_to :territory
end
