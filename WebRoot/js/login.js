$(document).ready(function(){
	$("#toReg").click(function() {
		$("#loginForm").hide("slow");
		$("#regForm").show();
		return false;
	});
	$("#toLogin").click(function() {
		$("#regForm").hide();
		$("#loginForm").show("slow");
		return false;
	});
	
	// $("#doLogin").click(function() {
	// 	for (i = 1; i < 5; i++)
	// 		{
	// 			$('#lonForms').animate({
	// 				'right': '+=15'
	// 			}, 3, function() {
	// 				$(this).animate({
	// 					'right': '-=30'
	// 				}, 3, function() {
	// 					$(this).animate({
	// 						'right': '+=15'
	// 					}, 3, function() {
	// 						$(this).animate({
	// 							'right': 100
	// 						}, 3, function() {
	// 							// shock end
	// 						});
	// 					});
	// 				});
	// 			});
	// 		}
	// 	return false;
	// });
});