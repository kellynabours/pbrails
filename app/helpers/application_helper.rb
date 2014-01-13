module ApplicationHelper
  def datatable( columnheaders, datarows, options={} )
        #datatable(["Role","First Name", "Last Name"], @series.roles ,[:name,:contact.first_name,:contact.last_name]  )

	thead = content_tag :div, :class=>"dttr" do
		columnheaders.collect { |ch| concat content_tag(:div, ch, :class=>"dtth") }.join().html_safe()
        end
        thead=content_tag(:div, thead, :class=>"dthead")

	tbody=datarows.collect { |row|
		id=row.shift
		content_tag :div, :class=>"dttr", :model_id=>id do
			row.collect { |col| concat content_tag(:div, col, :class=>"dttd") }.join().html_safe()
		end
	}.join().html_safe()
	tbody=content_tag(:div, tbody, :class=>"dtbody")
	
	content_tag(:div, thead+tbody, :class=>"datatable resizable",:model=>options[:model], :id=>options[:table_id] )
  end
end
