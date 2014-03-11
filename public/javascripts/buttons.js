var modified=0;

function general_delete()
{
	controller=$("#controller_type").val();
	id=$("#id").val();
        $.ajax("/"+controller+"/delete", {
                data: { id: $("#id").val() } ,
                error : function() { alert("error"); } ,
                success:  function(data,textStatus,jqXHR) {
                        $("#mainbody").html("");
			modified=0;
		}
	});
}

function general_save()
{
	controller=$("#controller_type").val();
	// Update CKEDITOR fields
	for (instance in CKEDITOR.instances)
		CKEDITOR.instances[instance].updateElement();
	$('textarea').trigger('keyup'); // Why?  Dont know, it was in a online example.
	
	data=$("form").serialize();
	$.ajax("/"+controller+"/save",{ data : $("form").serialize(), 
		error: function(jqXHR, textStatus, errorThrown) { 
			$("#save_errors").html(jqXHR.responseText);
		} ,
		success: function(data,textStatus,jqXHR) { 
			// Destroy existing Dialogs before reloading
                        $(".ui-dialog").each( function() {
                                name=$(this).attr("aria-describedby");
                                $("#"+name).dialog("destroy");
                        } );

			$("#mainbody").html(data);
			modified=0;
		}
	});
	
}

function general_changelog()
{
	model=$("#controller_type").val();
	id=$("#id").val();
	$.ajax("/changelogs/form", { 
		data: { model: model, model_id: id } ,
		error: function() { alert("error"); } ,
		success: function(data,textStatus,jqXHR) { 
			$("#mainbody").html(data);
			modified=0;
		}
	});
}


function series_new() { $("#dialog-newseries").dialog("open"); }
function property_new() { $("#dialog-newproperty").dialog("open"); }
function property_changelog() { }
 
function property_setup() { 
	$("#property_delete").click(general_delete);
	$("#property_new").click( property_new); 
	$("#property_save").click(general_save);
	$("#property_changelog").click(property_changelog);
	$("#series_new").click( series_new); 

}


function menubar_buttons() { 
	$("#menubar li").mouseenter(function() { $(this).addClass('selected'); });
	$("#menubar li").mouseleave(function() { $(this).removeClass('selected'); }); 
}

$().ready(function() { menubar_buttons(); } );



