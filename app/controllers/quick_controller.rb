class QuickController < ApplicationController
  def form
        render :layout=>false;
  end
 
  def getproducts
	productwhere="1"
	serieswhere="1"

	sql="select * from z_products p,z_series s where p.series_id=s.id  "

 	if (params['product']['name'] and params['product']['name']!="")  
	  productwhere+=" and z_products.name like '%"+params['product']['name']+"%'" 
        end
 	if (params['product']['short_description'] and params['product']['short_description']!="")  
	  productwhere+=" and z_products.short_description like '%"+params['product']['short_description']+"%'" 
        end
 	if (params['series']['original_publisher'] and params['series']['original_publisher']!="")  
	  serieswhere+=" and z_series.original_publisher like '%"+params['product']['short_description']+"%'" 
        end
	if (params['product']['brand_id'] and params['product']['brand_id'][0]!="")
		productwhere+=" and z_products.brand_id in ("
		first=0
		params['product']['brand_id'].each do |b|
			productwhere+="," if (first==1)
			productwhere+="'"+b+"'" 
			first=1
		end
		productwhere+=")"
	end
	if (params['product']['format_id'] and params['product']['format_id'][0]!="")
		productwhere+=" and z_products.format_id in ("
		first=0
		params['product']['format_id'].each do |b|
			productwhere+="," if (first==1)
			productwhere+="'"+b+"'" 
			first=1
		end
		productwhere+=")"
	end
	if (params['product']['series_id'] and params['product']['series_id'][0]!="")
		productwhere+=" and z_products.series_id in ("
		first=0
		params['product']['series_id'].each do |b|
			productwhere+="," if (first==1)
			productwhere+="'"+b+"'" 
			first=1
		end
		productwhere+=")"
	end
	if (params['status'] and params['status'][0]!="")
		productwhere+=" and z_products.status in ("
		first=0
		params['status'].each do |b|
			productwhere+="," if (first==1)
			productwhere+="'"+b+"'" 
			first=1
		end
		productwhere+=")"
	end
	if (params['series']['licensor_id'] and params['series']['licensor_id'][0]!="" )
		serieswhere+=" and z_series.licensor_id in ("
		first=0
		params['series']['licensor_id'].each do |b|
			serieswhere+="," if (first==1)
			serieswhere+="'"+b+"'" 
			first=1
		end
		serieswhere+=")"
	end
	puts productwhere
        puts serieswhere
	@products=Product.where(productwhere).joins(:series).where(serieswhere)
        render :layout=>false 
  end
	
end

