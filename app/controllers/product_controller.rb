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
    render :layout=>false, :action=>"form"
  end

  def delete
    product=Series.find_by_id(params[:id])
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

 

end
