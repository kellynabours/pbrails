var searchresult;
var searchtype;

function loadPropertySearch() { loadItem("property",$(this).attr("model_id")); } 
function loadSeriesSearch() { loadItem("series",$(this).attr("model_id")); } 
function loadProductSearch() { loadItem("products",$(this).attr("model_id")); } 
function loadContactSearch() { loadItem("contacts",$(this).attr("model_id")); } 
function loadRolesSearch() { loadItem("role",$(this).attr("model_id")); } 

function loadItem(controller,id_in)
{ 
	$.ajax("/"+controller+"/form/", { 
		data: { id: id_in } ,
		error : function() { alert("error"); } ,
		success:  function(data,textStatus,jqXHR) { 
			// Destroy dialogs before loading new screen 
			$(".ui-dialog").each( function() { 
				name=$(this).attr("aria-describedby"); 
				$("#"+name).dialog("destroy");
		 	} );
			// load in new screen 
			$("#mainbody").html(data);
		}
	} );
}

function doSearch() { 
	searchtype=$("#selecttype").val();
	$.ajax( "/search", { 
		data:  { 
			searchtype: $("#selecttype").val()  ,
			searchvalue:  $("#searchfield").val(),
			encoding: "UTF-8",
			contentType: "text/plain; charset=UTF-8"
		},
		error : function() { alert("Error"); } ,
		success: function(data,textStatus,jqXHR) { 
			searchresult=data;
			// Data is a string of form: [ id, title ], ...
			
			if (searchtype=="property") {
			 	$("#searchresult").html(  searchresult);
				$("#searchresult tr.result").click(loadPropertySearch);
			}
			if (searchtype=="series")  {
				$("#searchresult").html( searchresult);
				$("#searchresult tr.result").click(loadSeriesSearch);
			}
			if (searchtype=="product") {
				$("#searchresult").html( searchresult);
				$("#searchresult tr.result").click(loadProductSearch);
			}
			if (searchtype=="contact") {
				$("#searchresult").html( searchresult);
				$("#searchresult tr.result").click(loadContactSearch);
			}

		},
	
 	});
} 

$().ready( function() { $("#searchbtn").click(doSearch); });

