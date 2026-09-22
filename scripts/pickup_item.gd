extends Area2D
#Taget från en tutorial

@onready var game_manager = %GameManager

func _ready():
	body_entered.connect(_on_body_entered)
	
	
func _on_body_entered(body):
	if body.name == "Player":

		game_manager.add_coin()
		#removes the coin node
		queue_free()
