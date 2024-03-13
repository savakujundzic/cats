extends Node2D

var total_gold : int
var mines = []
@onready var goldcounter = get_node("Camera2D/ui/gold")

func _ready():
	for i in get_children():
		if(i.is_in_group('mine')):
			mines.append(i)
	print(mines.size())
	
func _process(delta):
	var total = 0
	for i in mines:
		total += i.gold 
	total_gold = total
	if goldcounter != null:
		goldcounter.text = str(total_gold)
