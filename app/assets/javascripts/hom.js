$(document).on('turbolinks:load', function() {
 $("#login").click(function(){
   $('#login-modal').fadeIn();
 });

 $('#signup-show').click(function(){
 	$('#signup-modal').fadeIn();
 });
 
 $('#guest-login').click(function(){
	 $('#guest-login-modal').fadeIn();
 });

 $('.close-modal').click(function(){
 	$('#login-modal').fadeOut();
	$('#signup-modal').fadeOut();
	$('#guest-login-modal').fadeOut();
 });

});