extends Camera2D

var mouse_pos
var touchEnabled := false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			touchEnabled = true
			mouse_pos = event.global_position
		else:
			touchEnabled = false
	
	if event is InputEventMouseMotion and touchEnabled:
		translate(mouse_pos - event.global_position)
		mouse_pos = event.global_position
