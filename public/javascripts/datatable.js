function datatable_delete()
{
	// delete img parent =.dttd  parent of that =.dttr
	// parent of that =.dtbody  parent of that=.datatable
	var id=$(this).parent().parent().attr("model_id");
	var model=$(this).parent().parent().parent().parent().attr("model");
	var row=$(this).parent().parent();

      	$.ajax("/"+model+"/delete/", {
                data: { id: id } ,
       		 	error : function() { alert("error in datatable_delete"); } ,
              		success:  function(data,textStatus,jqXHR) {
				// remove the row from the datatable
				row.remove();
               		}
       	} );
}

function datatable_submit(e)
{
	if (e && e.keyCode==13)
	{
		var id=$(this).parent().attr("model_id");
		var model=$(this).parent().parent().parent().attr("model");
		var field=$(this).attr("field");
		var val=$("input",this).val();
		var t=$(this);
		$.ajax("/"+model+"/editfield/",{
			data: { id:id, newval:val, field:field },
			success: function(data,textStatus,jqXHR) { 
				t.html(val);
				t.off().click(datatable_edit);
			},
			error: function() { alert("error in datatable_submit"); }
		});
		e.preventDefault();
	}
}

function datatable_edit()
{
	$(this).removeClass("dteditable");
	$(this).off("click");
	text=$(this).html();
	$(this).html("<form action='#'><input type='text' name='val' value='"+text+"' style='height:"+($(this).parent().height()-8)+"px;width:"+($(this).width()-6)+"px; margin-top:0px;'></form>");
	$(this).keypress(datatable_submit);
}

function setup_datatables()
{
	$(".datatable").each(function() { 
		$(".dtbody",this).css("height", $(this).height()-18);
       	 	$(this).resizable({ alsoResize: $(this).find(".dtbody") });
		$(".delete").off().click( datatable_delete);
		
	});
	$(".dteditable").off("click").click(datatable_edit);

} 
