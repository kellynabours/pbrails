class ReportField < ApplicationModel
	set_table_name "z_reports_fields"
        belongs_to :report
        default_scope where(:deleted=>0)
end
