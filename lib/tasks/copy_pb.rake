#!/usr/bin/env ruby
require 'rubygems'
require 'tempfile'


task :copy_pb => :environment do

  desc "Copy all formats from PB into Formats"
  Oldpb.connection.select_all("select * from z_formats").each do |f|
    format=Format.unscoped.find_by_id(f["id"])
    if (!format)
      format=Format.new()
      format.id=f["id"]
      format.web_relevant=f["web_relevant"]
      format.name=f["format"]
      format.save
    end
  end

  desc "Copy all Parent Series from pb into Properties"

  Oldpb.connection.select_all("select * from z_series where id in (select distinct parentSeries_id from z_series)").each do |s| 
    prop=Property.unscoped.find_by_id(s["id"])
    if !prop
      prop=Property.new()
      prop.id=s["id"]
      prop.title=s["name"]
      prop.save
    end
  end

  desc "Copy in all brands, licensors, trimsizes, orientations, ratings"
  Oldpb.connection.select_all("select * from z_brands").each do |b|
    brand=Brand.unscoped.find_by_id(b["id"])
    if !brand
      brand=Brand.new()
      brand.id=b["id"]
      brand.name=b["brand"]
      # b["brand_amazon"] is no longer used.
      brand.imprint_code=b["imprint_code"]
      brand.edition_code_tp=b["edition_code_tp"]
      brand.edition_code_hc=b["edition_code_hc"]
      brand.edition_code_bs=b["edition_code_bs"]
      brand.save
    end
  end
  Oldpb.connection.select_all("select * from z_licensors").each do |l|
    licensor=Licensor.unscoped.find_by_id(l["id"])
    if !licensor
      licensor=Licensor.new()
      licensor.id=l["id"]
      licensor.name=l["name"]
      licensor.save
    end
  end
  Oldpb.connection.select_all("Select * from z_ratings").each do |r|
    rating=Rating.unscoped.find_by_id(r["id"])
    if !rating
      rating=Rating.new()
      rating.id=r["id"]
      rating.name=r["rating"]
      rating.save
    end
  end
  Oldpb.connection.select_all("select * from z_product_trimsizes").each do |t|
    trimsize=ProductTrimsize.unscoped.find_by_id(t["id"])
    if !trimsize
      trimsize=ProductTrimsize.new()
      trimsize.id=t["id"]
      trimsize.name=t["name"]
      trimsize.save
    end
  end
  Oldpb.connection.select_all("select * from z_bisacs").each do |b|
    bisac=Bisac.unscoped.find_by_id(b["id"])
    if !bisac
      bisac=Bisac.new
      bisac.id=b["id"]
      bisac.code=b["code"]
      bisac.description=b["description"]
      bisac.save
    end
  end
  Oldpb.connection.select_all("select * from z_genres").each do |g|
    genre=Genre.unscoped.find_by_id(g["id"])
    if !genre
      genre=Genre.new()
      genre.id=g["id"]
      genre.name=g["genre"]
      genre.save
    end
  end

  desc "Copy all child Series from pb into Series "

  Oldpb.connection.select_all("select * from z_series").each do |s|
    prop=Property.unscoped.find_by_id(s["id"])
    if !prop
      series=Series.unscoped.find_by_id(s["id"])
      if !series
        if s["parentSeries_id"]=="" || s["parentSeries_id"]==nil
          s["parentSeries_id"]=0
        end
        series=Series.new()
        series.id=s["id"]
        series.name=s["name"]
        series.property_id=s["parentSeries_id"]
        series.synopsis=s["synopsis"]
        series.licensor_id=s["licensor_id"]
        series.brand_id=s["brand_id"]
        series.rating_id=s["rating_id"]
        series.format_id=s["format_id"]
        series.number_volumes=s["number_volumes"]
        series.original_publisher=s["oroginal_publisher"]
        series.series_status=s["series_status"]
        series.priority=s["priority"]
        series.product_trimsize_id=s["product_trimsize_id"]
        series.release_frequency=s["factsheet_release_frequency"]
        series.saleshandle=s["factsheet_handle"]
        series.keypoints=s["keypoints"]
	series.sellingpoints=s["sellingpoints"]
        if s["cover_id"]=="1"
          series.cover="soft"
        end
        if s["cover_id"]=="2"
          series.cover="hard"
        end
        if s["orientation_id"]=="1"
          series.orientation="LtoR"
        end
        if s["orientation_id"]=="2"
          series.orientation="RtoL"
        end
        if s["orientation_id"]=="3"
          series.orientation="N/A"
        end
        series.save
      end
    end
  end
 
  Oldpb.connection.select_all("select * from z_series_bisacs").each do |b|
    sb=SeriesBisac.unscoped.find_by_id(b["id"])
    if !sb
      sb=SeriesBisac.new()
      sb.id=b["id"]
      sb.series_id=b["series_id"]
      sb.bisac_id=b["bisac_id"]
      sb.save
    end
  end

  Oldpb.connection.select_all("select * from z_series_genres").each do |g|
    sg=SeriesGenre.unscoped.find_by_id(g["id"])
    if !sg
      sg=SeriesGenre.new()
      sg.id=g["id"]
      sg.series_id=g["series_id"]
      sg.genre_id=g["genre_id"]
      sg.save
    end
  end

  desc "Copy all Products from pb "
  Oldpb.connection.select_all("select z_products.*,z_product_statuses.name as status  from z_products left outer join z_product_statuses on z_products.product_status_id= z_product_statuses.id").each do |p|
    prod=Product.unscoped.find_by_id(p["id"])
    if !prod
      prod=Product.new()
      prod.id=p["id"]
      prod.name=p["name"]
      prod.series_id=p["series_id"]
      prod.isbn=p["isbn"]
      prod.isbn13=p["isbn13"]
      prod.short_description=p["short_description"]
      prod.brand_id=p["brand_id"]
      prod.format_id=p["format_id"]
      prod.rating_id=p["rating_id"]
      prod.subtitle=p["subtitle"]
      prod.volume_number=p["volume_number"]
      prod.product_description=p["product_description"]
      prod.print_extras=p["PrintExclusive"]
      prod.whv_fert=p["whv_fert"]
      prod.whv_vid_vers_num=p["whv_vid_vers_num"]
      prod.cat_code=p["cat_code"]
      prod.date_viz_ship=p["date_viz_ship"]
      prod.date_ss=p["date_ss"]
      prod.date_diamond_ship=p["date_diamond_ship"]
      prod.date_street=p["date_street"]
      prod.whv_order_due=p["whv_order_due"]
      prod.whv_ship=p["whv_ship"]
      prod.whv_street_date=p["whv_street_date"]
      prod.exclusivity_note=p["exclusivity_note"]
      prod.product_trimsize_id=p["product_trimsize_id"]
      prod.length=p["length"]
      prod.issue_number=p["issue_number"].to_i
      prod.edition=p["edition"].to_i
      prod.status=p["status"]

      if p["orientation_id"]=="1"
        prod.orientation="LtoR"
      end
      if p["orientation_id"]=="2"
        prod.orientation="RtoL"
      end
      if p["orientation_id"]=="3"
        prod.orientation="N/A"
      end
      if p["publish_to_web"]=="Yes"
        prod.publish_to_web = 1 
      end
      if p["art_id"]=="1"
        prod.art="b/w"
      end
      if p["art_id"]=="2"
        prod.art="color"
      end
      if p["art_id"]=="3"
        prod.art="b/w & color"
      end
      prod.save
    end
  end

  desc "Copy all users and changelogs into pb"
  user=User.unscoped.find_by_id(0)
  if !user
     user=User.new()
     user.id=0
     user.name="System"
  end
  Oldpb.connection.select_all("select * from z_users").each do |u|
    user=User.unscoped.find_by_id(u["id"])
    if !user
	user=User.new()
        user.id=u["id"]
        user.name=u["username"]
        user.group_id=u["group_id"]
        user.save
    end
  end
  
