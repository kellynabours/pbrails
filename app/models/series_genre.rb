class SeriesGenre < ApplicationModel
	set_table_name "z_series_genres"
        default_scope where(:deleted=>0)
	belongs_to :series
	belongs_to :genre
end
