function datatable_delete()
{
	// delete img parent =.dttd  parent of that =.dttr
	// parent of that =.dtbody  parent of that=.datatable
	var id=$(this).parent().parent().attr("model_id");
	var model=$(this).parent().parent().parent().parent().attr("model");
	var row=$(this).parent().parent();

      	$.ajax("/"+model+"/delete/", {
                data: { id: id } ,
       		 	error : function() { alert("error"); } ,
              		success:  function(data,textStatus,jqXHR) {
				// remove the row from the datatable
				row.remove();
               		}
       	} );
}

function setup_datatables()
{
	$(".datatable").each(function() { 
		var number=$(".dtth",this).length;
		newwidth=(100/number)+"%";
		$(".dtth",this).css("width",newwidth);
		$(".dttd",this).css("width",newwidth);
		$(".dtbody",this).css("height", $(this).height()-18);
       	 	$(this).resizable({ alsoResize: $(this).find(".dtbody") });
		$(".delete").off().click( datatable_delete);
		
	});

} 
