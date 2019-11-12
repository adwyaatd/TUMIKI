$(document).on('turbolinks:load', function(){
	$('li').on('click','#logout',function(){
		$('#logout-modal').fadeIn();
	});

	$('#logout-no,.close-modal').on('click',function(){
		$('#logout-modal').fadeOut();
	});
});