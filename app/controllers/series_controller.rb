class SeriesController < ApplicationController
  # GET /series
  # GET /series.xml
  def index
    render :action=>"form", :layout=>"home"
  end
 
  # GET /series/form/1
  def form
	@series=Series.find_by_id(params[:id]) if !params[:id].nil?
	render :layout=>false;
  end


  # GET /series/new
  # GET /series/new.xml
  def new
    #confirm the data
    if params[:series_title].nil? or params[:series_title]==""
	render :text=>"Series require a title", :status=>500
	return
    end
    if params[:property_id].nil? or params[:property_id]==""
	render :text=>"Series must have a parent Property", :status=>500
	return
    end
    @series = Series.new
    @series.name=params[:series_title]
    @series.property_id=params[:property_id]
    @series.save
    render :layout=>false, :action=>"form"
  end

  def delete
    series=Series.find_by_id(params[:id])
    if (series)
            series.deleted=1
            series.save
    end
    render :nothing=>true
  end

  def save
    @series=Series.find_by_id(params[:id])
    params[:series].each_pair do |key, val|
	@series[key]=val
    end
    @series.save!
    render :action=>"form", :layout=>false
  end

  def newbisac
    @series=Series.find_by_id(params[:series_id])
    bisac=@series.series_bisac.find_by_bisac_id(params[:bisac_id])
    if !bisac
      bisac=@series.series_bisac.new()
      bisac.bisac_id=params[:bisac_id]
      bisac.save
    end
    render :action=>"form", :layout=>false
  end

  def newgenre
    @series=Series.find_by_id(params[:series_id])
    genre=@series.series_genre.find_by_genre_id(params[:genre_id])
    if !genre
      genre=@series.series_genre.new()
      genre.genre_id=params[:genre_id]
      genre.save
    end
    render :action=>"form", :layout=>false
  end
  def newterritory
    @series=Series.find_by_id(params[:series_id])
    territory=@series.series_territory.find_by_territory_id(params[:territory_id])
    if !territory
      territory=@series.series_territory.new()
      territory.territory_id=params[:territory_id]
      territory.save
      #add to each existing product
      @series.products.each do |p|
	pt=p.product_territory.find_by_territory_id(params[:territory_id])
        if !pt
	  pt=p.product_territory.new()
          pt.territory_id=params[:territory_id]
          pt.save
        end
      end
    end
    render :action=>"form", :layout=>false
  end

  def delete_genre
    r=SeriesGenre.find_by_id(params[:id])
    if r
      r.delete
    end
    render :nothing=>true
  end
  def delete_bisac
    r=SeriesBisac.find_by_id(params[:id])
    if r
      r.delete
    end
    render :nothing=>true
  end
  def delete_territory
    r=SeriesTerritory.find_by_id(params[:id])
    if r
      series_id=r.series_id
      territory_id=r.territory_id
      r.delete
      # delete from each product in the series
      series=Series.find_by_id(series_id)
      if series
        series.products.each do |p|
	  pt=p.product_territory.find_by_territory_id(territory_id)
          if pt
            pt.delete
          end
        end
      end
    end
    render :nothing=>true
  end

end
