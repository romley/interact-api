// app js
// jonathan romley for prophecy ventures llc
// last update: 29 August 2012


// global vars for geolocation
var myLat;
var myLong;

$(window).ready(function(){  
        // prompt user to authorize geolocation  
        function initiate_geolocation() {  
            navigator.geolocation.getCurrentPosition(handle_geolocation_query);  
        }  
  
        function handle_geolocation_query(position){  
            myLat = position.coords.latitude;
            myLong = position.coords.longitude;
        }  
        initiate_geolocation(); 
     
    // handle button tap events    	
	$("#like").live("tap", function(event){
	log('like');
	});
 	$("#share").live("tap", function(event){
	log('share');
	});
	 $("#comment").live("tap", function(event){
	log('comment');
	});
        });  

// log the action and throw response from server
function log(action){
	log.action = action;
	var action = log.action;
	//alert(action);
		$.post("../log.php",
 		{ uid: "1", action: log.action, longitude: window.myLong, latitude: window.myLat},	
 		function(data) {
   		 alert(data.stat);
 		}, "json");	 
 	}
	

	
