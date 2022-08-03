$(document).ready(function(){
	let coins = 0;
	let str = "";
	$.ajax({
			type:'POST',
			url: 'GetObject', 
			success: function(result){
				console.log(result);
				let player = result[0], word = result[1], guess = result[2];
				coins = player["coins"];
				str = word["guessedWord"];
				
				$('#useridDisplay').append(player['userID']);
				$("#coinsCount").html("X &nbsp;&nbsp;"+player["coins"]);
				$("#attemptCount").html(" : &nbsp;&nbsp;"+word["attempts"]);
				$("#scoreCount").html("Score : "+word["score"]);
				
				let otherPos = guess["wrongPos"];
				if(otherPos.length>0 && otherPos[0]!= ' '){
					$('#otherPosition').css('display','block');
					let output = "<p style=\"display: inline;\">At Other Position: &nbsp;</p>";
					for(let ind=0;ind<otherPos.length;ind++){
						output+="<p style=\"display: inline;\" class=\"letter-box\">" + otherPos[ind] + "</p>";
					}
					$('#otherPosition').html(output);	
				}
				
				if(player["coins"]<20){
					$('#clueImg').attr('src','images/no-clue.png')
				}
				
				let output = ""; 
			    for(let i=0;i<str.length;i++){
					if(str[i]=='_'){
			    		output+="<input class=\"letter-container\" id=\"ch" + i +"\" type=\"text\" maxlength=\"1\" value='' >"; 
			    	}
			    	else{
						output+="<input class=\"letter-container\" id=\"ch" + i +"\" type=\"text\" maxlength=\"1\" value='"+str[i]+"' disabled>";
					} 
			    }
			    $("#word-container").html(output);
			},
			error: function(result){
				window.location = "index.html";
			}
		});
    
    $('#guess').click(function(){
        var myData = {};
        for(let i=0;i<str.length;i++){
            myData['ch'+i] = $('#ch'+i).val();
        }
        $.ajax({
			type:'POST',
			data: myData,
			url: 'WordGameProgress',
			success: function(result){
				console.log(result);
				var word = result[0],guess = result[1];
				if(word['guessedWord']==word['actualWord']){
					window.location = "gameOver.html";
				}
				
				str = word['guessedWord'];
				
				for(var ind=0;ind < str.length;ind++){
					if(word['guessedWord'][ind]=='_'){
						$('#ch'+ind).val('');
					}
					else{
						$('#ch'+ind).val(word['guessedWord'][ind]);
						$('#ch'+ind).prop('disabled', true);
					}
					
				}
				
				otherPos ="";
				if(guess['wrongPos'].length>0){
					for(let ind=0;ind<guess['wrongPos'].length;ind++){
						otherPos+=guess['wrongPos'][ind];
					}
				}
				
				if(otherPos.length>0){
					$('#otherPosition').css('display','block');
					let output = "<p style=\"display: inline;\">At Other Position: &nbsp;</p>";
					for(let ind=0;ind<otherPos.length;ind++){
						output+="<p style=\"display: inline;\" class=\"letter-box\">" + otherPos[ind] + "</p>";
					}
					$('#otherPosition').html(output);
				}
				else{
					$('#otherPosition').css('display','none');
				}
				
				$("#scoreCount").html("Score : "+word['score']);
				$("#attemptCount").html(": &nbsp;&nbsp;"+word['attempts']);
				
			},
			error: function(result){
				alert("someError");
			}
        	
		});
        
    });
    
    $('#clueImg').click(function(){
    	if(coins>=20){
			$.ajax({
				type:'GET',
				url: 'WordGameProgress',
				success: function(result){
					
					if(result[0]['guessedWord']==result[0]['actualWord']){
						window.location = "gameOver.html";
					} 
					
					$('#ch'+result[0]["clueInd"]).val(result[0]["actualWord"][result[0]["clueInd"]]);
					$('#ch'+result[0]["clueInd"]).prop('disabled', true);
					coins-=20;
					$("#coinsCount").html("X &nbsp;&nbsp;"+coins);
					if(coins<20){
		        		$('#clueImg').attr('src','images/no-clue.png')
		        	}
					
					otherPos = result[1]['wrongPos'];
					
					if(otherPos.length>0){
						$('#otherPosition').css('display','block');
						let output = "<p style=\"display: inline;\">At Other Position: &nbsp;</p>";
						for(let ind=0;ind<otherPos.length;ind++){
							output+="<p style=\"display: inline;\" class=\"letter-box\">" + otherPos[ind] + "</p>";
						}
						$('#otherPosition').html(output);
					}
					else{
						$('#otherPosition').css('display','none');
					}
				},
				error: function(result){
					alert("error");
				}
			});
    	}
	});
    
});