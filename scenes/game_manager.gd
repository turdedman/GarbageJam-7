extends Node
# Taget från en tutorial

var coins = 0
@onready var pickup_item_label = $CanvasLayer/PickupItemLabel



func add_coin():
	coins += 1
	pickup_item_label.text = "Coins: " + str(coins)
