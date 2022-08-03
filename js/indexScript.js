function chooseLevel(id){
	document.getElementById("easy").style.backgroundColor="#76de76";
    document.getElementById("medium").style.backgroundColor="#76de76";
    document.getElementById("hard").style.backgroundColor="#76de76";
    document.getElementById(id).style.backgroundColor="violet";
    document.getElementById("level").value=id;
}

function viewTable(){
	
    btn = document.getElementById("prevScoresBtn");
    
    if(btn.innerText === "Hide Previous Scores"){
        btn.innerText = "View Previous Scores";
    }
    else{
        btn.innerText= "Hide Previous Scores";
    }
    
    if(document.getElementById("table").style.display=="none"){
        document.getElementById("table").style.display = "block";
    }
    else{
        document.getElementById("table").style.display = "none";
    }
}

window.onpageshow = function(event){
	if(event.persisted){
		location.reload();
	}
}

$(document).ready(function(){
	$.ajax({
		type:'POST',
		url: 'SetPlayer',
		success: function(result){
			let userID = result.trim();
			$('#userIdDisplay').append(userID);
			if(userID === "guest"){
				$('#prevScoresBtn').css('display','none');
			}
			
			if(userID!="guest"){
				$.ajax({
					type:'POST',
					url: 'RecordsTable',
					success: function(result){
						console.log(result);
						for(var ind=1;ind<=result.length;ind++){
							$('#tableRows').append("<tr><td>"+ind+"</td><td>"+result[ind-1]["level"]+"</td><td>"+result[ind-1]["word"]+"</td><td>"+result[ind-1]["score"]+"</td><td>"+result[ind-1]["attempts"]+"</td><td>"+result[ind-1]["clue"]+"</td></tr>");
						}
						if(result.length==0){
							$('#tableRows').append("<tr><td colspan=\"6\">No Previous Games</td></tr>");
						}
					},
					error: function(result){
						alert("error");
					}
				});
			}
		},
		error: function(result){
			location.reload();
		}
	});
	
	$('#playBtn').click(function(){
		var level = $('#level').val();
		$.ajax({
			type:'POST',
			data: {level:level},
			url: 'WordGeneratorServlet', 
			success: function(result){
				window.location = "wordgame.html";
			},
			error: function(result){
				alert("error");
			}
		});
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