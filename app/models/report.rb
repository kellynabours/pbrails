class Report < ApplicationModel
	set_table_name "z_reports"
        has_many :report_criteria
        has_many :report_field
        default_scope where(:deleted=>0)
end
