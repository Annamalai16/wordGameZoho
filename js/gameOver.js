window.onpageshow = function(event){
	if(event.persisted){
		location.reload();
	}
}

$(document).ready(function(){
	
	$.ajax({
			type:'POST',
			url: 'GetObject', 
			success: function(result){
				let player = result[0], word = result[1];
				$('#word').html("Word: " + word["actualWord"]);
				$('#score').html("Score: " + word["score"]);
				$('#attempts').html("Attempts: " + word["attempts"]);
				$('#clues').html("Clues Used: " + word["clueCount"]);
				if(player["userID"]!=="guest"){
					$('#coins').html("<img src=\"images/coins.png\" style=\"float: left; height: 30px;\"> &nbsp; gained:" + word["score"]);
				}
				else{
					$('#homeBtn').text("Play Again");
				}
				$('#useridDisplay').append(player["userID"]);
			},
			error: function(result){
				window.location = "index.html";
			}
		});
		
	$('#logout').click(function(){
		$.ajax({
			type:'GET',
			url: 'RecordsTable', 
			success: function(result){
				window.location = "index.html";	
			},
			error: function(result){
				alert("error");
			}
		});
	});
});