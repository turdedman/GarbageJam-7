extends Node
# Taget från en tutorial

var totalcoins: int = 7
var coins = 0
@onready var pickup_item_label = $CanvasLayer/PickupItemLabel



func add_coin():
	coins += 1
	pickup_item_label.text = "Coins: " + str(coins)+ "/" + str(totalcoins)
	if coins >= totalcoins:
		call_deferred("change_scene")
	
func change_scene():
	get_tree().change_scene_to_file("res://scenes/ending_scene.tscn")