#  Oldpb.connection.select_all("select * from z_changelogs").each do |c|
#    cl=Changelog.find_by_id(c["id"])
#    if !cl
# 	cl=Changelog.new()
#	cl.id=c["id"]
#	cl.created_at=c["created"]
# 	cl.user_id=c["user_id"]
#	cl.model=c["model"]
#	cl.model_id=c["model_id"]
#	cl.action=c["action"]
#	cl.changelog=c["change"]
#	cl.save
#    end
#  end

  desc "Copy territory information"
  Oldpb.connection.select_all("select * from z_territories").each do |t|
    ter=Territory.unscoped.find_by_id(t["id"])
    if !ter
	ter=Territory.new()
	ter.id=t["id"]
	ter.name=t["name"]
	ter.name_abbrev=t["name_abbrev"]
	ter.save
    end
  end
  Oldpb.connection.select_all("select * from z_series_territories").each do |t|
    ter=SeriesTerritory.unscoped.find_by_id(t["id"])
    if !ter
      ter=SeriesTerritory.new()
      ter.id=t["id"]
      ter.series_id=t["series_id"]
      ter.territory_id=t["territory_id"]
      ter.save
    end
  end
  Oldpb.connection.select_all("select * from z_products_territories").each do |t|
    ter=ProductTerritory.unscoped.find_by_id(t["id"])
    if !ter
      ter=ProductTerritory.new()
      ter.id=t["id"]
      ter.product_id=t["product_id"]
      ter.territory_id=t["territory_id"]
      ter.save
    end
  end

  desc "Copy reports"
  Oldpb.connection.select_all("select * from z_reports").each do |r|
    rep=Report.unscoped.find_by_id(r["id"])
    if !rep
      rep=Report.new()
      rep.id=r["id"]
      rep.name=r["name"]
      rep.save
    end
  end
  Oldpb.connection.select_all("select * from z_reports_criterias").each do |r|
    rep=ReportCriterium.unscoped.find_by_id(r["id"])
    if !rep
      rep=ReportCriterium.new()
      rep.id=r["id"]
      rep.report_id=r["report_id"]
      rep.crit_table=r["crit_table"]
      rep.crit_column=r["crit_column"]
      rep.crit_value=r["crit_value"]
      rep.crit_comparison=r["crit_comparison"]
      rep.crit_desc=r["crit_desc"]
      rep.save
    end
  end
  Oldpb.connection.select_all("select * from z_reports_fields").each do |r|
    rep=ReportField.unscoped.find_by_id(r["id"])
    if !rep
      rep=ReportField.new()
      rep.id=r["id"]
      rep.report_id=r["report_id"]
      rep.field_order=r["field_order"]
      rep.field_table=r["field_table"]
      rep.field_column=r["field_column"]
      rep.field_title=r["field_desc"]
      rep.field_sheet=r["field_sheet"]
      rep.fixed_value=r["fixed_value"]
      rep.save
    end
  end
  
end

