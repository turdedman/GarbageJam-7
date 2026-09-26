extends Node
# Taget från en tutorial

var totalcoins: int = 7
var coins = 0
@onready var pickup_item_label = $CanvasLayer/PickupItemLabel


	
func _process(delta):
	
	if $CanvasLayer/GameWinLabel.visible == true:
		$CanvasLayer/ReturnToMenuLabel.visible = true
		
		if Input.is_action_pressed("enter"):
			get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
		
		
		
	
func add_coin():
	coins += 1
	pickup_item_label.text = "Coins: " + str(coins)+ "/" + str(totalcoins)
	
	
func change_scene(scene_path: String):
	get_tree().change_scene_to_file(scene_path)
