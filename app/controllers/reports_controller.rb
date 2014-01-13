class ReportsController < ApplicationController
  def index
    render :action=>"form", :layout=>"home"
  end
 
  # GET /series/form/1
  def form
    render :layout=>false
  end


  def new
  end

  def delete
  end

  def save
  end

  def generate
    report=Report.find_by_id(params[:reportid])
    if report
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet :name => 'Sheet1'
      rowcount=1
      row=sheet.row(0)
      report.report_field.order(:field_order).each do |f|
        row.push(f.field_title)
      end

      p=generate_results(report)
      p.each do |prod|
        row=sheet.row(rowcount)
        rowcount=rowcount+1
        report.report_field.order(:field_order).each do |f|
          row.push getValue(prod,f.field_table,f.field_column)
        end
      end

      spreadout = StringIO.new
      book.write spreadout
      @xlsname = "pb_report.xls"
      send_data spreadout.string, :filename => @xlsname, :type => "application/vnd.ms-excel"
    end
  end

  def generate_results(report)
   print "In generate results"
   tables=get_tables(report)
   print tables
   print "\n\r"
   wherecondition=""
   report.report_criteria.each do | rc|
     wherecondition+=" and " if wherecondition!=""
     wherecondition+=getTableName(rc.crit_table)+"."+rc.crit_column+rc.crit_comparison
     wherecondition+="'" if rc.crit_comparison!="in" 
     wherecondition+=rc.crit_value
     wherecondition+="'" if (rc.crit_comparison!="in") 
   end 
   print wherecondition+"\n\r"
   p=Product.joins(tables).where(wherecondition)
   return p
  end

  def getValue(p,t,c)
    if !p
      print "ERROR: empty product in getValue"
      return nil
    end
    case t
    when "series","z_series"
      return "" if !p.series
      return p.series[c]
    when "brand","z_brands"
      return p.brand[c] if p.brand
      #print "ERROR: no brand for prod"
      return ""
    when "z_products","product"
      if c=="price_usa"
        pt=p.product_territory.where(:territory_id=>1).first
        return pt.price if pt
        return 0.00
      end
      if c=="price_can"
        pt=p.product_territory.where(:territory_id=>2).first
        return pt.price if pt
        return 0.00
      end
      if c=="price_uk"
        pt=p.product_territory.where(:territory_id=>3).first
        return pt.price if pt
        return 0.00
      end
      return p[c]
    end
    return ""
  end

  def getTableName(tablenamein)
    case tablenamein
    when 'brand','z_brands'
      return 'pb_brands'
    when 'format','z_formats'
      return 'pb_formats'
    when 'product','z_products'
      return 'pb_products'
    when 'series','z_series'
      return 'pb_series'
    end 

    print "UNKNOWN TABLE:"+tablenamein+"\n\r"
    return :product
  end


  def getTable(tablenamein)
    case tablenamein
    when 'brand','z_brands'
      return :brand
    when 'format','z_formats'
      return :format
    when 'product','z_products'
      return :product
    when 'series','z_series'
      return :series
    when 'z_products_digital'
      return :product
    when 'z_licensors'
      return :licensor
    when 'z_product_statuses'
      return :product
    end 

    print "UNKNOWN TABLE:"+tablenamein+"\n\r"
    return :product
  end

  def get_tables(report)
    result=[]
    report.report_criteria.each do |rc|
      table=getTable(rc.crit_table)
      if !result.include? table
        result.push(table)
      end
    end
    return result
  end
  

end
