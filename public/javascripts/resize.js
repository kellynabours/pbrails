
function hideSearch()
{
	$("#searchbar").css("position","relative");
	$("#searchbar").animate({left:"-300px"}, 1500,"swing",function() { 
		$("#searchbar").css("display","none");
		$("#searchbarcollapsed").css("display","block");
		$(window).trigger("resize");
	});
}

function showSearch()
{
	$("#searchbarcollapsed").css("display","none");
	$("#searchbar").css("display","block");
	$(window).trigger("resize");
	$("#searchbar").animate({left:"0px"}, 1500,"swing",function() { });
}



$().ready(function() { 
	$(window).resize(function() { 
		height=$(window).height()-65;
		$("#searchbar").css("height",height-20);
		$("#searchbarcollapsed").css("height",height-20);
		$("#middle").css("height",height-20);
		$("#right").css("height",height-87);


		newwidth=$(window).width();
		if ($("#searchbar").css('display')!="none") newwidth=newwidth-$("#searchbar").width()-2-5;
		if ($("#searchbarcollaps").css('display')!="none") newwidth=newwidth-$("#searchbarcollapsed").width()-2-5;
		$("#middle").width(newwidth);
		if ($("#right")) { newwidth=newwidth-$("#right").width();
			$("#left").width(newwidth-14);
		}
		

	});
	$(window).trigger("resize");
	$("#collapsesearch").click(hideSearch);
	$("#revealsearch").click(showSearch);
});

