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
func _physics_process(delta):
	if Input.is_action_just_released('scrolldown'):
		zoom.x = max(1.0, zoom.x - 0.05)
		zoom.y = max(1.0, zoom.y - 0.05)
	if Input.is_action_just_released('scrollup'):
		zoom.x = min(3.0, zoom.x + 0.05)
		zoom.y = min(3.0, zoom.y + 0.05)
