class Changelog < ActiveRecord::Base
	set_table_name "pb_changelogs"
	belongs_to :user
end
