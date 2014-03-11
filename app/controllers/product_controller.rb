class ProductController < ApplicationController
  # GET /product
  # GET /product.xml
  def index
    render :action=>"form", :layout=>"home"
  end
 
  # GET /product/form/1
  def form
	@product=Product.find_by_id(params[:id]) if !params[:id].nil?
	render :layout=>false;
  end


  # GET /product/new
  # GET /product/new.xml
  def new
    if params[:product_title].nil? or params[:product_title]==""
	render :text=>"Products require a title",:status=>500
	return
    end
    if params[:series_id].nil? or params[:series_id]==""
	render :text=>"Products require a series"
	return
    end
    @product=Product.new
    @product.name=params[:product_title]
    @product.series_id=params[:series_id]
    @product.save 
    render :layout=>false, :action=>"form"
  end

  def delete
    product=Product.find_by_id(params[:id])
    if (product)
            product.deleted=1
            product.save
    end
    render :nothing=>true
  end

  def save
    @product=Product.find_by_id(params[:id])
    params[:product].each_pair do |key, val|
	@product[key]=val
    end
    @product.save!
    render :action=>"form", :layout=>false
  end

  def newterritory
    @product=Product.find_by_id(params[:product_id])
    territory=@product.product_territory.find_by_territory_id(params[:territory_id])
    if !territory
      territory=@product.product_territory.new()
      territory.territory_id=params[:territory_id]
      territory.save
    end
    render :action=>"form", :layout=>false
  end

  def delete_territory
    r=ProductTerritory.find_by_id(params[:id])
    if r
      r.delete
    end
    render :nothing=>true
  end

  def assignisbn
	prod=Product.find(params[:product_id])
	if (!prod)  
		render :text=>"No Products Selected",:status=>500
		return
	end
	if prod.isbn and prod.isbn!=""
		render :text=>"ISBN already assigned",:status=>500
		return
	end
	isbn=Isbn.where("used=0").first
	if !isbn
		render :text=>"CRITICAL ERROR: all ISBNs have been used",:status=>500
		return
        end
        isbn.used=1
        isbn.save
	prod.isbn=isbn.isbn_code
        prod.isbn13=computeisbn13(isbn.isbn_code)
        prod.save
	render :text=>prod.isbn+","+prod.isbn13
  end

  def assignupc
	prod=Product.find(params[:product_id])
	if !prod
		render :text=>"No Product Selected",:status=>500
		return
	end
	if prod.upc and prod.upc!=""
		render :text=>"UPC already assigned",:status=>500
		return
	end
	upc=Upc.where("used=0").first
	if !upc
		render :text=>"CRITICAL ERROR: all UPCs have been used",:status=>500
		return
	end
	upc.used=1
	upc.save
	prod.upc=upc.upc_code
	prod.save
	render :text=>prod.upc
  end

  def computeisbn13(isbn)
    calccheck="978"+isbn.gsub("-","")
    sum=calccheck[0].to_i+3*calccheck[1].to_i+calccheck[2].to_i+3*calccheck[3].to_i+calccheck[4].to_i+3*calccheck[5].to_i+calccheck[6].to_i+3*calccheck[7].to_i+calccheck[8].to_i+3*calccheck[9].to_i+calccheck[10].to_i+3*calccheck[11].to_i
    digit=10-(sum%10)
    if (digit==10) 
      digit=0
    end 
    return "978-"+isbn[0..11]+digit.to_s    
  end

  def edit_territory
    render nothing:true
  end

end
