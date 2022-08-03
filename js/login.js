$(document).ready(function(){
	$('#signupSwitch').click(function(){
		$('#login').css("display",'none');
		$('#signup').css("display",'block');
	});
	
	$('#loginSwitch').click(function(){
		$('#login').css("display",'block');
		$('#signup').css("display",'none');
	});
	
	$('#GuestLoginBtn').click(function(){
		$('#j_username').val("guest");
		$('#j_password').val("guest");
	});
	
	$('#signupBtn').click(function() { 
		let userID = $('#j_usernames').val();
		let pswd = $('#j_passwords').val();
		$.ajax({
			type:'POST',
			data: {userID: userID, pswd: pswd},
			url: 'AddPlayer',
			success: function(result){
				if(result===1){
    				$('#j_username').val(userID);
        			$('#j_password').val(pswd);
        			$('#login').submit();
				}
				else{
					$("#stmt").html("User Already Exists!!").show().fadeOut(7000);
				}
			},
			error: function(result){
				alert("Error");
			}
		});	
	});  
});