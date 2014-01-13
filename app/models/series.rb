class Series < ApplicationModel
        set_table_name "pb_series"
	belongs_to :property
	has_many :roles
	has_many :contacts , :through=>:roles
	has_many :products
	belongs_to :format
	belongs_to :brand
	belongs_to :rating
	belongs_to :product_trimsize
        belongs_to :vm_series , foreign_key: "manga_series_common_id"
        belongs_to :licensor
	has_many :series_bisac
	has_many :bisac, :through=>:series_bisac
	has_many :series_genre
	has_many :genre, :through=>:series_genre
	has_many :series_territory
	has_many :territory, :through=>:series_territory

        scope :name_like, lambda {|str| where( 'lower(name) like ?' , "%"+str.downcase+"%" ) }
        default_scope where(:deleted=>0)

end
