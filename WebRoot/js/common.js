$(document).ready(function(){
	$(".popover").popover();
	$("ul.tooltips li").tooltip();


	//首页代码
	$("#pubInput").focus(function() {
		$(this).closest('.esayPub').addClass("active");
	});
	
	//.esayPub层内的点击事件让停止冒泡  
	$(".esayPub").click(function(event){  
	    event=event||window.event;  
	    event.stopPropagation();  
	}); 
	//点击.esayPub层外，隐藏这个层。由于层内的事件停止了冒泡，所以不会触发这个事件  
	$(document).click(function(e){                       
    	$(".esayPub").removeClass("active");
    	$('.aDongtai').removeClass("active");
  
	}); 
//---------------------------------------------------------动态的回复功能代码
	$("div.moreAbout, ul.optionThis").click(function(event){  
	    event=event||window.event;  
	    event.stopPropagation();  
	});
	$("div#dongtai").delegate('a.response','click',function(event){  
	    $(this).closest('.aDongtai').addClass("active");
	    event=event||window.event;  
	    event.stopPropagation();  
	});
	//--------------------------------------
	//测试动态绑定私信编辑窗口

	$("div#dongtai").delegate('.toSendSixin','click',function(){
		var json_sixinRole = {};
		json_sixinRole.userId = $(this).closest("div.userCard").attr("data-userId");
		json_sixinRole.name = $(this).closest("div.userCard").attr("data-userName");;

		var output = Mustache.render($("#tmpl_sixinSender").html(),json_sixinRole);
		$("div#sixinInputDialog").html(output);
		$('#sixinSender').modal();
	});

	//动态绑定私信发送功能


	//--------------------------------------
	//模拟从服务器获取某用户数据
	$("div#dongtai").delegate('.userProper','mouseover',function(){
		//如果没有本地缓存的话，填充ajax请求的示例...
			$(this).attr('data-content',"<div class='loading forUserCard'><h4>正在为你询问数据...</h4><img src='img/loading.gif'></div>");
		$(this).popover('show');
		$(this).attr('data-content',"");
		$content = $(this).next().find(".popover-content");
		function insertInfo() {
			var json_userCard = {
					"id": "1120126",
					"userRole": "teacher",
					"name": "wang",
					"departments": "电子信息工程学院",
					"class": "软件外包1111",
					"metas": {
						"focus": 20,
						"courses": 12
					}
				};
			var output = Mustache.render($("#tmpl_userCard").html(),json_userCard);
			$content.html(output);
		}
		setTimeout(insertInfo,2000);
		//alert($(this).attr('class'));
		return false;
	});
	//--------------------------------------
	//获取外部模板文件
	// $.get('template.html', function(templates) {
	// 	alert("templates:" + templates);
	// 	//var template = $(templates).html();

	// 	//$Mustache.render(template, view);

	// });
});