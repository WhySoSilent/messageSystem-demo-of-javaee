$(document).ready(function(){

	//选择学校
	$("button.formAction").click(function() {
		var cid = $(this).closest('div.aCollege').attr("data-cid");
		$("input.roleCollege").attr("value",cid);
		
		$(this).closest('#steps').addClass("step2");
		//alert(cid);
	});

	//选择角色
	$("div.roleButton").click(function() {
		$("div.roleButton").removeClass("active");
		$(this).addClass("active");
		
		var role = $(this).attr("data-role");
		$("input.roleInfo").attr("value",role);
		$("div#forms").removeClass("teacher");
		$("div#forms").removeClass("student");
		$("div#forms").addClass(role);
		
		//$("form#infos")[0].submit();
		
	});

	
	$("a#reBack").click(function() {
		$(this).closest('#steps').removeClass("step2");
	});

	
	

});