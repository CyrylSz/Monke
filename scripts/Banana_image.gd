extends Sprite2D

#
#var predkosc_znikania = Vector2(0.02,0.02)
#func _process(delta):
#	var parent_node = get_parent()
#	if parent_node:
#		var banany_starego = parent_node.bananas
#		if banany_starego >= 1:
#			scale -= predkosc_znikania * delta
#			if scale < Vector2(0.005,0.005):
#				visible = false
#				banany_starego -= 1
