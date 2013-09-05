$(document).ready(function() {
	$("form#create_user").submit(function(){
		if ($('#password').val() != $('#matching_password').val()){ 
			alert("your passwords don't match");
			return false;
		}
	});
});
