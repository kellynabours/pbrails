class Changelog < ActiveRecord::Base
	set_table_name "z_changelogs"
	belongs_to :user
end
