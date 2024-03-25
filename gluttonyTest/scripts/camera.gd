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

func _physics_process(delta):
	if Input.is_action_just_released('scrolldown'):
		zoom.x = max(1.0, zoom.x - 0.05)
		zoom.y = max(1.0, zoom.y - 0.05)
	if Input.is_action_just_released('scrollup'):
		zoom.x = min(3.0, zoom.x + 0.05)
		zoom.y = min(3.0, zoom.y + 0.05)


