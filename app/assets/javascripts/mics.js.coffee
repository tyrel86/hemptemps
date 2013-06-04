jQuery ->
	#Center triangle over on active link item
	parrent_width = $(".triangle").parent().width()
	center_left_attr = parseInt( parrent_width / 2 )
	$(".triangle").css("left",center_left_attr)

	#Activate Hover menus
	$('#sti-menu').iconmenu()
