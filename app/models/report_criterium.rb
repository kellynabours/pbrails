class ReportCriterium < ApplicationModel
	set_table_name "z_reports_criterias"
        belongs_to :report
        default_scope where(:deleted=>0)
end
