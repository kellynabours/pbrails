module ApplicationHelper


  def datatable( columnheaders, datarows, options={} )
        #datatable(["Role","First Name", "Last Name"], @series.roles ,[:name,:contact.first_name,:contact.last_name]  )
	if !options[:widths]
		options[:widths]=columnheaders.collect {|ch| (100/columnheaders.length).to_s+"%"}
	end
	
	if !options[:classes]
		options[:classes]=columnheaders.collect{ |ch| "dttd"}
	else
		options[:classes]=options[:classes].collect { |ch|  "dttd "+ch}
	end

	if !options[:fields]
		options[:fields]=columnheaders.collect{ |ch| ""}
	end
		

	widths=options[:widths].clone
	thead = content_tag :div, :class=>"dttr" do
		columnheaders.collect { |ch| concat content_tag(:div, ch, :class=>"dtth",:style=>"width:"+widths.shift.to_s) }.join().html_safe()
        end
        thead=content_tag(:div, thead, :class=>"dthead")

	tbody=datarows.collect { |row|
		id=row.shift
		widths=options[:widths].clone
		classes=options[:classes].clone
		fields=options[:fields].clone
		content_tag :div, :class=>"dttr", :model_id=>id do
			row.collect { |col| concat content_tag(:div, col,:field=>fields.shift,:class=>classes.shift,:style=>"width:"+widths.shift.to_s) }.join().html_safe()
		end
	}.join().html_safe()
	tbody=content_tag(:div, tbody, :class=>"dtbody")
	
	content_tag(:div, thead+tbody, :class=>"datatable resizable",:model=>options[:model], :id=>options[:table_id] )
  end

end
