extends Node2D

var total_gold : int
var mines := []
var no_of_mines : int
var build_cost = 50
var mine_list := []
@onready var shop = $Camera2D/shop
@onready var goldcounter = get_node("Camera2D/gold/gold")
@onready var shop_button = $Camera2D/shop_button
@onready var tile_map = $TileMap

func _ready():
	shop.visible = false
	shop_button.visible = true
	get_node("TileMap").add_mine.connect(_on_tilemap_add_mine)
	get_node("Mine").destroy_mine.connect(_on_mine_destroy_mine)
	for i in get_children():
		if(i.is_in_group('mine') and i not in mines):
			mines.append(i)
	no_of_mines = mines.size()
	
func _process(delta):
	print(mine_list)
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
'''
	emitter : TileMap
	signal  : add_mine
	reciever: Main
'''
func _on_tilemap_add_mine(mine : Area2D, build_cost : int):
	var mine1 = "mine1"
	var level = 1
	var mine1_dict = { "name" : mine1, "level" : level}
	mine_list.append(mine1_dict)
	mines.append(mine)
	mine.destroy_mine.connect(_on_mine_destroy_mine)
	no_of_mines += 1
	print(no_of_mines)
	
'''
	emitter : Mine
	signal  : destroy_mine
	reciever: Main
'''
func _on_mine_destroy_mine(mine : Area2D):
	mines.erase(mine)

func _on_shop_button_pressed():
	shop.visible = true 
	shop_button.visible = false

func _on_exit_pressed():
	shop_button.visible = true
	shop.visible = false
