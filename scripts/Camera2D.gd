extends Camera2D
var touch = false
var mouse_pos = Vector2()


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			touch = true
			mouse_pos = event.position
		else:
			touch = false
	elif event is InputEventMouseMotion and touch:
		var mouseposition = mouse_pos - event.position
		translate(mouseposition)
		mouse_pos = event.position
