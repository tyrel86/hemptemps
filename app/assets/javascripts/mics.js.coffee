jQuery ->
	#Center triangle over on active link item
	parrent_width = $(".triangle").parent().width()
	center_left_attr = parseInt( parrent_width / 2 )
	$(".triangle").css("left",center_left_attr)

	#Activate Hover menus
	$('#sti-menu').iconmenu()

	$("nav#menu").css('width','990px')

	$("input[name='hemp_temp[job_type]']").change( ->
		$("form .section").css('display','none')
		show_id = $(this).attr('id')
		$("form .section#" + show_id).css('display','block')
	)

	$("#hemp_temp_badged").change( ->
		badged = $(this).val()
		unless badged
			alert("You must have a badge to work in the MMJ industry. Please see http://www.colorado.gov/cs/Satellite/Rev-MMJ/CBON/1251592985101 for instructions and return here when you are eligble")
	)

	
