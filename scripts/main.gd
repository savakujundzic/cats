extends Node2D

var total_gold : int
var mines := []
var no_of_mines : int
@onready var goldcounter = get_node("Camera2D/ui/gold")

func _ready():
	get_node("TileMap").add_mine.connect(_on_tilemap_add_mine)
	for i in get_children():
		if(i.is_in_group('mine') and i not in mines):
			mines.append(i)
	no_of_mines = mines.size()
	
func _process(delta):
	
	var total = 0
	for i in mines:
		total += i.gold
		print("mine ", i, ": ", i.gold)
	print("total: ", total)
	print()
	total_gold = total
	if goldcounter != null:
		goldcounter.text = str(total_gold)
	#print("No of mines : ", no_of_mines)

func _on_tilemap_add_mine(mine : Area2D):
	mines.append(mine)
	no_of_mines += 1
	print(no_of_mines)
