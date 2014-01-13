class VmSeries < ApplicationModel
	establish_connection "viz2_#{Rails.env}"
	set_table_name "manga_series_common"
end
