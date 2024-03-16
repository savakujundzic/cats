extends Area2D

var gold : int = 0
var level = 1
var timer : int = 0
var clicks_on_mine = 0
@onready var mine = $"."

@onready var level_label = $Level
@onready var time_left = $time_left
@onready var upgrade_time = $upgrade_time
@onready var upgrade_mine_button = $upgrade_mine_button
@onready var remove_mine_button = $remove_mine_button
@onready var main = $".."
@onready var mine_array = main.mines

'''
	when left click is pressed
'''
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	level_label.visible = true
	clicks_on_mine = clicks_on_mine + 1
	upgrade_mine_button.visible = true
	remove_mine_button.visible = true

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
	print("gold : ", gold)
	print("timer : ", timer)
	print("level : ", level)
	print()

func _process(_delta):
	if clicks_on_mine % 2 == 0:
		upgrade_mine_button.visible = false
		remove_mine_button.visible = false
		level_label.visible = false
	if upgrade_time.time_left == 0:
		time_left.visible = false
	level_label.text = str("Level\n",level)
	time_left.set_text(str(upgrade_time.get_time_left()).pad_decimals(1))

func _on_upgrade_mine_button_pressed():
	if level == 1 and timer < 1:
		timer = timer + 10
	if level == 2 and timer < 1:
		timer = timer + 10
	if level == 3 and timer < 1:
		timer = timer + 10
	if level == 4 and timer < 1:
		timer = timer + 10
	# check whether the timer is still going and if it is then stop it
	if upgrade_time.time_left > 0:
		upgrade_time.stop()
	else:
		time_left.visible = true
		upgrade_time.wait_time = timer
		upgrade_time.start()
		upgrade_time.one_shot = true
	if upgrade_time.time_left == 0:
		time_left.visible = false




func _on_remove_mine_button_pressed():
	mine_array.erase(mine)
	mine.queue_free()
