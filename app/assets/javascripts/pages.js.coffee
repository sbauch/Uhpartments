# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# 
# function showLocation(position) {
#   var latitude = position.coords.latitude;
#   var longitude = position.coords.longitude;
# 	alert (position.coords.latitude);
# 	
# 	}
# 
# function errorHandler(err) {
# 	  if(err.code == 1) {
# 	    alert("Error: Access is denied!");
# 	  }else if( err.code == 2) {
# 	    alert("Error: Position is unavailable!");
# 	  }
# 	}
# 
# function getLocation(){
# 
# 	   if(navigator.geolocation){
# 	      // timeout at 60000 milliseconds (60 seconds)
# 	      var options = {timeout:60000};
# 	      navigator.geolocation.getCurrentPosition(showLocation, 
# 	                                               errorHandler,
# 	                                               options);
# 	   }else{
# 	      alert("Sorry, browser does not support geolocation!");
# 	   }
# 	}