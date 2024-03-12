extends Area2D

var gold = 0
var level = 1
var timer : int = 0
@onready var ui = $"../Camera2D/ui"
@onready var goldcounter =  $"../Camera2D/ui/gold"
@onready var level_label = $Level
@onready var time_left = $time_left
@onready var upgrade_time = $upgrade_time


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	if level == 1 and timer < 1:
		timer = timer + 10
	if level == 2 and timer < 1:
		timer = timer + 10
	if level == 3 and timer < 1:
		timer = timer + 10
	if level == 4 and timer < 1:
		timer = timer + 10
	if upgrade_time.time_left > 0:
		upgrade_time.stop()
	else:
		time_left.visible = true
		upgrade_time.wait_time = timer
		upgrade_time.start()
		upgrade_time.one_shot = true
	if upgrade_time.time_left == 0:
		time_left.visible = false
	
func _on_upgrade_time_timeout():
	level = level + 1



func _on_timer_timeout():
	if level == 1:
		gold += 50
	if level == 2:
		gold += 100
	if level == 3:
		gold += 150
	if level == 4:
		gold += 200
	print(gold)
	goldcounter.text = str(gold)
	print("timer is", timer)
	print("level is", level)

func _process(_delta):
	if upgrade_time.time_left == 0:
		time_left.visible = false
	level_label.text = str("Level\n",level)
	time_left.set_text(str(upgrade_time.get_time_left()).pad_decimals(1))



