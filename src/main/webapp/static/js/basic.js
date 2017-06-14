$('.navmain').click(function() {
	$(this).next('.subnav').slideToggle('slow');
	$(this).parent().prevAll().find('.subnav').slideUp('slow');
	$(this).parent().prevAll().find('.subnav a').removeClass('active');
	$(this).parent().nextAll().find('.subnav').slideUp('slow');
	$(this).parent().nextAll().find('.subnav a').removeClass('active');

	$(this).next('.subnav').find('a').each(function(index) {
		$(this).click(function() {
			$(this).addClass('active');	
			$(this).parent().prevAll().find('a').removeClass('active');
			$(this).parent().nextAll().find('a').removeClass('active');
		});
		
	});

});
