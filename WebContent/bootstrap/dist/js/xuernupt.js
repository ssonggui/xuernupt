
 (function($) {
	  $.fn.cpagef = function(baseurl) {
  		
  			var arr = $(this).Attr("title").split(":");
  			var page = arr[0];
			var forum = arr[1];			
			var divid = "course"+forum;
			if(page>0)
			pajax(page,forum,divid);

		
  		
  		
  		function pajax(page,forum,divid) {
  			var htmlval = "";
			$.ajax(
					{
						type: "post",
						url: baseurl+"/coursepage",
						data: {page:page-1,forum:forum},
						dataType:"json",
						success:function(list){
	   						
	   						$.each(list, function(idx, obj){
							 		htmlval += "<p><a href=\""+baseurl+obj.url+"\"><h4>"+
							 		"<i class='icon-share-alt'>&nbsp;</i>"+obj.title+"</h4></a></p>"+
									"<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='icon-user'>&nbsp;</i>"+obj.ownername+"&nbsp;|&nbsp;发布时间：<small>"+obj.time+"</small></em>";	
	 						});
	   						
	   						
	   						 
	   						 $("#"+divid).html(htmlval);
	   						 $("#jvmpf"+forum).attr("title",page-1+":"+forum);
	   						 $("#jvmpn"+forum).attr("title",page-1+":"+forum);
   						}
					
					}
			);
  		} 
  		
	  };
	  
	  $.fn.cpagen = function(baseurl) {
	  		
			var arr = $(this).Attr("title").split(":");
			var page = arr[0];
			var forum = arr[1];			
			var divid = "course"+forum;
			if(page>0)
			pnajax(page,forum,divid);

		
		
		
		function pnajax(page,forum,divid) {
			var htmlval = "";
			$.ajax(
					{
						type: "post",
						url: baseurl+"/coursepage",
						data: {page:page+1,forum:forum},
						dataType:"json",
						success:function(list){
	   						
	   						$.each(list, function(idx, obj){
							 		htmlval += "<p><a href=\""+baseurl+obj.url+"\"><h4>"+
							 		"<i class='icon-share-alt'>&nbsp;</i>"+obj.title+"</h4></a></p>"+
									"<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='icon-user'>&nbsp;</i>"+obj.ownername+"&nbsp;|&nbsp;发布时间：<small>"+obj.time+"</small></em>";	
	 						});
	   						
	   						
	   						 
	   						 $("#"+divid).html(htmlval);
	   						 $("#jvmpf"+forum).attr("title",page+1+":"+forum);
	   						 $("#jvmpn"+forum).attr("title",page+1+":"+forum);
 						}
					
					}
			);
		} 
		
	  };
	})(jQuery);